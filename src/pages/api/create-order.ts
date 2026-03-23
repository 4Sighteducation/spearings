import type { APIRoute } from 'astro';
import Stripe from 'stripe';
import { isDateAvailable } from '../../lib/dates';
import {
  createOrder,
  getOrderByIdempotencyKey,
  updateOrderPaymentIntent,
  type CreateOrderInput,
} from '../../lib/order';

import { getEnv } from '../../lib/env';

const stripe = new Stripe(getEnv('STRIPE_SECRET_KEY'));

function json(data: any, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'Content-Type': 'application/json' },
  });
}

function buildStripeDescription(reference: string, customerName: string) {
  return `${reference} - ${customerName} - Items: Pies`;
}

export const POST: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();
    const { items, customer, delivery, notes, idempotency_key: idempotencyKey } = body;

    if (!items?.length) {
      return json({ error: 'No items in order' }, 400);
    }
    if (!customer?.name || !customer?.email) {
      return json({ error: 'Customer name and email are required' }, 400);
    }
    if (!delivery?.date || !delivery?.type) {
      return json({ error: 'Delivery date and type are required' }, 400);
    }

    const dateOk = await isDateAvailable(delivery.date);
    if (!dateOk) {
      return json({ error: 'Selected date is not available' }, 400);
    }

    const input: CreateOrderInput = {
      items,
      customer,
      delivery,
      notes,
      idempotencyKey: typeof idempotencyKey === 'string' ? idempotencyKey : undefined,
    };

    // Idempotent replay: same browser session + cart fingerprint → one order, one PaymentIntent
    if (input.idempotencyKey) {
      const existing = await getOrderByIdempotencyKey(input.idempotencyKey);
      if (existing) {
        if (existing.status && existing.status !== 'pending') {
          return json(
            {
              error:
                'This checkout session was already used. Open the pie menu to start a fresh order.',
            },
            409,
          );
        }
        if (existing.stripe_client_secret) {
          return json({
            order_reference: existing.reference,
            client_secret: existing.stripe_client_secret,
            subtotal: existing.subtotal,
            shipping: existing.shipping,
            total: existing.total,
            idempotent_replay: true,
          });
        }
        // Order row exists but PaymentIntent never attached (rare) — create PI now
        const paymentIntent = await stripe.paymentIntents.create({
          amount: existing.total,
          currency: 'gbp',
          automatic_payment_methods: {
            enabled: true,
            allow_redirects: 'always',
          },
          description: buildStripeDescription(existing.reference, existing.customer_name),
          metadata: {
            order_reference: existing.reference,
            order_id: existing.id,
            customer_email: customer.email,
          },
        });
        await updateOrderPaymentIntent(
          existing.id,
          paymentIntent.id,
          paymentIntent.client_secret!,
        );
        return json({
          order_reference: existing.reference,
          client_secret: paymentIntent.client_secret,
          subtotal: existing.subtotal,
          shipping: existing.shipping,
          total: existing.total,
        });
      }
    }

    let order;
    try {
      order = await createOrder(input);
    } catch (err: any) {
      // Parallel duplicate POST with same idempotency key — second insert lost the race
      if (input.idempotencyKey) {
        const replay = await getOrderByIdempotencyKey(input.idempotencyKey);
        if (replay?.stripe_client_secret) {
          return json({
            order_reference: replay.reference,
            client_secret: replay.stripe_client_secret,
            subtotal: replay.subtotal,
            shipping: replay.shipping,
            total: replay.total,
            idempotent_replay: true,
          });
        }
        if (replay && !replay.stripe_client_secret) {
          const paymentIntent = await stripe.paymentIntents.create({
            amount: replay.total,
            currency: 'gbp',
            automatic_payment_methods: {
              enabled: true,
              allow_redirects: 'always',
            },
            description: buildStripeDescription(replay.reference, replay.customer_name),
            metadata: {
              order_reference: replay.reference,
              order_id: replay.id,
              customer_email: customer.email,
            },
          });
          await updateOrderPaymentIntent(replay.id, paymentIntent.id, paymentIntent.client_secret!);
          return json({
            order_reference: replay.reference,
            client_secret: paymentIntent.client_secret,
            subtotal: replay.subtotal,
            shipping: replay.shipping,
            total: replay.total,
          });
        }
      }
      throw err;
    }

    const paymentIntent = await stripe.paymentIntents.create({
      amount: order.total,
      currency: 'gbp',
      automatic_payment_methods: {
        enabled: true,
        allow_redirects: 'always',
      },
      description: buildStripeDescription(order.reference, customer.name),
      metadata: {
        order_reference: order.reference,
        order_id: order.orderId,
        customer_email: customer.email,
      },
    });

    await updateOrderPaymentIntent(order.orderId, paymentIntent.id, paymentIntent.client_secret!);

    return json({
      order_reference: order.reference,
      client_secret: paymentIntent.client_secret,
      subtotal: order.subtotal,
      shipping: order.shipping,
      total: order.total,
    });
  } catch (err: any) {
    console.error('create-order error:', err);
    return json({ error: err.message || 'Order creation failed' }, 500);
  }
};
