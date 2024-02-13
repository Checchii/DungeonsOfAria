/// @description Insert description here
// You can write your code in this editor
if room != rm_titleScreen
{
if visible == 0 && keyboard_check(vk_tab)
{
	visible = 1;
	
	oPlayer.move_spd = 0;
	// oPlayer.visible = 0;
	depth = -1000;
}

if keyboard_check(vk_escape)
{
	visible = 0;
	// oPlayer.visible = 1;
	oPlayer.move_spd = 1.5;
}

}