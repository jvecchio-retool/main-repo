// Reduce inventory for each cart item using the reduceOneFishQuantity SQL query

const items = cartItems.value || [];
const fishData = formatDataAsArray(queryFishView.data);

for (const item of items) {
  // Find current fish to verify we have enough stock
  const currentFish = fishData.find((fish) => fish.id === item.id);

  if (currentFish && currentFish.quantity >= item.quantity) {
    // Set the variables that the SQL query references
    currentFishId.setValue(item.id);
    currentQuantityToReduce.setValue(item.quantity);

    // Trigger the SQL UPDATE query
    await reduceOneFishQuantity.trigger();
  } else {
    console.warn(`Insufficient stock for fish ID ${item.id}`);
  }
}

// Refresh the fish data to show updated quantities
await queryFishView.trigger();

return { success: true, itemsProcessed: items.length };