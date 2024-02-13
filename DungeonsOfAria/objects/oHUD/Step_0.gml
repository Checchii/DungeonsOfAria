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
	player_coinPouch = oPlayer.player_coinPouch;
	
	
} else {
	playerHP = 0;
}