/// @description Insert description here
// You can write your code in this editor

if drop_move {
	// move the dropped item to a random location
	x = lerp(x, goal_x, 0.1);
	y = lerp(y, goal_y, 0.1);
	
	if (abs(x - goal_x) < 1) and (abs(y - goal_y) < 1)
	{
		drop_move = false;
	}
	
}

else {
	
	var px = oPlayer.x;
	var py = oPlayer.y;
	
	var r = 32;
	
	// if item is within a radius move towards the player 
	if point_in_rectangle(px, py, x-r, y-r, x+r, y+r)
	{
		// are we on top of the player?
		var r = 2;
		if !(point_in_rectangle(px, py, x-r, y-r, x+r, y+r))
		{
			// not on top so move towards the player
			x = lerp(x, px, 0.1);
			y = lerp(y, py, 0.1);
		}
		// on top of player so pick it up
		else
		{
			var inum = item_number;
			
			with (inv) {
				var ds_inv = ds_inventory;
				var picked_up = false;
				
				// if item of same type exists stack it
				var yy = 0; repeat(inv_slots){
					if (ds_inv[# 0, yy] == inum){
						ds_inv[# 1, yy] += 1;
						picked_up = true;
						break;
					} else {
						yy += 1;
					}
				}
				// otherwise add item to empty slot if there is one
				if (!picked_up) {
					yy = 0; repeat(inv_slots){
						if (ds_inv[# 0, yy] == items.none){
							ds_inv[# 0, yy] = inum;
							ds_inv[# 1, yy] += 1;
							picked_up = true;
							break;
						} else {
							yy += 1;
						}
					}
				}
				
		}
		
		// destroy item in game world instance if picked up
		if picked_up {
			instance_destroy();
		}
		
		}
	}
	
}










