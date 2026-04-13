// Transform order_contents JSON into multi-line text format
const data = formatDataAsArray({{ queryNewOrders.data }});

return data.map((order) => {
  const contents = order.order_contents;

  // If order_contents is empty or null, return empty string
  if (!contents || !contents.orderItems || !Array.isArray(contents.orderItems)) {
    return '';
  }

  // Format each fish item into a line
  const lines = contents.orderItems.map((item) =>
  `${item.fishName} (Qty: ${item.quantity})`);


  return lines.join('\n');
});