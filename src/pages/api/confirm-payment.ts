import type { APIRoute } from 'astro';
import Stripe from 'stripe';
import { confirmOrderFromStripePaymentIntent } from '../../lib/order';
import { sendOrderConfirmationEmails } from '../../lib/email';

import { getEnv } from '../../lib/env';

const stripe = new Stripe(getEnv('STRIPE_SECRET_KEY'));

export const POST: APIRoute = async ({ request }) => {
  try {
    const { payment_intent } = await request.json();

    if (!payment_intent) {
      return json({ error: 'Missing payment_intent' }, 400);
    }

    const pi = await stripe.paymentIntents.retrieve(payment_intent);

    if (pi.status !== 'succeeded') {
      return json({ error: 'Payment not yet succeeded', status: pi.status }, 400);
    }

    const result = await confirmOrderFromStripePaymentIntent(pi);

    if (result) {
      console.log(`Order ${result.reference} confirmed, sending emails...`);
      await sendOrderConfirmationEmails(result.reference);
      return json({ confirmed: true, reference: result.reference });
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
