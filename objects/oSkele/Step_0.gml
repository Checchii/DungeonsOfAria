// state machine 
switch( state )
{
	
	// un aggro state
	case -1:
		
		var _dist = distance_to_object(oPlayer);
		// idle around the room unless attacked or player gets close
		if hp != max_HP { state = 0; }
		else if _dist <= alert_dist { state = 0; }

		
	break;
	
	// chase state
	case 0:
	
	
		// get the player's direction
		if instance_exists( oPlayer )
		{
		dir = point_direction( x, y, oPlayer.x, oPlayer.y);
		}
		
		// set the speed to chase speed
		// move_spd = chaseSpd;
		move_spd = 0.3;
		
		
		// getting the speed
		xspd = lengthdir_x(move_spd, dir);
		yspd = lengthdir_y(move_spd, dir);
		
		// remove the following multi line comment if you want the slimes
		// to shoot slime balls
		
			
				// transition to shooting state
				var _camLeft = camera_get_view_x(view_camera[0]);
				var _camRight = _camLeft + camera_get_view_width(view_camera[0]);
				var _camTop = camera_get_view_y(view_camera[0]);
				var _camBottom = _camTop + camera_get_view_height(view_camera[0]);
		
				// only add to timer if on screen
				if bbox_right > _camLeft && bbox_left < _camRight && bbox_bottom > _camTop && bbox_top < _camBottom
				{
					shootTimer++;
				}
		
		
				if shootTimer > cooldownTime
				{
					// go to shoot state
					state = 1;
			
					// reset timer
					shootTimer = 0;
				}
			
		
	break;
		
	// pause and shoot state
	case 1:
		
		// get the player's direction
		if instance_exists( oPlayer )
		{
		dir = point_direction( x, y, oPlayer.x, oPlayer.y);
		}
		
		// set the correct speed to not moving
		move_spd = 0;
		
		// stop animating / manually set the image index
		image_index = 0;
		
			// shoot ranged attack
			shootTimer++;
			
			// create the attack
			if shootTimer == 1
			{
				bulletInst = instance_create_depth(x + bulletxOffset, y + bulletyOffset, depth, oSkeleAttack);
			}
			
			// keep the ranged attack when changing face direction
			if shootTimer <= windupTimer && instance_exists( bulletInst )
			{
				bulletInst.x = x + bulletxOffset*face;
				bulletInst.y = y + bulletyOffset*face;
			}
			
			// shoot the ranged attack after the windup time is over
			if shootTimer == windupTimer && instance_exists(bulletInst)
			{
				// set ranged attack state to the movement state
				bulletInst.state = 1;
			}
			
			// recover and return to chasing the player
			if shootTimer > windupTimer + recoverTime
			{
				// go back to chasing the player
				state = 0;
			
				
				// reset the timer
				shootTimer = 0;
			}
		
	break;
	

}


// collision
if place_meeting(x + xspd, y, obj_wall) || place_meeting( x + xspd, y, oEnemyParent)
{
	xspd = 0;
}

if place_meeting(x, y + yspd, obj_wall) || place_meeting( x, y + yspd, oEnemyParent)
{
	yspd = 0;
	
}

x += xspd;
y += yspd;

// set the depth
depth = -y;


// getting damage and dying
event_inherited();

// get the correct face
if dir > 90 && dir < 270
{
	face = -1;
} else {
	face = 1;
}

// animate
/*
if xspd == 0 && yspd == 0
{
	image_index = 0;
}
*/