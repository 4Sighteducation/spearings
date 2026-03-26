import type { APIRoute } from 'astro';
import Stripe from 'stripe';
import { confirmOrderFromStripePaymentIntent } from '../../lib/order';
import { sendOrderConfirmationEmails } from '../../lib/email';

import { getEnv } from '../../lib/env';
import { supabaseAdmin } from '../../lib/supabase-server';

const stripe = new Stripe(getEnv('STRIPE_SECRET_KEY'));

export const POST: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();
    let paymentIntentId: string | undefined =
      typeof body.payment_intent === 'string' ? body.payment_intent.trim() : undefined;

    if (!paymentIntentId && typeof body.reference === 'string' && body.reference.trim()) {
      const { data: row } = await supabaseAdmin
        .from('orders')
        .select('stripe_payment_intent_id')
        .eq('reference', body.reference.trim())
        .maybeSingle();
      paymentIntentId = row?.stripe_payment_intent_id ?? undefined;
    }

    if (!paymentIntentId) {
      return json({ error: 'Missing payment_intent or unknown order reference' }, 400);
    }

    const pi = await stripe.paymentIntents.retrieve(paymentIntentId);

    if (pi.status !== 'succeeded') {
      return json({ error: 'Payment not yet succeeded', status: pi.status }, 400);
    }

    const result = await confirmOrderFromStripePaymentIntent(pi);

    if (result) {
      console.log(`Order ${result.reference} confirmed via confirm-payment, sending emails...`);
      try {
        const emailOutcome = await sendOrderConfirmationEmails(result.reference);
        return json({
          confirmed: true,
          reference: result.reference,
          emailsSent: emailOutcome === 'sent' || emailOutcome === 'skipped_already_sent',
          emailOutcome,
          path: 'pending_to_confirmed',
        });
      } catch (emailErr: any) {
        console.error('[confirm-payment] Email send failed:', emailErr);
        return json({
          confirmed: true,
          reference: result.reference,
          emailsSent: false,
          emailError: emailErr?.message || 'Email failed',
          path: 'pending_to_confirmed_email_failed',
        });
      }
    }

    /**
     * Webhook often confirms the order first; confirmOrder* then returns null and we used to
     * skip emails entirely — so a failed webhook email had no browser retry.
     */
    const { data: existing, error: existingErr } = await supabaseAdmin
      .from('orders')
      .select('reference, status')
      .eq('stripe_payment_intent_id', paymentIntentId)
      .maybeSingle();

    if (existingErr) {
      console.error('[confirm-payment] lookup by payment intent failed:', existingErr);
    }

    if (existing?.status === 'confirmed' && existing.reference) {
      console.log(
        `[confirm-payment] Order ${existing.reference} already confirmed — recovery email path (webhook likely ran first)`,
      );
      try {
        const emailOutcome = await sendOrderConfirmationEmails(existing.reference);
        return json({
          confirmed: true,
          reference: existing.reference,
          emailsSent: emailOutcome === 'sent' || emailOutcome === 'skipped_already_sent',
          emailOutcome,
          path: 'already_confirmed_recovery',
        });
      } catch (emailErr: any) {
        console.error('[confirm-payment] Recovery email send failed:', emailErr);
        return json({
          confirmed: true,
          reference: existing.reference,
          emailsSent: false,
          emailError: emailErr?.message || 'Email failed',
          path: 'already_confirmed_recovery_email_failed',
        });
      }
    }

    return json({
      confirmed: false,
      message: 'Order not found or could not confirm',
      phase: 'no_transition',
      paymentIntentId,
      orderStatus: existing?.status ?? null,
      reference: existing?.reference ?? null,
    });
  } catch (err: any) {
    console.error('confirm-payment error:', err);
    return json({ error: err.message || 'Confirmation failed' }, 500);
  }
};

function json(data: any, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'Content-Type': 'application/json' },
  });
}
