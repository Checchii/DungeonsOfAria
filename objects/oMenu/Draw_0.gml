/// @description Insert description here
// You can write your code in this editor


// dynamically get width and height of menu
var _new_w = 0;
for (var i = 0; i < op_length; i++)
	{
		var _op_w = string_width(option[menu_level, i]);
		_new_w = max(_new_w, _op_w);
		
	}

width = _new_w + op_border*2; 
height = op_border*2 + string_height(option[0, 0]) + (op_length-1)*op_space;

// center menu
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2;

// draw the options
draw_set_font(Font1);
draw_set_valign(fa_top);
draw_set_halign(fa_center);

for (var i = 0; i < op_length; i++)
	{
		var _c = c_white;
		var str = option[menu_level, i]
		if pos == i { _c = c_yellow; str = " >" + str + "< "; };
		draw_text_transformed_color(x+op_border + 20, y+op_border + op_space*i + 70, str, .6, .6, 0, _c, _c, _c, _c, 1);
	}

draw_set_halign(fa_left);











