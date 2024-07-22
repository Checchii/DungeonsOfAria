/// @description Randomize NPC Movement

xspd = 0;
yspd = 0;

var idle = choose(0, 1);

if idle == false
{
	var dir = choose(1,2,3,4);
	
	switch(dir)
	{
		case 1: xspd = -move_spd; break; // move left
		case 2: xspd = move_spd; break; // move right
		case 3: yspd = -move_spd; break; // move up
		case 4: yspd = move_spd; break; // move down
	}
	
}

alarm[1] = irandom_range(2.5, 4) * 20;












