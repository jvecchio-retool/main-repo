UPDATE fish_species 
SET quantity = quantity - {{ currentQuantityToReduce.value }}
WHERE id = {{ currentFishId.value }}
RETURNING *