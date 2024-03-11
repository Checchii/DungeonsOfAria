// get the camera coordinates
var _camX = camera_get_view_x( view_camera[0] );
var _camY = camera_get_view_y( view_camera[0] );

/*
// draw the player's info
var _hpString = "HP: " + string(playerHP) + "/" + string(playerMaxHP);
var _mpString = "MP: " + string(playerMP);


draw_text( _camX + 5, _camY + 5, _hpString );
draw_text( _camX + 5, _camY + 20,_mpString );


*/

// draw player HUD
if room != rm_house && room != rm_titleScreen
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
	
		
		// draw the player's coin pouch 
		var _coinPaddingX = 15;
		var _coinPaddingY = 200;
		draw_sprite( sCoin, 0, _camX + _coinPaddingX, _camY + _coinPaddingY );
		
		var _coinAmount = "GP: " + string(player_coinPouch);
		draw_text_transformed( _camX + 35, _camY + 180, _coinAmount, .5, .5, 0 );
}