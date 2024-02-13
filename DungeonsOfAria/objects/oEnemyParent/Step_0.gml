
if instance_exists(oPlayer)
{	
	check_for_player();
}

//recieve damage
get_damage(oDamageEnemy);


// death
if hp <= 0 
{ 
	instance_destroy();
}

