// get the restart key input
restart_key = global.restart_key;

// fade in
alpha += alphaSpd;
alpha = clamp( alpha, 0, 1);

 // restart game
 if restart_key && alpha >= 1
 {
	 game_restart();
 }