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

exp_to_next_lvl = player_lvl * 100 + 20

level_up = false;

player_SP = 0; // Player's Status Points which can be allocated to player's stats
#endregion


// Player Stats
#region
player_vitality = 0; // effects max health and health regen
player_agility = 0; // effects ability to dodge attacks and cast time
player_intelligence = 0; // effects spell dmg and mana cost
player_luck = 0; // increases player's luck (???)
#endregion

// Equipment
#region
head_slot = -1;
chest_slot = -1;
leg_slot = -1;
glove_slot = -1;

necklace_slot = -1;
ring_slot = -1;
staff_slot = -1;
misc_slot = -1;
#endregion

// Movement
#region
xspeed = 0;
yspeed = 0;
dir =  270; // down direction is default spell cast direction 
move_spd = 2;
#endregion



// Set the sprite
#region
sprite[RIGHT] = sPLayerRight;
sprite[UP] = sPlayerUp;
sprite[LEFT] = sPlayerLeft;
sprite[DOWN] = sPlayerDown;
sprite[DEATH] = sPlayerDeath;
//  sprite[vk_space] = spr_attack; 
// create the animation sprite for spell casting ^

face = DOWN;
#endregion



// spell info
#region

	// add spell to players spellbook
	array_push(global.PlayerSpellBook, global.SpellList.shadow_orb);
	
	selectedSpell = 0;
	currentSpell = global.PlayerSpellBook[selectedSpell];
	// set the current spell to our default shadow orb spell
	// later once we create more spell we can change the current spell
	// so long as the player meets the requirement
	// - future implementation - 
	// add a spellbook interface similar to old school runescape
	// showcasing 10+ different spells and the required magic level
	// to cast
	
	
#endregion
	
						