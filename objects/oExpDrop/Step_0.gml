// assign the correct amount of exp to this object depending on dungeon lvl
if room == rm_dungeon1F
{
	experience_points = irandom_range(3, 13);
}

if room == rm_dungeon2F
{
	experience_points = irandom_range(15, 25);
}


if place_meeting( x, y, oPlayer){
	
	//grant the player xp depending on the monster 
	oPlayer.player_exp += experience_points;
	// destroy self
	instance_destroy();
}

