/*

// decrease timer
followUpTimer = clamp(followUpTimer - 1, 0, followUpTimerMax);

// adjust follow up bar
if (followUpTimer == 0)
{
	healthPointsPrev = lerp(healthPointsPrev, healthPoints, 0.2);
}

if room == rm_boss3F{
	
	if oBoss.hp != healthPointsMax // if boss current hp != max hp
	{
		// damage was taken
		healthPoints = oBoss.hp; // set the hp to the current boss hp
		followUpTimer = followUpTimerMax; // reset the timer
	}
	
	if !instance_exists(oBoss) {
		instance_destroy(oBossHealthBar);
	}
	
}

*/



