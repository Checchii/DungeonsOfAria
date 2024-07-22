// get the camera coordinates
var _camX = camera_get_view_x( view_camera[0] );
var _camY = camera_get_view_y( view_camera[0] );


// draw Player HUD
#region DUNGEON FLOORS HUD
if room != rm_titleScreen and room != rm_boss3F
{
	
	var _padding = 5;
	draw_sprite( sHealthBar, 0, _camX + _padding, _camY + _padding);

		for (var i =  0; i < playerMaxHP; i++)
		{
			// show current hp 
			var _img = 1;
			if i+1 <= playerHP { _img = 2; };
	
	
			var _sep = 3;
			draw_sprite( sHealthBar, _img, _camX + _padding + _sep*i, _camY + _padding);
		}
	
		// drawing the mana bar
		var _mpPaddingX = 25;
		var _mpPaddingY = 19;
		draw_sprite( sManaBar, 0, _camX + _mpPaddingX, _camY + _mpPaddingY);

		for ( var i = 0; i < playerMaxMana; i++)
		{
			var _mpImg = 0;
			if i+1 <= playerMP { _mpImg = 1; };
		
			var _mpSep = 2;
			draw_sprite( sManaBar, _mpImg, _camX + _mpPaddingX + _mpSep*i, _camY + _mpPaddingY);

		}
	
		// drawing player's lvl and current xp
		draw_set_font( Font1 );
		var _lvlString = "Lv: " + string(playerLevel);
		var _xpString = "XP: " + string(playerXP) + "/" + string(playerXpToLevel);

		draw_text_transformed( _camX + 15, _camY + 30, _lvlString, .5, .5, 0 );
		draw_text_transformed( _camX + 70, _camY + 30, _xpString, .5 , .5, 0 );
		
		
		
}
#endregion

// boss room HUD
#region BOSS ROOM HUD
if room == rm_boss3F && instance_exists(oBoss)
{
	var _padding = 5;
	draw_sprite( sHealthBar, 0, _camX + _padding, _camY + _padding);

		for (var i =  0; i < playerMaxHP; i++)
		{
			// show current hp 
			var _img = 1;
			if i+1 <= playerHP { _img = 2; };
	
	
			var _sep = 3;
			draw_sprite( sHealthBar, _img, _camX + _padding + _sep*i, _camY + _padding);
		}
	
		// drawing the mana bar
		var _mpPaddingX = 25;
		var _mpPaddingY = 19;
		draw_sprite( sManaBar, 0, _camX + _mpPaddingX, _camY + _mpPaddingY);

		for ( var i = 0; i < playerMaxMana; i++)
		{
			var _mpImg = 0;
			if i+1 <= playerMP { _mpImg = 1; };
		
			var _mpSep = 2;
			draw_sprite( sManaBar, _mpImg, _camX + _mpPaddingX + _mpSep*i, _camY + _mpPaddingY);

		}
	
		// drawing player's lvl and current xp
		draw_set_font( Font1 );
		var _lvlString = "Lv: " + string(playerLevel);
		var _xpString = "XP: " + string(playerXP) + "/" + string(playerXpToLevel);

		draw_text_transformed( _camX + 15, _camY + 30, _lvlString, .5, .5, 0 );
		draw_text_transformed( _camX + 70, _camY + 30, _xpString, .5 , .5, 0 );
	
		var spr = sBossHPBar;
		var spriteWidth = sprite_get_width(spr);
		var spriteHeight = sprite_get_height(spr);
	

		// using _camX and _camY with offsets
		
		//var xPosition = (camera_get_view_x( view_camera[0] ) / 2) + 190; // center
		//var yPosition = (camera_get_view_y( view_camera[0] ) + 150); //
	
		// draw sprite with these offsets
		//var xOffset = (xPosition - round(spriteWidth/2) + 50);
		//var yOffset = (yPosition - 200);


		draw_sprite_ext(spr, 0, _camX + 15, _camY + 200, 1, 1, 0, c_white, 1); // draws the background bar
		draw_sprite_ext(spr, 1, _camX + 15, _camY + 200, (healthPointsPrev/healthPointsMax), 1, 0, c_white, 1); // draws the timer bar
		draw_sprite_ext(spr, 2, _camX + 15, _camY + 200, (healthPoints/healthPointsMax), 1, 0, c_white, 1); // draws the hp
		draw_sprite_ext(spr, 3, _camX + 15, _camY + 200, 1, 1, 0, c_white, 1); // draws the frame


		// Markers
		var xLength = 281;
		var markerValue = 250;
		var markerCount = (healthPointsMax/markerValue);

		var markerOffset = (xLength/markerCount);


		for (var i = 1; i < markerCount; i++)
		{
			draw_sprite_ext(sBossBarMarker, 0 , _camX +15  + (markerOffset * i) -1, _camY + 200, 1, 1, 0, c_white, 1);
		}

} else if room == rm_boss3F && !instance_exists(oBoss)
{
	var _padding = 5;
	draw_sprite( sHealthBar, 0, _camX + _padding, _camY + _padding);

		for (var i =  0; i < playerMaxHP; i++)
		{
			// show current hp 
			var _img = 1;
			if i+1 <= playerHP { _img = 2; };
	
	
			var _sep = 3;
			draw_sprite( sHealthBar, _img, _camX + _padding + _sep*i, _camY + _padding);
		}
	
		// drawing the mana bar
		var _mpPaddingX = 25;
		var _mpPaddingY = 19;
		draw_sprite( sManaBar, 0, _camX + _mpPaddingX, _camY + _mpPaddingY);

		for ( var i = 0; i < playerMaxMana; i++)
		{
			var _mpImg = 0;
			if i+1 <= playerMP { _mpImg = 1; };
		
			var _mpSep = 2;
			draw_sprite( sManaBar, _mpImg, _camX + _mpPaddingX + _mpSep*i, _camY + _mpPaddingY);

		}
	
		// drawing player's lvl and current xp
		draw_set_font( Font1 );
		var _lvlString = "Lv: " + string(playerLevel);
		var _xpString = "XP: " + string(playerXP) + "/" + string(playerXpToLevel);

		draw_text_transformed( _camX + 15, _camY + 30, _lvlString, .5, .5, 0 );
		draw_text_transformed( _camX + 70, _camY + 30, _xpString, .5 , .5, 0 );
}
#endregion