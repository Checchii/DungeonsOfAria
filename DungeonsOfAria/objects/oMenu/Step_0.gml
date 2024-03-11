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
		// main menu level 0
		case 0:
			switch(pos)
			{
				// start the game
				case 0: room_goto_next(); break;
	
				// go to settings
				//case 1: menu_level = 1; break;
	
				// quit the game
				case 1: game_end(); break;
			}

		// settings menu level 1
		case 1:
			switch(pos)
			{
				// Volume	
				case 0: menu_level = 2; break;
				
				// Controls
				case 1: menu_level = 3; break; // random bug here ???
				
				// Brightness
				case 2: menu_level = 4; break;
				
				// Controls
				case 3: menu_level = 3; break;
				
				// Back
				case 4: menu_level = 0; break;
				
			}
			
			
			// volume menu level 2
			case 2:
				switch(pos)
				{
					// adjust volume scroll bar
					case 0:
				
					break;
				
					// go back to settings menu
					case 1:
						menu_level = 1;
					break;
				}
			
			// controls menu level 3
			case 3:
				switch(pos)
				{
					// adjust controls via user input
					case 0:
				
					break;
				
					// go back to settings menu
					case 1:
						menu_level = 1;
					break;
				}
		
			// brightness menu level 4
			case 4:
				switch(pos)
				{
					// adjust brightness scroll bar
					case 0:
				
					break;
				
					// go back to settings menu
					case 1:
						menu_level = 1;
					break;
				}
			
			
				// set position back
				if _startMenuLevel != menu_level { pos = 0; };
			
				// correct option length
				op_length = array_length(option[menu_level]);
	}
}
