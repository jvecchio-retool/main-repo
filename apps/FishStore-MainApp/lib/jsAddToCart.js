// Add or update selected fish in cartItems
// Line item structure: { id, common_name, quantity }

const currentCart = cartItems.value || [];
const fish = selectedFish.value || {};
const qty = numberInputQuantity.value || 0;

// Guard conditions: invalid qty or no fish id
if (!fish.id || qty <= 0) {
  return null;
}

// See if fish is already in cart
const existingIndex = currentCart.findIndex((item) => item.id === fish.id);

let newCart;
if (existingIndex >= 0) {
  // Update existing line item's quantity (sum quantities)
  newCart = currentCart.map((item, idx) =>
  idx === existingIndex ?
  { ...item, quantity: item.quantity + qty } :
  item);

} else {
  // Add new line item
  newCart = [
  ...currentCart,
  {
    id: fish.id,
    common_name: fish.common_name,
    quantity: qty }];


}

cartItems.setValue(newCart);
modalFishDetails.setHidden(true);

return null;