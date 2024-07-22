// state machine 
switch( state )
{
	
	// un aggro / idle state
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
		move_spd = chaseSpd;
		
		xspd = lengthdir_x(move_spd, dir);
		yspd = lengthdir_y(move_spd, dir);
		
		#region
		// remove the following multi line comment if you want the slimes
		// to shoot slime balls
		
		/*
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
	    */
		#endregion
	break;
		
	#region pause and shoot state ( NOT IN USE for this Monster )
	case 1:
	
		// get the player's direction
		if instance_exists( oPlayer )
		{
			dir = point_direction( x, y, oPlayer.x, oPlayer.y);
		}
		
		// set the correct speed
		move_spd = 0;
		
		// stop animating / manually set the image index
		image_index = 0;
		
			// shoot slime attack
			shootTimer++;
			
			// create the slime attack
			if shootTimer == 1
			{
				bulletInst = instance_create_depth(x + bulletxOffset, y + bulletyOffset, depth, oSkeleAttack);
			}
			
			// keep the slime attack when changing face direction
			if shootTimer <= windupTimer && instance_exists( bulletInst )
			{
				bulletInst.x = x + bulletxOffset*face;
				bulletInst.y = y + bulletyOffset*face;
			}
			
			// shoot the slime ball aftethe windup time is over
			if shootTimer == windupTimer && instance_exists(bulletInst)
			{
				// set slime attack's state to the movement state
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
	#endregion

}


/*
// getting the speed
xspd = lengthdir_x(move_spd, dir);
yspd = lengthdir_y(move_spd, dir);
*/

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

/*
// get the correct face
if dir > 90 && dir < 270
{
	face = -1;
} else {
	face = 1;
}
*/

// set sprite
if room == rm_dungeon1F {
mask_index = sprite[DOWN];


if yspd == 0 // if moving left or right
	{
	if xspd > 0  // if walking right set face = right
	{ 
		face = RIGHT;
		dir = 0;
		
	}; 
	if xspd < 0 // if walking left set face = left
	{ 
		face = LEFT;
		dir = 180;
	}; 
	}
	
if xspd > 0 && face == LEFT { face = RIGHT };
if xspd < 0 && face == RIGHT { face = LEFT };

if xspd == 0 // if moving up or down
	{
	if yspd > 0  // if walking down set face = down
	{ 
		face = DOWN;
		dir = 270;
	};
	if yspd < 0 // if walking up set face = up
	{ 
		face = UP;
		dir = 90;
	}; 
	}
	
if yspd > 0 && face == UP { face = DOWN };
if yspd < 0 && face == DOWN { face = UP };

sprite_index = sprite[face];
}