// get rid of bullet 
if instance_exists( bulletInst ) && bulletInst.state == 0
{
	bulletInst.destroy = true;
}

// create a timer b/c atm if the bullet exists but the enemy is dead
// it is not being destoyed ( happens in the skeleton ) b/c the bullet
// state is a 1
	/// might of just fixed it check back in a few

// xpInst = instance_create_depth(x , y, depth, oExpDrop);
if place_meeting(x, y, oDarkOrb) && hp <=0{
	oPlayer.player_exp += experience_points;
}

instance_create_depth(x, y, 0, dropped_loot);