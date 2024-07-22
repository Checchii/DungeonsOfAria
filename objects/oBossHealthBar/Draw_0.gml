/*

if room == rm_boss3F
{
	
	var spr = sBossHPBar;
	var spriteWidth = sprite_get_width(spr);
	var spriteHeight = sprite_get_height(spr);
	

	// cam width 320 cam height 220
	var xPosition = (camera_get_view_x( view_camera[0] ) / 2) + 190; // center
	var yPosition = (camera_get_view_y( view_camera[0] ) + 150); //
	
	// draw sprite with these offsets
	var xOffset = (xPosition - round(spriteWidth/2) + 50);
	var yOffset = (yPosition - 200);


	draw_sprite_ext(spr, 0, xPosition, yPosition, 1, 1, 0, c_white, 1); // draws the background bar
	draw_sprite_ext(spr, 1, xPosition, yPosition, (healthPointsPrev/healthPointsMax), 1, 0, c_white, 1); // draws the timer bar
	draw_sprite_ext(spr, 2, xPosition, yPosition, (healthPoints/healthPointsMax), 1, 0, c_white, 1); // draws the hp
	draw_sprite_ext(spr, 3, xPosition, yPosition, 1, 1, 0, c_white, 1); // draws the frame


	// Markers
	var xLength = 281;
	var markerValue = 250;
	var markerCount = (healthPointsMax/markerValue);

	var markerOffset = (xLength/markerCount);


	for (var i = 1; i < markerCount; i++)
	{
		draw_sprite_ext(sBossBarMarker, 0 , xPosition + (markerOffset * i) -1, yPosition, 1, 1, 0, c_white, 1);
	}

}

*/