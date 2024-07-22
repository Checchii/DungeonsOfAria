event_inherited();

get_damage_create(100);

xspd = 0;
yspd = 0;
dir = 0;

chaseSpd = .7;
move_spd = .5;

sprite[DOWN] = sSlimeDown;
sprite[UP] = sSlimeUp;
sprite[LEFT] = sSlimeLeft;
sprite[RIGHT] = sSlimeRight;

face = DOWN;

damage = 3;
max_HP = 100;

// state machine
state = -1;

	// unaggressive state
	alert_dist = 70;
	attack_distance = 10;
	
	
	// shooting state
	cooldownTime = 4*60;
	shootTimer = irandom( cooldownTime );
	windupTimer = 60;
	recoverTime = 45;
	bulletInst = noone;
	
	bulletxOffset = 0;
	bulletyOffset = -10;


// Loot table
loot_table = [oSlimeGoop];

// get loot
LootTable(oSlimeNormal);

experience_points = irandom_range(3, 13);

alarm[1] = 1;