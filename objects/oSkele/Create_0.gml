event_inherited();

get_damage_create(120);
max_HP = 120;

move_spd = 0.4;
damage = 5;

// Loot table
loot_table = [oMagicalSkull];

// get loot
LootTable(oSkele);

experience_points = irandom_range(5, 20);

alarm[1] = 1;