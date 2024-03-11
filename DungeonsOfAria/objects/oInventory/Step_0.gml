/// @description Insert description here
// You can write your code in this editor
if room != rm_titleScreen
{


	// open the inventory 
	if keyboard_check_pressed(vk_tab)
	{
		visible = 1;
		oPlayer.move_spd = 0;
		depth = -1000;	
	
	}
	
	// close the inventory when tab key is released
	if visible == 1 && keyboard_check_released(vk_tab)
	{
		visible = 0;
		oPlayer.move_spd = 1.5;
		
	}
	
}