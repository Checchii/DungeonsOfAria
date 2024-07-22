/// @description Insert description here
// You can write your code in this editor

depth = -100001;

// show shop window
toggleOn = false;

// gui stuff
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

scale = 1;

// shop slots
store_slots = 7;

store_slots_width = 4;
store_slots_height = 3;

x_buffer = 2;
y_buffer = 2;

cell_size = 32;


// mouse info
selected_slot = 0;
pickup_slot = -1;

mouse_slotX = 0;
mouse_slotY = 0;

// sprites
spr_store_ui = sShop;
spr_store_items = sItems;

// columns and rows of item sprites 
spr_shop_items_columns = sprite_get_width(spr_store_items)/cell_size;
spr_shop_items_rows = sprite_get_height(spr_store_items)/cell_size;

store_ui_height = 149;
store_ui_width = 191;

store_ui_x = (gui_width * 0.5) - (store_ui_width * 0.5 * scale);
store_ui_y = (gui_height * 0.5) - (store_ui_height * 0.5 * scale);


// shop slots
slots_x = store_ui_x  + (12 * scale);
slots_y = store_ui_y + (14 * scale);

/*
// item descriptions
desc_x = store_ui_x  + (16 * scale);
desc_y = store_ui_y + (196 * scale);
*/

// data structure for shop items and value
ds_shop_items = ds_grid_create(2, store_slots);

// ITEM			- 0
// COST			- 1
var z = 0, i = 0;
ds_shop_items[# z, i] = items.redPotion;
ds_shop_items[# z, i++] = items.redPotion;
ds_shop_items[# z, i++] = items.bluePotion;
ds_shop_items[# z, i++] = items.ringOfManaRegen;
ds_shop_items[# z, i++] = items.necklaceofHealth;
ds_shop_items[# z, i++] = items.tomeOfFlames;
ds_shop_items[# z, i++] = items.staffOfFire;
ds_shop_items[# z, i++] = items.tomeOfLightning;

z = 1; i = 0;
ds_shop_items[# z, i] = 1;
ds_shop_items[# z, i++] = 3;
ds_shop_items[# z, i++] = 3;
ds_shop_items[# z, i++] = 10;
ds_shop_items[# z, i++] = 10;
ds_shop_items[# z, i++] = 15;
ds_shop_items[# z, i++] = 20;
ds_shop_items[# z, i++] = 1;

// struct for items and description taken from Inventory object
ds_shop_item_info = inv.ds_item_info;
