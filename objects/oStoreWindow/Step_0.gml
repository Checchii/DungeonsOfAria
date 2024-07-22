/// @description Insert description here
// You can write your code in this editor
if (!toggleOn){ exit; }

if keyboard_check_pressed(vk_tab) or keyboard_check_pressed(vk_escape)
{
	toggleOn = false;
}


#region Mouse Over Slot -> Selected Slot
mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

var cell_xbuff = (cell_size + x_buffer)*scale;
var cell_ybuff = (cell_size + y_buffer)*scale;

var i_mousex = mousex - slots_x;
var i_mousey = mousey - slots_y;

var nx = i_mousex div cell_xbuff;
var ny = i_mousey div cell_ybuff;

var mouse_in_shop = true;
// only calculate the mouse position and selected item if the mouse is within the bounds of inventory
if (nx >= 0 and nx < store_slots_width and ny >= 0 and ny < store_slots_height){
	var sx = i_mousex - (nx*cell_xbuff);
	var sy = i_mousey - (ny*cell_ybuff);
	
	// don't calculate selected item if mouse position is inside the slot buffers
	if ((sx < cell_size*scale) and (sy < cell_size*scale)){
		mouse_slotX = nx;
		mouse_slotY = ny;
	}
} else { mouse_in_shop = false; }

// Set Selected Slot to Mouse Position
selected_slot = min(store_slots - 1, mouse_slotX + (mouse_slotY * store_slots_width));
#endregion


var shop_grid = ds_shop_items;
var ss_item = shop_grid[# 0, selected_slot];
var ss_item_price = shop_grid[# 1, selected_slot]

if (ss_item != items.none) {
	
	if mouse_check_button_pressed(mb_left){
		with(inv){
			if ds_player_info[# 1, 0] < ss_item_price { exit; }
			else { 
				ds_player_info[# 1, 0] -= ss_item_price;
				item_add(ss_item); }
		}
	}
}
