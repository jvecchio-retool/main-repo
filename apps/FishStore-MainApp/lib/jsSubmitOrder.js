// Submit order to workflow, reduce inventory, and clear cart

console.log('Cart items:', cartItems.value);
console.log('Current user:', current_user);

// Trigger the workflow (params are set on the submitOrder query itself)
await submitOrder.trigger();

// Reduce inventory in the database
await jsReduceInventory.trigger();

// Clear the cart after successful submission
cartItems.setValue([]);

return { success: true, message: 'Order submitted and inventory updated!' };