/** Thrown from createOrder for expected client mistakes — maps to HTTP 400. */
export class OrderValidationError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'OrderValidationError';
  }
}
