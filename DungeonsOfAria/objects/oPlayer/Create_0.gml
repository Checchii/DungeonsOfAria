// Damage setup
get_damage_create(30, true);

// Player info
#region
player_max_hp = 100;
player_mana = 30;
player_maxMana = 40;
player_exp = 0;
player_lvl = 1;

mana_regenTimer = 10;

exp_to_next_lvl = player_lvl * 100

player_SP = 0; // Player's Status Points which can be allocated to player's stats
#endregion

player_coinPouch = 0;

// Player Stats
#region
player_vitality = 0; // effects max health and health regen
player_agility = 0; // effects ability to dodge attacks and cast time
player_intelligence = 0; // effects spell dmg and mana cost
player_luck = 0; // increases player's luck (???)
#endregion



// Movement
#region
xspeed = 0;
yspeed = 0;
dir =  270; // down direction is default spell cast direction 
move_spd = 1.5;
#endregion



// Set the sprite
#region
sprite[RIGHT] = spr_player_right;
sprite[UP] = spr_player_up;
sprite[LEFT] = spr_player_left;
sprite[DOWN] = spr_player_down;
//  sprite[vk_space] = spr_attack; 
// create the animation sprite for spell casting ^

face = DOWN;
#endregion



// spell info
#region

	// add spell to players spellbook
	array_push( global.PlayerSpellBook, global.SpellList.dark_orb);
	
	selectedSpell = 0;
	currentSpell = global.PlayerSpellBook[selectedSpell];
	// set the current spell to our default dark orb spell
	// later once we create more spell we can change this out
	// so long as the player meets the requirement (player_lvl)
#endregion
	
						