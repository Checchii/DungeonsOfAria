// spell movement
xspd = lengthdir_x(spd, dir);
yspd = lengthdir_y(spd, dir);

x += xspd;
y += yspd;

// cleanup

	// hit confirm destroy
	if hitConfirm == true && pierce == false { destroy = true; };

	// destroy
	if destroy == true { instance_destroy(); };
	
	// collision 
	if place_meeting( x, y , obj_wall) { destroy = true; };
	
	// spell fades away over time until its destroyed
	var _fadeTimer = 100;
	
	while point_distance(xstart, ystart, x, y) < maxDist 
	{
		// decrease alpha over time
		if image_alpha > 0 && _fadeTimer > 0
		{
			image_alpha -= 0.01;
			_fadeTimer--;
		} 
		_fadeTimer = 100;
		break;
	}
		

	// if spell out of range 
	if point_distance(xstart, ystart, x, y) > maxDist 
	{ 
		destroy = true; 
	}