// Inherit the parent event
event_inherited();

damage = 7;

dir = 0;
spd = 1.2;
xspd = 0;
yspd = 0;

// state control
state = 0;
// 0 = not moving, aim at player and wait for enemy to shoot
// 1 = shoot towards player

maxDist = 30;

// cleanup
destroy = false;
pierce = false; 

countdown = 2*60;