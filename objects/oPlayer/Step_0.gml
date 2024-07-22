
right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);
space_key = global.space_key;
restart_key = global.restart_key;

// get xspeed and yspeed
// if right key pressed = 1
// if down key pressed = 1
xspeed = (right_key - left_key) * move_spd;
yspeed = (down_key - up_key) * move_spd;

// set sprite
mask_index = sprite[DOWN];

// Movement and Player Sprite
#region
if yspeed == 0 // if moving left or right
	{
	if xspeed > 0  // if walking right set face = right
	{ 
		face = RIGHT;
		dir = 0;
		
	}; 
	if xspeed < 0 // if walking left set face = left
	{ 
		face = LEFT;
		dir = 180;
	}; 
	}
	
if xspeed > 0 && face == LEFT { face = RIGHT }; // reset face accordingly
if xspeed < 0 && face == RIGHT { face = LEFT };

if xspeed == 0 // if moving up or down
	{
	if yspeed > 0  // if walking down set face = down
	{ 
		face = DOWN;
		dir = 270;
	};
	if yspeed < 0 // if walking up set face = up
	{ 
		face = UP;
		dir = 90;
	}; 
	}
	
if yspeed > 0 && face == UP { face = DOWN }; // reset face accordingly
if yspeed < 0 && face == DOWN { face = UP };
#endregion

// Player Spell Cast and Mana Regen
#region
if player_mana > 0
{
	if currentSpell.spellTimer > 0 { currentSpell.spellTimer--; };
	if space_key && currentSpell.spellTimer <= 0
	{
		// reset the spell cast timer
		currentSpell.spellTimer = currentSpell.spellCooldown;
	
			// create the spell
			var _spell_inst = instance_create_depth(x, y - 7, depth-100, currentSpell.sprite);
			player_mana -= currentSpell.mana_cost; // spell cost taken from players total mana

			// change spells direction
			with(_spell_inst)
			{
				dir = other.dir;
		
			}
	};
}

// magic power regen over time ( could implement the same for hp )
if player_mana < player_maxMana && mana_regenTimer > 0 
{ 
	mana_regenTimer--;
	
	if player_mana != player_maxMana && mana_regenTimer == 0 
	{ 
		player_mana += 1;
		mana_regenTimer = 70;
	}
	
}
#endregion

// level up 
if player_exp >= exp_to_next_lvl
{
	player_lvl += 1;
	player_SP += 1; // give 1 status point to player to use in any skill
	
	exp_to_next_lvl = player_lvl * 100;
	player_exp = 0;
	
	instance_create_depth(x, y - 6, -999, oFireworks);
	//draw_text_transformed_color(x, y - 6, "LEVEL UP!", .5, .5, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
}


sprite_index = sprite[face];


// collision
if place_meeting(x + xspeed, y, obj_wall) == true
{
	xspeed = 0;
}
if place_meeting(x, y + yspeed, obj_wall) == true
{
	yspeed = 0;
}


// move the player
x += xspeed;
y += yspeed;

// get damage
get_damage(oDamagePlayer, true);

// spell swapping
var _playerSpells = global.PlayerSpellBook;

if keyboard_check_pressed(ord( "Q" ))
{
	// change selected spell and wrap around array
	selectedSpell++;
	
	if selectedSpell >= array_length(_playerSpells)
	{
		selectedSpell = 0;
	}
	
	// set the new spell
	currentSpell = _playerSpells[selectedSpell];
}

//animate
if xspeed == 0 && yspeed == 0
{
	image_index = 1;
}

// depth
depth = -bbox_bottom;


// death / game over
if hp <= 0
{
	//face = DEATH;
	
	// create the game over screen object 
	instance_create_depth(0, 0, -10000, oGameOverScreen);
	
	// destroy self
	instance_destroy();
}



