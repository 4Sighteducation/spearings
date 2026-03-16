import type { APIRoute } from 'astro';
import Stripe from 'stripe';
import { isDateAvailable } from '../../lib/dates';
import { createOrder, updateOrderPaymentIntent } from '../../lib/order';

import { getEnv } from '../../lib/env';

const stripe = new Stripe(getEnv('STRIPE_SECRET_KEY'));

export const POST: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();
    const { items, customer, delivery, notes } = body;

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

    const order = await createOrder({ items, customer, delivery, notes });

    const paymentIntent = await stripe.paymentIntents.create({
      amount: order.total,
      currency: 'gbp',
      automatic_payment_methods: { enabled: true },
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

function json(data: any, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'Content-Type': 'application/json' },
  });
}
