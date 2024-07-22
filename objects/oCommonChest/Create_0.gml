/// @description Insert description here
// You can write your code in this editor

depth = -10;

spr_width = sprite_get_width(sCommonChest);
spr_height = sprite_get_height(sCommonChest);

r = 32;

chestOpened = false;

// amount is for coins
amount = 0;
drop_move = true;
random_loot = choose(1, 1, 2, 2, 3, 3);

var itemdir = irandom_range(0, 259);
var len		= 40;

goal_x		= x + lengthdir_x(len , itemdir);
goal_y		= y + lengthdir_y(len, itemdir);





