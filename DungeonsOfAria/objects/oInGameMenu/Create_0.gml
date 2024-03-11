global.game_menu_visible = false;

global.view_width = camera_get_view_width(view_camera[0]);
global.view_height = camera_get_view_height(view_camera[0]);

up_key = 0;
left_key = 0;
right_key = 0;
down_key = 0; 

display_set_gui_size(global.view_width, global.view_height);

#macro MAIN 0
#macro SETTINGS 1
#macro CONTROLS 2

global.dsm_settings = ds_map_create();
#macro set global.dsm_settings

ds_map_add(set, "music", [0, ["    ON", "    OFF"]]);

ds_map_add(set, "key_up",			[0, ["    UP",		"    W"]]);
ds_map_add(set, "key_left",			[0, ["    LEFT",	"    A"]]);
ds_map_add(set, "key_right",		[0, ["    RIGHT",	"    D"]]);
ds_map_add(set, "key_down",			[0, ["    DOWN",	"    S"]]);

// Main Menu

menu[MAIN][0] = "RESUME";
menu[MAIN][SETTINGS] = "OPTIONS";
menu[MAIN][2] = "QUIT GAME";

menu[SETTINGS][0] = ["MUSIC", "music"];
menu[SETTINGS][1] = "CONTROLS";
menu[SETTINGS][2] = "BACK";

menu[CONTROLS][0] = ["UP",		"key_up"];
menu[CONTROLS][1] = ["LEFT",	"key_left"];
menu[CONTROLS][2] = ["RIGHT",	"key_right"];
menu[CONTROLS][3] = ["DOWN",	"key_down"];
menu[CONTROLS][4] = "BACK";

index = 0;
sub_menu = 0;


