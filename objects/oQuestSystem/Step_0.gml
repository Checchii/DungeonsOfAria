
// create pointer to grid
var grid = ds_quests;

var ii = 0; repeat(ds_quests_number)
{
	
	switch(ii)
	{
		// KILL SLIMES ( CASE 1 ) 
		case quests.slimey_droppings:
		
			switch(grid[# 1, ii]) // switch through the Stages of Quest
			{
				case -1: // quest is INACTIVE
						if room == rm_outside and oMysteriousFigure.questActive == true{ // change to case 0 
						grid[# 1, ii] += 1;
						}
				break; 
				
				case 0: // quest is ACTIVE - Stage 0: Collect 3 Slime Goops And Bring to MF
				
					// this code is for taking the slime goops out of the inventory 
					var questCompleted = false;
					var requiredAmount = 3;
					
					with oPlayer {
						var inst = instance_place(x, y, oMysteriousFigure);
						if inst != noone {
							with(inv)
							{
								var qp = 0; repeat(requiredAmount) {
							
								var yy = 0; repeat(inv_slots) {
									if ds_inventory[# 0, yy] == items.slimeGoop
									{
										if ds_inventory[# 1 , yy] >= 3 and qp == 0{
											ds_inventory[# 1, yy] -= 3;
											qp += 3;
										}
										
										else if ds_inventory[# 1 , yy] == 2 and qp <= 1{
											ds_inventory[# 1, yy] -= 2;
											qp += 2;
										}
										
										else if ds_inventory[# 1 , yy] == 1 and qp <= 2{ 
											ds_inventory[# 1, yy] -= 1;
											qp += 1;
										}
									} 
									yy++;
									
									if ds_inventory[# 1, yy] == 0 {
										ds_inventory[# 0, yy] = items.none;
									}
								}
								
								}
							}
							if qp == 3 {
										questCompleted = true;
										grid[# 1, ii] += 1;
									}
				
						}
					}
					
				break;
				
				case 1: // -- Talk to Mysterious Figure -- 
					
					with(oPlayer)
					{
						if place_meeting(x, y, oMysteriousFigure)
						{
							
							player_exp += 100;
							grid[# 1, ii] += 1;
						}
					}
				break;
				
				case 2: // quest completed
					grid[# 1, ii] = -1; // set quest to inactive
				break;
			}
		
		#region KILL MAGIC SKELETONS
		case quests.heads_of_magic:
			
			switch(grid[# 1, ii])
			{
				case -1 : break;
			}
		
		
		break;
		#endregion
		
		
		#region KILL GUARDIAN BOSS
		case quests.guardian_of_depths:
		
			switch(grid[# 1, ii])
			{
				case -1 : break;
			}
		
		break;
		#endregion
		
	}
	
	
	ii++;
}











