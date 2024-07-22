// damage calculation
	// damage create event
	function get_damage_create( _hp = 100, _iframes = false )
	{
		hp = _hp;
		max_hp = _hp;
		
		// get the invilurnerbility frames
		if _iframes == true
		{
			iframeTimer = 0;
			iframeNumber = 90;
		}
		
		// create the damage list
		if _iframes == false
		{
		dmg_list = ds_list_create();
		}
		
	}
	
	// damage clean up event
	function get_damage_cleanup()
	{
		// DO NOT NEED if using iframes
		
		// delete our damage list data structure to free memory
		ds_list_destroy(dmg_list);

	}
	
	// damage step event
	function get_damage( _damageObj, _iframes = false )
	{
		
		// special exit for iframe timer
		if _iframes == true && iframeTimer > 0
		{
			iframeTimer--;
			
			if iframeTimer mod 5 == 0
			{
				if image_alpha == 1 
				{
					image_alpha = 0;
				} else {
					image_alpha = 1;
				}
			}
			
			// clamp hp
			hp = clamp(hp ,0, max_hp);
			
			exit;
		}
		
		// stops iframe blinking
		if _iframes == true
		{
		image_alpha = 1;
		}
		
			// receive damage
		if place_meeting( x, y, _damageObj)
		{
	
			// getting a list of the damage instances
	
				// create ds list and copy instances to it
				var _instList = ds_list_create();
				instance_place_list( x, y, _damageObj, _instList, false );
	
				// get the size of our list
				var _listSize = ds_list_size( _instList );
	
				// loop through the list
				var _playerHit = false
				for( var i = 0; i < _listSize; i++ )
				{
					// get a damage object instance from list
					var _inst = ds_list_find_value( _instList, i);
			
					// check if this instance is already in the damage list
					if _iframes == true || ds_list_find_index( dmg_list, _inst ) == -1
					{
						// add the new damage instance to the damage list
						if _iframes == false
						{
						ds_list_add( dmg_list, _inst);
						}
					
						// take damage from specific instance
						hp -= _inst.damage;
						_playerHit = true;
						// tell the damage instance it has impacted
						_inst.hitConfirm = true;
					}
			
				}
			
				// set iframes if we were hit
				if _iframes == true && _playerHit
				{
				
					iframeTimer = iframeNumber;
				}
	
			// free memory by destroying the ds list
			ds_list_destroy( _instList );
	
	}

	
		// clear the damage list of objects that don't exist anymore or aren't touching anymore
		if _iframes == false
		{
			var _dmg_list_size = ds_list_size( dmg_list );
			for( var i = 0; i < _dmg_list_size; i++ )
			{
		
				// if not touching the damage instance anymore, remove it from the list AND set the loop back 1 position
				var _inst = ds_list_find_value( dmg_list, i );
				if !instance_exists( _inst ) || !place_meeting( x, y, _inst )
				{
					ds_list_delete( dmg_list, i);
					i--;
					_dmg_list_size--;
				}
		
		
			}
		}
		
		// clamp hp
		hp = clamp(hp ,0, max_hp);
	}
	
	
// enemy alert state
	// check for player distance from enemy and path towards player
	function check_for_player() 
	{
		
			// get distance away from player
			var _dist = distance_to_object(oPlayer);
			
			if _dist > alert_dist and hp != max_HP
				{
					alert = true;
				}
			
			// if player is close to monster turn on alert state and path to player
			if ((_dist <= alert_dist) or alert) and _dist > attack_distance
			{
				// set enemy alert to true
				alert = true;
				
				// calculate path if timer is <= 0
				if calc_path_timer-- <= 0 
				{
					// reset timer
					calc_path_timer = calc_path_delay;
					
					// is there a path to the player
					var _found_player = mp_grid_path(global.mp_grid, path, x, y, oPlayer.x, oPlayer.y, choose(0,1));
		
					// if player gets close to enemy then become aggrod and chase
					if _found_player
						{
							// start pathing to player 
							path_start(path, move_spd, path_action_stop, false);
						}
				}
			} 
			else
				{
					path_end();
				}
			
	}
		
