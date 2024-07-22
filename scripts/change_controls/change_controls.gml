
function change_controls( _hmove, _key ) {
	// @_key	string ds_map key for this selection
	
	//get the allowed limits for this selection
	//get map array
	var _map_arr = set[? _key];		// _map_arr -> [0, [" ON", " OFF"]]
	
	//get the limits array
	var _limits_arr = _map_arr[1];	// limits -> [" ON", " OFF"]
	// is first entry integer?
	if is_real(_limits_arr[0]) {
		// limits are index pos 0 and 1	-> [0, 10]
		var _min = _limits_arr[0];		// min would be 0
		var _max = _limits_arr[1];		// max would be 10
	} else {
		// string entries	on/off in this case
		var _min = 0;									// ON  //UP //LEFT //RIGHT //DOWN
		var _max = array_length(_limits_arr) - 1;		// OFF //W  //A	   //D	   //S
	}
	
	// move the selection // as you move right increase by 1 and update value
	_map_arr[@ 0] = clamp(_hmove + _map_arr[0], _min, _max);

	if _map_arr[0] = _min {
		with(oPlayer) {
			right_key = keyboard_check(vk_right);
			left_key = keyboard_check(vk_left);
			up_key = keyboard_check(vk_up);
			down_key = keyboard_check(vk_down);
		}
		
	} if _map_arr[0] = _max {
		with(oPlayer) {
			up_key = keyboard_check( ord("W") );
			left_key = keyboard_check( ord("A"));
			down_key = keyboard_check( ord("S"));
			right_key = keyboard_check( ord("D"));
		}
	}
	
}
