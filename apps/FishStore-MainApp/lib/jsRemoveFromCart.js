// Remove the selected fish from the cart
const currentCart = cartItems.value || [];
const rowToRemove = tableCart.selectedSourceRow;

if (!rowToRemove || !rowToRemove.id) {
  return null;
}

// Filter out the item with matching id
const newCart = currentCart.filter((item) => item.id !== rowToRemove.id);

cartItems.setValue(newCart);

return null;