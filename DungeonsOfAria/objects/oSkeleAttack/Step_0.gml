// state machine
switch( state )
{
	case 0:
		
		// aim for the player
		if instance_exists(oPlayer)
		{
			dir = point_direction(x, y, oPlayer.x, oPlayer.y);
		}
	
		// set the depth
		depth = -y - 50;
	
	break;
	
	// shoot / travel
	case 1:
		
		
		
		if instance_exists(oPlayer)
		{
			dir = point_direction(x, y, oPlayer.x, oPlayer.y);
		}
	
		// set the depth
		depth = -y - 50;
	
		// movement
		xspd = lengthdir_x(spd, dir);
		yspd = lengthdir_y(spd, dir);
		
		x += xspd;
		y += yspd;
		
		// update depth
		depth = -y;
		
		/// destroy instance after 2 seconds 
		// still need to fix aimbot pathing the bone attack takes
		if countdown > 0
		{
			countdown--;
			
			if countdown <= 0
			{
				instance_destroy();
			}
		}
	
	break;
}

// cleanup
	// out of room bounds
	if bbox_right < 0 || bbox_left > room_width || bbox_bottom < 0 || bbox_top > room_height
	{
		destroy = true;
	}
	
	// destroy when collided with player unless attack has pierce ability
	if hitConfirm == true && pierce == false { destroy = true; };

	// actually destroy self
	if destroy == true { instance_destroy(); }
	
	// wall collision
	if place_meeting( x, y, obj_wall) { destroy = true; };
	
	