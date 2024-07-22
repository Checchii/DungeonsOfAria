// get input
var _up = keyboard_check_pressed(vk_up);
var _down = keyboard_check_pressed(vk_down);
var _select = keyboard_check_pressed(vk_enter);

var _right = keyboard_check_pressed(vk_right);
var _left = keyboard_check_pressed(vk_left);

var _openMenu = keyboard_check_pressed(vk_escape);

// open the menu
if keyboard_check_pressed(vk_escape){
	toggleOn = !toggleOn;
}		

if toggleOn {
		// hide player
		with(oPlayer){
			move_spd = 0;
			visible = 0;
		}
		oHUD.visible = 0;
	
		if inv.toggleOn = true {
			inv.toggleOn = false;
		}
}

if !toggleOn {
	if instance_exists(oPlayer){
		oPlayer.visible = 1;
		oHUD.visible = 1;
		oPlayer.move_spd = 2;
	}
}

var _move = _down - _up;
var _hmove = _right - _left;

if _move != 0 {
	// move the index
	index += _move;
	
	
	// clamp the values
	var _size = array_length(menu[sub_menu]);
	
	if index < 0 index = _size - 1; // at start, loop to menu end
	else if index >= _size index = 0; // at end, loop to menu start
}

if _select or (is_array(menu[sub_menu][index]) and (_hmove != 0)) {
	switch(sub_menu) {
		case MAIN:
			switch(index) {
				
				case 0:
					// resume game function
					toggleOn = false;
					
				break;
				
				case 1:
					// options menu
					sub_menu = SETTINGS;
					index = 0;
				break;
				
				case 2:
					// Display the game achivements
					sub_menu = ACHIVEMENTS;
					index = 0;
				break;
				
				case 3:
					// quit the game
					game_end();
				break;
			}
			
		case SETTINGS:
			switch(index){
				
				case 0:
					// Toggle Music ON/ OFF
					change_menu(_hmove, "music");
				break;
				
				case 1:
					sub_menu = CONTROLS;
					index = 0;
				break;
				
				case 2:
					// back to main menu
					sub_menu = MAIN;
					index = 1;					
				break;
			}
			
		case CONTROLS:
			switch(index){
				
				case 0:
					// "UP"
				break;
				
				case 1:
					// left
				break;
				
				case 2:
					// right
				break;
				
				case 3:
					// down
				break;
				
				case 4:
					// back
					sub_menu = SETTINGS;
					index = 1;
				break;
			
			}
			
			case ACHIVEMENTS:
				switch(index){
					
					case 0:
						// Showcase Achievements
					break;
				
					case 1:
						// back
						sub_menu = MAIN;
						index = 1;	
					break;
				}
	}
}
