/// @description Insert description here
// You can write your code in this editor

// toggle inventory on or off
if keyboard_check_pressed(vk_tab)
{
	toggleOn = !toggleOn;
}

// if off exit else do inventory stuff
if (!toggleOn){ exit; }

#region Mouse Slot
mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

var cell_xbuff = (cell_size + x_buffer)*scale;
var cell_ybuff = (cell_size + y_buffer)*scale;

var i_mousex = mousex - slots_x;
var i_mousey = mousey - slots_y;

var nx = i_mousex div cell_xbuff;
var ny = i_mousey div cell_ybuff;

var mouse_in_inv = true;
// only calculate the mouse position and selected item if the mouse is within the bounds of inventory slot
if (nx >= 0 and nx < inv_slots_width and ny >= 0 and ny < inv_slots_height){
	var sx = i_mousex - (nx*cell_xbuff);
	var sy = i_mousey - (ny*cell_ybuff);
	
	// don't calculate selected item if mouse position is inside the slot buffers
	if ((sx < cell_size*scale) and (sy < cell_size*scale)){
		mouse_slotX = nx;
		mouse_slotY = ny;
	}
} else { mouse_in_inv = false; }

// Set Selected Slot to Mouse Position
selected_slot = min(inv_slots - 1, mouse_slotX + (mouse_slotY * inv_slots_width));
#endregion


// Pickup Item Slot
// Right click picks up Left click places it back down
var inv_grid = ds_inventory;
var ss_item = inv_grid[# 0, selected_slot];

// if we have an item picked up
if( pickup_slot != -1)
{
	if mouse_check_button_pressed(mb_left){
		
		if (!mouse_in_inv) {
			#region If mouse is not in the inventory dropped picked up item into game world
			var pickedupItem = inv_grid[# 0, pickup_slot];
			inv_grid[# 1, pickup_slot] -= 1;
			// destroy item in inventory if it was the last one
			if (inv_grid[# 1, pickup_slot] == 0)
			{
				inv_grid[# 0, pickup_slot] = items.none;
				pickup_slot = -1;
			}
			
			// create the item in the instance layer
			var inst = instance_create_layer(oPlayer.x, oPlayer.y, "Instances", oItem);
		
			with (inst){
				item_number = pickedupItem;
				x_frame = item_number mod (spr_width/cell_size);
				y_frame = item_number div (spr_width/cell_size);
			}
			
		}
		#endregion
		
		// if slot is empty place the selected item to empty slot
		else if (ss_item == items.none) {
			inv_grid[# 0 , selected_slot] = inv_grid[# 0, pickup_slot];
			inv_grid[# 1 , selected_slot] = inv_grid[# 1, pickup_slot];
			
			inv_grid[# 0 , pickup_slot] = items.none;
			inv_grid[# 1 , pickup_slot] = 0;
			
			pickup_slot = -1;
		}
		// if slot is not empty but item is of the same type as picked up item
		else if (ss_item == inv_grid[# 0, pickup_slot]) {
			
			// if slot is different from the picked up item slot then combine the amount of items
			if (selected_slot != pickup_slot){
				inv_grid[# 1 , selected_slot] += inv_grid[# 1, pickup_slot];
			
				inv_grid[# 0 , pickup_slot] = items.none;
				inv_grid[# 1 , pickup_slot] = 0;
			}
			// if selected item is being placed in the same previous slot just place the item back
			pickup_slot = -1;
		}
		// slot is not empty and item is of different type than picked up item
		else {
			// placeholder value for the selected slot's item amount
			var ss_item_num = inv_grid[# 1, selected_slot];
			
			// assign the selected slot the picked up item and amount
			inv_grid[# 0 , selected_slot] = inv_grid[# 0, pickup_slot];
			inv_grid[# 1 , selected_slot] = inv_grid[# 1, pickup_slot];
			
			// then assign the picked up item the selected slot's item and amount
			inv_grid[# 0 , pickup_slot] = ss_item;
			inv_grid[# 1 , pickup_slot] = ss_item_num;
			
			pickup_slot = -1;
		}
	}
}

// if selected item is not none
else if (ss_item != items.none) {
	
	// drop item into game world with left shift
	if keyboard_check_pressed(vk_lshift)
	{
		inv_grid[# 1, selected_slot] -= 1;
		
		// destroy item in inventory if it was the last one
		if (inv_grid[# 1, selected_slot] == 0)
		{
			inv_grid[# 0, selected_slot] = items.none;
		}
		
		// create the item in the instance layer
		var inst = instance_create_layer(oPlayer.x, oPlayer.y, "Instances", oItem);
		
		with (inst){
			item_number = ss_item;
			x_frame = item_number mod (spr_width/cell_size);
			y_frame = item_number div (spr_width/cell_size);
		}
		
	}
	
	// place picked up item down
	if mouse_check_button_pressed(mb_right){
		// set picked up item to selected slot
		pickup_slot = selected_slot;
	}
	
}

#region Health Potion Recovery
if ss_item == items.redPotion
{
	if keyboard_check_pressed(ord("E"))
	{
		if oPlayer.hp != oPlayer.max_hp{
			
			if oPlayer.hp + 10 <= oPlayer.max_hp {
				oPlayer.hp += 10; }
			else { oPlayer.hp = oPlayer.max_hp; }
			
			inv_grid[# 1, selected_slot] -= 1;
		
			// destroy item in inventory if it was the last one
			if (inv_grid[# 1, selected_slot] == 0)
			{
				inv_grid[# 0, selected_slot] = items.none;
				// ds_inventory[# 0, selected_slot] = nothing
				// we have a location for an empty cell
			}
		}
	}
}
#endregion

#region Mana Potion Recovery
if ss_item == items.bluePotion
{
	if keyboard_check_pressed(ord("E"))
	{
		if oPlayer.player_mana != oPlayer.player_maxMana{
			
			if oPlayer.player_mana + 10 <= oPlayer.player_maxMana {
				oPlayer.player_mana += 10; }
			else { oPlayer.player_mana = oPlayer.player_maxMana; }
			
			inv_grid[# 1, selected_slot] -= 1;
		
			// destroy item in inventory if it was the last one
			if (inv_grid[# 1, selected_slot] == 0)
			{
				inv_grid[# 0, selected_slot] = items.none;
				// ds_inventory[# 0, selected_slot] = nothing
				// we have a location for an empty cell
			}
		}
	}
}
#endregion

#region Spell Books

// Tome of Flames
if ss_item == items.tomeOfFlames
{
	if keyboard_check_pressed(ord("E"))
	{
		array_push(global.PlayerSpellBook, global.SpellList.fire_orb);
			
			inv_grid[# 1, selected_slot] -= 1;
		
			// destroy item in inventory if it was the last one
			if (inv_grid[# 1, selected_slot] == 0)
			{
				inv_grid[# 0, selected_slot] = items.none;
				// ds_inventory[# 0, selected_slot] = nothing
				// we have a location for an empty cell
			}
	}
}

// Tome of Lightning / Storms
if ss_item == items.tomeOfLightning
{
	if keyboard_check_pressed(ord("E"))
	{
		array_push(global.PlayerSpellBook, global.SpellList.storm_spell);
			
			inv_grid[# 1, selected_slot] -= 1;
		
			// destroy item in inventory if it was the last one
			if (inv_grid[# 1, selected_slot] == 0)
			{
				inv_grid[# 0, selected_slot] = items.none;
				// ds_inventory[# 0, selected_slot] = nothing
				// we have a location for an empty cell
			}
	}
}

#endregion


var equip_grid = ds_equipment;
var ee, ep, eq, ex, ey, exx, eyy, eitem, 
ee = 0; ep = 0; eq = 0;

if ss_item == items.blackDragonHelm
{
	if keyboard_check_pressed(ord("E"))
	{
		if equip_grid[# 1, 0] == 0 {
		
			// remove the item from inventory and equip the item to equipment slots
			equip_grid[# 1, 0] = inv_grid[# 0, selected_slot];
			inv_grid[# 0, selected_slot] = items.none;
			inv_grid[# 1, selected_slot] -= 1;
			
		}
	
		/*
			// destroy item in inventory if it was the last one
			if (inv_grid[# 1, selected_slot] == 0)
			{
				inv_grid[# 0, selected_slot] = items.none;
			}
		*/
	}
}
