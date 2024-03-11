

if global.game_menu_visible && room != rm_titleScreen {
	
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	draw_set_halign(fa_center);
	draw_set_font(Font1);
	depth = -1002;

	// line spacing
	var _gap = 30;

	// draw items
	for (var i = 0; i < array_length(menu[sub_menu]); ++i) {
		draw_set_color(c_white);
		if i == index draw_set_color(c_orange);
		
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
	
		draw_text(oPlayer.x , oPlayer.y - 60 + _gap * i, _str);
	
	}

}

draw_set_halign(fa_left);