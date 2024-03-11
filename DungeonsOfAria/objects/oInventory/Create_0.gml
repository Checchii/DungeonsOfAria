// #macro INVENTORTY_SLOTS 10 // number of slots in inventory

row_length = 4; // number of slots that fit in one row

// create our inventory
inventory = array_create(INVENTORTY_SLOTS, -1);
randomize();

// empty slot is -1 NOT 0
inventory[0] = 0;
inventory[1] = 0;
inventory[2] = 1;

visible = 0;

depth = -1005;

invX = 0;
invY = 0;




