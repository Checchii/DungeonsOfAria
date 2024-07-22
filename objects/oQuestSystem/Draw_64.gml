
var str = "";

var i = 0; repeat(ds_quests_number)
{
	var stage = ds_quests[# 1, i];
	
	if (stage != -1){
		var array = ds_quests[# 2, i];
		str += "\n" + string_upper(ds_quests[# 0, i]) + ": " + "\n" + array[stage]; 
	}
	
	i++;
}


if room != rm_titleScreen && room != rm_outside
{
	var c = c_white;
	draw_set_font(Font1);
	draw_text_transformed_color(10, 150, str, .45, .45, 0, c , c, c, c, 1);
}






