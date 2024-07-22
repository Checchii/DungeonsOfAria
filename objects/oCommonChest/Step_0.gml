/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(ord("E")) and !chestOpened and place_meeting(x,y, oPlayer)
{
	image_index = 1;
	chestOpened = true;
	
	switch(random_loot)
	{
		case 1:
			amount = choose(2,3,5);
		
			repeat(amount)
			{
				instance_create_depth(x + 9, y + 20, -400, oCopperCoin);
				
				with(oCopperCoin) {
				
				if drop_move {
			
				x = lerp(x, goal_x, 0.5);
				y = lerp(y, goal_y, 0.5);
			
				}
			
				if (abs(x - goal_x) < 1) and (abs(y - goal_y) < 1)
					{
						drop_move = false;
					}
				}
			}
		break;
		
		case 2:
			instance_create_depth(x + 9, y + 15, -400, bluePotion);
			
			with(bluePotion) {
				
				if drop_move {
			
				x = lerp(x, goal_x, 0.5);
				y = lerp(y, goal_y, 0.5);
			
				}
			
				if (abs(x - goal_x) < 1) and (abs(y - goal_y) < 1)
					{
						drop_move = false;
					}
				}
		break;
		
		case 3:
			instance_create_depth(x + 9, y + 15, -400, redPotion);
			
			with(redPotion) {
				
				if drop_move {
			
				x = lerp(x, goal_x, 0.5);
				y = lerp(y, goal_y, 0.5);
			
				}
			
				if (abs(x - goal_x) < 1) and (abs(y - goal_y) < 1)
					{
						drop_move = false;
					}
			}
		break;
	
	}
	
}












