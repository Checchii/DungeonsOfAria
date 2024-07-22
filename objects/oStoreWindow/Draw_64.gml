/// @description Insert description here
// You can write your code in this editor

if (!toggleOn){ exit; }

// -- Shop Background --
draw_sprite_part_ext(
	spr_store_ui, 0, cell_size, 0, store_ui_width, store_ui_height,  
	store_ui_x, store_ui_y, scale , scale , c_white, 1 );

// Draw shop slots
var ii, ix, iy, xx, yy, sx, sy, iitem, shop_grid;
ii = 0; ix = 0; iy = 0; shop_grid = ds_shop_items;

repeat(store_slots)
{
	
	// x,y location for slot
	xx = slots_x + ((cell_size + x_buffer) * ix * scale);
	yy = slots_y + ((cell_size + y_buffer) * iy * scale);
	
	// Item
	iitem = shop_grid[# 0, ii];
	sx = (iitem mod spr_shop_items_columns)*cell_size;
	sy = (iitem div spr_shop_items_columns)*cell_size;
	
	// draw slot and item
	draw_sprite_part_ext(spr_store_ui, 0, 0, 0, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
	
	switch(ii){
		// in the case mouse is hovering over item slot, highlight slot
		case selected_slot:
			if iitem > 0 {
				draw_sprite_part_ext(
				spr_store_items, 0, sx ,sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1
			);
			}
			// draws another slot on top creating a highlight effect
			gpu_set_blendmode(bm_add);
			draw_sprite_part_ext(spr_store_ui, 0, 0, 0, cell_size, cell_size, xx, yy, scale, scale, c_white, .3);
			gpu_set_blendmode(bm_normal);
		break;
		
		case pickup_slot:
			if iitem > 0 {
				draw_sprite_part_ext(
				spr_store_items, 0, sx ,sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1
			);
			}
		break;
		
		// default case
		default:
			if iitem > 0 {
				draw_sprite_part_ext(
				spr_store_items, 0, sx ,sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1
			);
			}
		break;
	}
	// draw Item and Price
	if iitem > 0 {
		var number = shop_grid[# 1, ii];
		draw_text_transformed_color(xx, yy - 11, string(number), .5, .5, 0, c_white, c_white, c_white, c_white, 1);
	}
	
	
	// increment
	ii += 1;
	ix = ii mod store_slots_width;
	iy = ii div store_slots_width;
	
}






/* currently doesn't have description box 

// Draw item description
var iinfo_grid = ds_shop_item_info, description = "";
iitem = shop_grid[# 0, selected_slot];

if (iitem > 0 ){
	draw_set_font(fnt_text_12);
	description = iinfo_grid[# 0, iitem] + " : " + iinfo_grid[# 1, iitem];
	
	// old inventory description 
	//draw_text_ext_transformed_color(desc_x, desc_y + 4, description, 15, (inv_ui_width*scale)*2 - (x_buffer*2) - 6, .45, .45, 0, c, c, c, c, 1);
	
	draw_text_ext_transformed_color(desc_x, desc_y + 4, description, 15, (store_ui_width*scale)*1 - (x_buffer*2) - 6, .45, .45, 0, c_black, c_black, c_black, c_black, 1);
	
}
*/







