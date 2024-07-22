var _camX = camera_get_view_x( view_camera[0] );
var _camW = camera_get_view_width( view_camera[0] );
var _camY = camera_get_view_y( view_camera[0] );
var _camH = camera_get_view_height( view_camera[0] );


// draw a black rectangle over the screen
	draw_set_alpha( alpha*alphaMax );
	draw_rectangle_color( _camX, _camY, _camX + _camW, _camY + _camH, c_black, c_black, c_black, c_black, false );


// draw the text

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha( alpha );
	draw_set_font( Font1 );
	
	// "game over"
	var _gameoverOffset = -40;
	draw_text_transformed( _camX + _camW/2, _camY + _camH/2 + _gameoverOffset, "Game Over", 1, 1, 0 );
	
	// press key to restart
	var _restartOffset = 70;
	draw_text_transformed( _camX + _camW/2, _camY + _camH/2 + _restartOffset, "- Press R to Restart -", .5, .5, 0 );
	
	
	// reset draw settings
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha( 1 );