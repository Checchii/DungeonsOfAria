/// @description 
depth = -9999;

// show inventory
toggleOn = false;

// gui stuff
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

scale = 0.7;

slotsFree = 17;
invPos = 0;

selected_slot = 0;
pickup_slot = -1;

mouse_slotX = 0;
mouse_slotY = 0;

// --- improved inventory stuff --- 
inv_slots = 30;
inv_slots_width = 5;
inv_slots_height = 6;
cell_size = 32;
x_buffer = 2;
y_buffer = 2;

equip_slots = 8;
equip_buffer_x = 91;
equip_buffer_y = 3; 

spr_inv_ui = sImprovedInventory;

inv_ui_width = 351;
inv_ui_height = 273;

spr_inv_items = sItems;

spr_inv_items_columns = sprite_get_width(spr_inv_items)/cell_size;
spr_inv_items_rows = sprite_get_height(spr_inv_items)/cell_size;


inv_ui_x = (gui_width * 0.5) - (inv_ui_width * 0.5 * scale);
inv_ui_y = (gui_height * 0.5) - (inv_ui_height * 0.5 * scale);

// player name and coins
info_x = inv_ui_x + (16 * scale);
info_y = inv_ui_y + (36 * scale);
// equipment slots
equip_slots_x = info_x;
equip_slots_y = 58 * scale;
// inventory slots
slots_x = info_x + (153.5 * scale);
slots_y = inv_ui_y + (35.5 * scale);
// item descriptions
desc_x = info_x;
desc_y = inv_ui_y + (196 * scale);



// ----- Player Info ------
// 0 = COINS
// 1 = NAME

ds_player_info = ds_grid_create(2, 2);

ds_player_info[# 0, 0] = "Coins";
ds_player_info[# 0, 1] = "Name";

ds_player_info[# 1, 0] = 10;
ds_player_info[# 1, 1] = "Player";

// ----- Inventory ------
// 0 = ITEM
// 1 = AMOUNT

ds_inventory = ds_grid_create(2, inv_slots);

enum items {
	
	none					= 0,
	pendantOfShadows		= 1,
	pendantOfDisasters		= 2,
	pendantOfChaos			= 3,
	redPotion				= 4,
	bluePotion				= 5,
	whitePotion				= 6,
	blackPotion				= 7,
	tomeOfDarkness			= 8,
	ringOfManaRegen			= 9,
	ringOfHealthRegen		= 10,
	ringOfLightning			= 11,
	purplePotion			= 12,
	magicalSkull			= 13,
	slimeGoop				= 14,
	staff					= 15,
	tomeOfFlames			= 16,
	tomeOfWater				= 17,
	necklaceofHealth		= 18,
	necklaceofMana			= 19,
	staffOfWater			= 20,
	staffOfFire				= 21,
	staffOfLightning		= 22,
	staffOfDarkness			= 23,
	tomeOfLightning			= 24,
	royalHelm				= 25,
	royalChest				= 26,
	royalGloves				= 27,
	royalLegs				= 28,
	royalNecklace			= 29,
	royalRing				= 30,
	evilCharm				= 31,
	shadowCharm				= 32,
	blackDragonHelm			= 33,
	blackDragonChest		= 34,
	blackDragonGloves		= 35,
	blackDragonLegs			= 36,
	blackDragonRing			= 37,
	height					= 38,
}


// ----- Item Descriptions -----
// 0 = ITEM
// 1 = DESCRIPTION
#region ITEM NAMES AND DESCRIPTIONS
ds_item_info = ds_grid_create(2, items.height);

// Item Names
var z = 0, i = 0;
ds_item_info[# z, i++] = "Nothing";
ds_item_info[# z, i++] = "Pendant of Shadows";
ds_item_info[# z, i++] = "Pendant of Disasters";
ds_item_info[# z, i++] = "Pendant of Chaos";
ds_item_info[# z, i++] = "Potion of Health";
ds_item_info[# z, i++] = "Potion of Mana";
ds_item_info[# z, i++] = "Potion of Yang";
ds_item_info[# z, i++] = "Potion of Yin";
ds_item_info[# z, i++] = "Tome of Darkness";
ds_item_info[# z, i++] = "Ring of Mana";
ds_item_info[# z, i++] = "Ring of Health";
ds_item_info[# z, i++] = "Ring of Turmoil";
ds_item_info[# z, i++] = "Potion of Overload";
ds_item_info[# z, i++] = "Magical Skull";
ds_item_info[# z, i++] = "Slime Goop";
ds_item_info[# z, i++] = "Staff";
ds_item_info[# z, i++] = "Tome of Flames";
ds_item_info[# z, i++] = "Tome of Water";
ds_item_info[# z, i++] = "Necklace of Health";
ds_item_info[# z, i++] = "Neckalce of Mana";
ds_item_info[# z, i++] = "Staff of Water";
ds_item_info[# z, i++] = "Staff of Fire";
ds_item_info[# z, i++] = "Staff of Lightning";
ds_item_info[# z, i++] = "Staff of Darkness";
ds_item_info[# z, i++] = "Tome of Lightning";
ds_item_info[# z, i++] = "Royal Helm";
ds_item_info[# z, i++] = "Royal Chestplate";
ds_item_info[# z, i++] = "Royal Gloves";
ds_item_info[# z, i++] = "Royal Platelegs";
ds_item_info[# z, i++] = "Royal Neckalce";
ds_item_info[# z, i++] = "Royal Ring";
ds_item_info[# z, i++] = "Evil Charm";
ds_item_info[# z, i++] = "Shadow Charm";
ds_item_info[# z, i++] = "Black Dragon Helm";
ds_item_info[# z, i++] = "Black Dragon Chestplate";
ds_item_info[# z, i++] = "Black Dragon Gloves";
ds_item_info[# z, i++] = "Black Dragon Platelegs";
ds_item_info[# z, i++] = "Black Dragon Ring";



// Item Description
z = 1; i = 0;
ds_item_info[# z, i++] = "Empty";
ds_item_info[# z, i++] = "A Pendant that increases Dark damage. Press 'E' to equip.";
ds_item_info[# z, i++] = "A Pendant that increases Water and Lightning damage. Press 'E' to equip.";
ds_item_info[# z, i++] = "A Pendant that increases Fire and Lightning damage. Press 'E' to equip. ";
ds_item_info[# z, i++] = "Recovers some HP. Press 'E' to use.";
ds_item_info[# z, i++] = "Recovers some MP. Press 'E' to use.";
ds_item_info[# z, i++] = "When drank take no damage for 15 seconds. Press 'E' to use.";
ds_item_info[# z, i++] = "When drank cast spells with no mana cost. Press 'E' to use.";
ds_item_info[# z, i++] = "A tome containing knowledge of Shadows. Press 'E' to read.";
ds_item_info[# z, i++] = "A ring imbued with a mana crystal. Improves mana. Press 'E' to equip.";
ds_item_info[# z, i++] = "A ring imbued with a ruby crystal. Improves HP. Press 'E' to equip.";
ds_item_info[# z, i++] = "A ring imbued with a Storm crystal. Increases Lightning damage. Press 'E' to equip.";
ds_item_info[# z, i++] = "A vile smell leaks from this vial. Perhaps I should drink this when in danger..";
ds_item_info[# z, i++] = "A Skull once imbued with magic.";
ds_item_info[# z, i++] = "This kind of looks like slime p...";
ds_item_info[# z, i++] = "A basic staff. Improves spell cast time slightly. Press 'E' to equip.";
ds_item_info[# z, i++] = "A tome containing knowledge of Flames. Press 'E' to read.";
ds_item_info[# z, i++] = "A tome containing knowledge of Waters. Press 'E' to read.";
ds_item_info[# z, i++] = "When worn this neckalce grants HP recovery. Press 'E' to equip.";
ds_item_info[# z, i++] = "When worn this necklace grants MP recovery. Press 'E' to equip.";
ds_item_info[# z, i++] = "A staff with a mana crystal imbued with the power of Waters. Increases Water Damage and cast time. Press 'E' to equip.";
ds_item_info[# z, i++] = "A staff with a mana crystal imbued with the power of Flames. Increases Fire Damage and cast time. Press 'E' to equip.";
ds_item_info[# z, i++] = "A staff with a mana crystal imbued with the power of Storms. Increases Lightning Damage and cast time. Press 'E' to equip.";
ds_item_info[# z, i++] = "An Ominous staff.. This staff is completely imbued in Darkness. Increases Dark Damage and cast time. Press 'E' to equip.";
ds_item_info[# z, i++] = "A tome containing knowledge of Storms. Press 'E' to read.";
ds_item_info[# z, i++] = "A Helmet worn by the Royal Guards. Increases Defence. Press 'E' to equip.";
ds_item_info[# z, i++] = "A Chestplate worn by the Royal Guards. Increases Defence. Press 'E' to equip.";
ds_item_info[# z, i++] = "Gloves worn by the Royal Guards. Increases Defence. Press 'E' to equip.";
ds_item_info[# z, i++] = "Platelegs worn by the Royal Guards. Increases Defence. Press 'E' to equip.";
ds_item_info[# z, i++] = "A Neckalce worn by the Royal Guards. Increases Damage dealt. Press 'E' to equip.";
ds_item_info[# z, i++] = "A Ring worn by the Royal Guards. Increases Damage dealt. Press 'E' to equip.";
ds_item_info[# z, i++] = "An Evil looking Charm.. Press 'E' to equip.";
ds_item_info[# z, i++] = "A Charm found in the realm of Shadows. Increases Shadow Spell Damage. Press 'E' to equip.";
ds_item_info[# z, i++] = "A Helmet forged with the scales of a Black Dragon. Greatly Increases Damage. Press 'E' to equip.";
ds_item_info[# z, i++] = "A Chestplate forged with the scales of a Black Dragon. Greatly Increases Damage. Press 'E' to equip. ";
ds_item_info[# z, i++] = "Gloves forged with the scales of a Black Dragon. Greatly Increases Damage. Press 'E' to equip.";
ds_item_info[# z, i++] = "Platelegs forged with the scales of a Black Dragon. Greatly Increases Damage. Press 'E' to equip.";
ds_item_info[# z, i++] = "A Ring forged with the scales of a Black Dragon. Greatly Increases Damage. Press 'E' to equip.";


#endregion


// ------ Equipment -----------
ds_equipment = ds_grid_create(2, 4);

// Left Equipment Slots = Staffs and Jewerly
var p = 0, q = 0;
ds_equipment[# p, q] = 0;
ds_equipment[# p, q++] = 0;
ds_equipment[# p, q++] = 0;
ds_equipment[# p, q++] = 0;

// Right Equipment Slots = Armor
p = 1; q = 0;
ds_equipment[# p, q] = 0;
ds_equipment[# p, q++] = 0;
ds_equipment[# p, q++] = 0;
ds_equipment[# p, q++] = 0;