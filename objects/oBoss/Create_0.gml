event_inherited();

get_damage_create();

depth = -1002;

// boss total health
max_hp = 1000;
// boss current hp
hp = max_hp;

// alert state if true chase player
alert = false;
// distance from player to turn alert state true
alert_dist = 20;
// set distance from player to attack
attack_distance = 10;


// damage set to 0, will give different values per attack
damage = 10;


// movement
xspd = 0;
yspd = 0;
dir = 0;

chaseSpd = .7;
move_spd = .7;


// state machine
state = -1;

	// idle state
	alert_dist = 40;
	attack_distance = 10;
	
	
	// shooting icicles state
	cooldownTime = 3*60;
	shootTimer = irandom( cooldownTime );
	windupTimer = 30;
	recoverTime = 25;
	bulletInst = noone;
	
	bulletxOffset = 0;
	bulletyOffset = -10;
	
	// charge ice attack state
	
