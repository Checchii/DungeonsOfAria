// get the camera coordinates
var _camX = camera_get_view_x( view_camera[0] );
var _camY = camera_get_view_y( view_camera[0] );

// draw textbox 
draw_sprite_ext(sDialogueBox, 0, _camX + 45, _camY +150, 1.3 , 1, 0, c_white, 1);


// draw text
draw_set_font(Font1)

if charCount < string_length(text[page])
{
charCount += 1;
}

// draw name
draw_set_halign(fa_center);
draw_text_transformed_color(_camX + (boxW/2) + string_length(name) + 30, _camY + 142, name, .5, .5, 0 , c_black, c_black, c_black, c_black, 1);
draw_set_halign(fa_left);

// draw part of text
textPart = string_copy(text[page], 1, charCount);
draw_text_ext_transformed_color(_camX + 50 , _camY + 155, textPart, stringHeight, boxW * 2 - 10, .5, .5, 0, c_black, c_black, c_black, c_black, 1);