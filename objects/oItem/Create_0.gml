/// @description Insert description here
// You can write your code in this editor
depth = -20;

cell_size = 32;
item_spr = sItems;

spr_width = sprite_get_width(item_spr);
spr_height = sprite_get_height(item_spr);

item_number = -1;

x_frame = 0;
y_frame = 0;

x_offset = (cell_size/2);
y_offset = (cell_size/2);

drop_move = true;
// throw item in random direction 
var itemdir = irandom_range(0, 259);
var len		= 40;

goal_x		= x + lengthdir_x(len , itemdir);
goal_y		= y + lengthdir_y(len, itemdir);




