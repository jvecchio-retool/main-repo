// Get the clicked fish data directly from the ImageGrid component
// The 'i' variable should contain the clicked item's index
const data = queryFishView.data || {};

console.log('Index i:', i);
console.log('All data:', data);

// Extract the clicked fish from columnar data using the global 'i'
const clickedFish = {
  id: data.id?.[i],
  common_name: data.common_name?.[i],
  scientific_name: data.scientific_name?.[i],
  image: data.image?.[i],
  quantity: data.quantity?.[i],
  diet: data.diet?.[i],
  temperament: data.temperament?.[i],
  min_tank_gallons: data.min_tank_gallons?.[i],
  care_notes: data.care_notes?.[i] };


console.log('Clicked fish:', clickedFish);

// Update selectedFish variable and show modal
selectedFish.setValue(clickedFish);
modalFishDetails.setHidden(false);

return null;