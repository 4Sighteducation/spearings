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
        await sendOrderConfirmationEmails(result.reference);
        return json({ confirmed: true, reference: result.reference, emailsSent: true });
      } catch (emailErr: any) {
        console.error('[confirm-payment] Email send failed:', emailErr);
        return json({
          confirmed: true,
          reference: result.reference,
          emailsSent: false,
          emailError: emailErr?.message || 'Email failed',
        });
      }
    }

    return json({ confirmed: false, message: 'Order already confirmed or not found' });
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
