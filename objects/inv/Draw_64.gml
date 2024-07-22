
if (!toggleOn){ exit; }

// -- Inventory Background --
draw_sprite_part_ext(
	spr_inv_ui, 0, cell_size, 0, inv_ui_width, 
	inv_ui_height, inv_ui_x, inv_ui_y, scale, scale, c_white, 1 );

var info_grid = ds_player_info;

draw_set_font(fnt_text_12);
var c = c_black;

// new inventory player name info
draw_text_transformed_color(info_x, info_y + 5, info_grid[# 1, 1], .6, .6, 0, c, c, c, c, 1);


draw_set_font(fnt_small_digits);
var yy = 0 ; repeat(1){
	
	draw_text_transformed_color(info_x + (125*scale) + ((15)*scale*yy), info_y, string(info_grid[# 1, yy]), .3, .3, 0, c , c, c, c, 1 );
}


// -- Inventory Slots --
var ii, ix, iy, xx, yy, sx, sy, iitem, inv_grid;
ii = 0; ix = 0; iy = 0; inv_grid = ds_inventory;

repeat(inv_slots)
{
	
	// x,y location for slot
	xx = slots_x + ((cell_size + x_buffer) * ix * scale);
	yy = slots_y + ((cell_size + y_buffer) * iy * scale);
	
	// Item
	iitem = inv_grid[# 0, ii];
	sx = (iitem mod spr_inv_items_columns)*cell_size;
	sy = (iitem div spr_inv_items_columns)*cell_size;
	
	// draw slot and item
	draw_sprite_part_ext(spr_inv_ui, 0, 0, 0, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
	
	switch(ii){
		// in the case mouse is hovering over item slot, highlight slot
		case selected_slot:
			if iitem > 0 {
				draw_sprite_part_ext(
				spr_inv_items, 0, sx ,sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1
			);
			}
			// draws another slot on top creating a highlight effect
			gpu_set_blendmode(bm_add);
			draw_sprite_part_ext(spr_inv_ui, 0, 0, 0, cell_size, cell_size, xx, yy, scale, scale, c_white, .3);
			gpu_set_blendmode(bm_normal);
		break;
		
		case pickup_slot:
			if iitem > 0 {
				draw_sprite_part_ext(
				spr_inv_items, 0, sx ,sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1
			);
			}
		break;
		
		// default case
		default:
			if iitem > 0 {
				draw_sprite_part_ext(
				spr_inv_items, 0, sx ,sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1
			);
			}
		break;
	}
	// draw item and amount
	if iitem > 0 {
		var number = inv_grid[# 1, ii];
		draw_text_transformed_color(xx, yy, string(number), .4, .4, 0, c_white, c_white, c_white, c_white, 1);
	}
	
	
	// increment
	ii += 1;
	ix = ii mod inv_slots_width;
	iy = ii div inv_slots_width;
	
}

// Draw item description
var iinfo_grid = ds_item_info, description = "";
iitem = inv_grid[# 0, selected_slot];

if (iitem > 0 ){
	draw_set_font(fnt_text_12);
	description = iinfo_grid[# 0, iitem] + " : " + iinfo_grid[# 1, iitem];
	
	// old inventory description 
	//draw_text_ext_transformed_color(desc_x, desc_y + 4, description, 15, (inv_ui_width*scale)*2 - (x_buffer*2) - 6, .45, .45, 0, c, c, c, c, 1);
	
	draw_text_ext_transformed_color(desc_x, desc_y + 4, description, 15, (inv_ui_width*scale)*1 - (x_buffer*2) - 6, .45, .45, 0, c, c, c, c, 1);
	
}

if (pickup_slot != -1)
{
	// Item
	iitem = inv_grid[# 0, pickup_slot];
	sx = (iitem mod spr_inv_items_columns)*cell_size;
	sy = (iitem div spr_inv_items_columns)*cell_size;

	draw_sprite_part_ext(
		spr_inv_items, 0, sx ,sy, cell_size, cell_size, mousex, mousey, scale, scale, c_white, 1
		);
	
	// item amount
	var inum = inv_grid[# 1, pickup_slot];
	draw_text_transformed_color(mousex, mousey, string(inum), .3, .3, 0, c, c, c, c, 1);
}


// -- Equipment Slots --
var ee, ep, eq, ex, ey, exx, eyy, eitem, equip_grid;
ee = 0; ex = 0; ey = 0; equip_grid = ds_equipment;


