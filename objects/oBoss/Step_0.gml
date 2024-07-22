/// @description Boss Mechanics

if instance_exists(oPlayer)
{	


// state machine 
switch( state )
{
	
	// un aggro state
	case -1:
		
		dir = random(360);
		move_spd = .2;	
		
		// grabbing distance to player
		var _dist = distance_to_object(oPlayer);
		
		// if player attacks / players gets too close
		// begin fight
		if hp < max_hp || _dist <= alert_dist
		{
			state = 0;
		}

		
	break;
	
	// Phase 1
	case 0:
		

		// get the player's direction
		if instance_exists( oPlayer )
		{
		dir = point_direction( x, y, oPlayer.x, oPlayer.y);
		}
		
		// set the speed to chase speed
		move_spd = chaseSpd;
		
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
				var state_num = irandom_range(0,2);
				state = state_num;
			
				// reset timer
				shootTimer = 0;
			}
		
	break;
		
	// pause and shoot state
	case 1: // Ice Dart Attack
	
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
				bulletInst = instance_create_depth(x + bulletxOffset, y + bulletyOffset, depth, oIceDart);
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
				// go back to chasing the player or attack again
				var state_num = irandom_range(0,2);
				state = state_num;
				
				// reset the timer
				shootTimer = 0;
			}
		
	break;
	
	case 2: // Ice Roll Attack (paths to player)
	
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
				bulletInst = instance_create_depth(x + bulletxOffset, y + bulletyOffset, depth, oIceRoll);
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
				// go back to chasing the player or attack again
				var state_num = irandom_range(0,2);
				state = state_num;
				
				// reset the timer
				shootTimer = 0;
			}
	
	break;
	

}


// getting the speed
xspd = lengthdir_x(move_spd, dir);
yspd = lengthdir_y(move_spd, dir);

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

//recieve damage
get_damage(oDamageEnemy);


// death
if hp <= 0 
{ 
	instance_destroy();
	
	instance_create_depth(0, 0, -10000, oGameWon);
}



// get the correct face
if dir > 90 && dir < 270
{
	face = -1;
} else {
	face = 1;
}



}







