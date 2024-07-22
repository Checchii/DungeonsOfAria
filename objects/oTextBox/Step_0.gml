/// @description Flipping Through Dialogue
var num_of_pages = array_length(text);

if keyboard_check_pressed(vk_space)
{
	// if pressing space doesnt go over the number of text pages go to next page
	if page + 1 < num_of_pages
	{
		page += 1;
		charCount = 0;
	}
	
	else // if last page of dialogue destroy box, set creator alarm to 1 frame
	{
		instance_destroy();
		creator.alarm[1] = 1; // waits 1 frame and then creates dialogue again
	}
	
}










