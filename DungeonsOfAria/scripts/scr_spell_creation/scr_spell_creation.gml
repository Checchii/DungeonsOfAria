// constructor template for spells
function create_spell(_sprite = obj_dark_orb, _spellTimer = 0, _spellCooldown = 26, _spell_dmg = 20, _mana_cost = 3) constructor
{
	sprite = _sprite;
	spellTimer = _spellTimer;
	spellCooldown = _spellCooldown;
	spell_dmg = _spell_dmg;
	mana_cost = _mana_cost;
	
}

// player's list of spells
global.PlayerSpellBook = array_create(0);


// the spells
global.SpellList = {
	
	dark_orb : new create_spell(oDarkOrb, 0, 26, 20, 3),
	dark_spell : new create_spell(oDarkSpell, 0, 35, 30, 5),
	
	
}