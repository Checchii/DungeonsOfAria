function LootTable(_enemy){
	
	// given an enemy instance exists,
	// access its respective loot table array, randomly pick an index
	// then when that enemy instance is destroyed, create the item
	enemy = _enemy;
	
	// will give us an index number 
	random_loot = random(array_length(enemy.loot_table));
	
	dropped_loot = enemy.loot_table[random_loot]
	
	return dropped_loot;

}