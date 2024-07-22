// get the player's info
if instance_exists(oPlayer)
{
	playerHP = oPlayer.hp;
	playerMaxHP = oPlayer.max_hp;
	playerMP = oPlayer.player_mana;
	playerMaxMana = oPlayer.player_maxMana;
	playerLevel = oPlayer.player_lvl;
	playerXP = oPlayer.player_exp;
	playerXpToLevel = oPlayer.exp_to_next_lvl;
	
} else {
	playerHP = 0;
}

if room == rm_boss3F and instance_exists(oBoss)
{
	
		// decrease timer
		followUpTimer = clamp(followUpTimer - 1, 0, followUpTimerMax);

		// adjust follow up bar
		if (followUpTimer == 0)
		{
			healthPointsPrev = lerp(healthPointsPrev, healthPoints, 0.2);
		}

		if room == rm_boss3F && instance_exists(oBoss)
		{
	
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

}