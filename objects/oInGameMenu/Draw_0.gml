/// @description Insert description here
// You can write your code in this editor


// get the camera coordinates
var _camX = camera_get_view_x( view_camera[0] );
var _camY = camera_get_view_y( view_camera[0] );

if !toggleOn { exit; }

if toggleOn && room != rm_titleScreen {
	
	// black background
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	
	// draw_sprite_ext(sPause, 0, _camX + 100, _camY + 30, 1, 1, 0, c_white, 1);
	
	draw_set_halign(fa_center);
	draw_set_font(Font1);
	depth = -1002;
	
	draw_set_color(c_white);
	draw_text(_camX + 160, _camY + 10 , "Paused");
	
	// line spacing
	var _gap = 30;
	

	// draw items
	for (var i = 0; i < array_length(menu[sub_menu]); ++i) {
		draw_set_color(c_white);
		if i == index { draw_set_color(c_purple); }
		
		// is this option a selectable menu item or just plain text?
		if is_array(menu[sub_menu][i]) {
			// store the menu array
			var _menu_arr = menu[sub_menu][i];
			
			// get the map array
			var _map_arr = set[? _menu_arr[1]];
			
			// get the limit array or choices
			var _limits_arr = _map_arr[1];
			
			// show int or text
			if is_real(_limits_arr[0]) {
				// integer to show
				var _str = _menu_arr[0] + string(_map_arr[0]);
			} else {
				var _str = _menu_arr[0] + _limits_arr[_map_arr[0]];
			}
		} else {
			//draw string
			var _str = menu[sub_menu][i];
		}
	
		draw_text(_camX + 160, _camY + 50 + 23 * i, _str);
	
	
	}
	
	draw_set_halign(fa_left);

}































