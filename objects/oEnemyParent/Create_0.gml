event_inherited();

get_damage_create();

max_HP = 100;


// alert state if true chase player
alert = false;

// distance from player to turn alert state true
alert_dist = 40;

// set distance from player to attack
attack_distance = 10;

// create pathing resource
path = path_add();

// default chase speed
move_spd = .3;

// set delay for calculating path
calc_path_delay = 30;

// set a timer for when we calculate path
calc_path_timer = irandom(60);

experience_points = noone;