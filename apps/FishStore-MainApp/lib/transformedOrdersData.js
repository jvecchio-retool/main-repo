// Transform the orders dataset with formatted order_contents
const rawData = {{ queryNewOrders.data }};
const data = formatDataAsArray(rawData);

return data.map((order) => {
  const contents = order.order_contents;

  // Format order_contents as multi-line text
  let formattedContents = '';

  if (contents) {
    // Try multiple possible structures
    let items = null;

    // Structure 1: { orderItems: [...] }
    if (contents.orderItems && Array.isArray(contents.orderItems)) {
      items = contents.orderItems;
    }
    // Structure 2: Direct array
    else if (Array.isArray(contents)) {
      items = contents;
    }
    // Structure 3: The contents itself might be the items
    else if (contents.fishName || contents.fishId) {
      items = [contents];
    }

    // Format the items if we found them
    if (items && items.length > 0) {
      formattedContents = items.
      map((item) => {
        const name = item.fishName || item.common_name || 'Unknown Fish';
        const qty = item.quantity || 0;
        return `${name} (Qty: ${qty})`;
      }).
      join('\n');
    } else {
      // Show the raw JSON structure so we can see what it actually looks like
      formattedContents = JSON.stringify(contents, null, 2);
    }
  }

  // Return the order with the formatted contents
  return {
    ...order,
    order_contents: formattedContents,
    order_contents_raw: typeof contents === 'object' ? JSON.stringify(contents) : contents };

});