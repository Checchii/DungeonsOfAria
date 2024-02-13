// get inputs
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_enter);

// store number of options in current menu
op_length = array_length(option[menu_level]);

// move through the menu
pos += down_key - up_key;
if pos >= op_length { pos = 0; };
if pos < 0 { pos = op_length - 1; };

// using the options
if accept_key
{
	var _startMenuLevel = menu_level;
	
	switch(menu_level)
	{
		// main menu
		case 0:
			switch(pos)
			{
				// start the game
				case 0: room_goto_next(); break;
	
				// go to settings
				case 1: menu_level = 1; break;
	
				// quit the game
				case 2: game_end(); break;
			}

		// settings menu
		case 1:
			switch(pos)
			{
				// Volume	
				case 0:
				
				break;
				
				// Controls
				case 1:
				
				break;
				
				// Brightness
				case 2:
				
				break;
				
				// back
				case 3:
					menu_level = 0;
				break;
				
			}
			
			// set position back
			if _startMenuLevel != menu_level { pos = 0; };
			
			// correct option length
			op_length = array_length(option[menu_level]);
	}
}
