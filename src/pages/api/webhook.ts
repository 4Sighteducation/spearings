import type { APIRoute } from 'astro';
import Stripe from 'stripe';
import { confirmOrderFromStripePaymentIntent, failOrder } from '../../lib/order';
import { sendOrderConfirmationEmails } from '../../lib/email';

import { getEnv } from '../../lib/env';

const stripe = new Stripe(getEnv('STRIPE_SECRET_KEY'));
const webhookSecret = getEnv('STRIPE_WEBHOOK_SECRET');

export const POST: APIRoute = async ({ request }) => {
  const body = await request.text();
  const sig = request.headers.get('stripe-signature');

  if (!sig || !webhookSecret) {
    return new Response('Missing signature or webhook secret', { status: 400 });
  }

  let event: Stripe.Event;
  try {
    event = stripe.webhooks.constructEvent(body, sig, webhookSecret);
  } catch (err: any) {
    console.error('Webhook signature verification failed:', err.message);
    return new Response('Invalid signature', { status: 400 });
  }

  switch (event.type) {
    case 'payment_intent.succeeded': {
      const pi = event.data.object as Stripe.PaymentIntent;
      const result = await confirmOrderFromStripePaymentIntent(pi);
      if (result) {
        console.log(`Order ${result.reference} confirmed for ${result.email}`);
        await sendOrderConfirmationEmails(result.reference);
      }
      break;
    }

    case 'payment_intent.payment_failed': {
      const pi = event.data.object as Stripe.PaymentIntent;
      await failOrder(pi.id);
      console.log(`Payment failed for intent ${pi.id}`);
      break;
    }
  }

  return new Response(JSON.stringify({ received: true }), {
    status: 200,
    headers: { 'Content-Type': 'application/json' },
  });
};
