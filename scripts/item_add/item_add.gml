// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function item_add(_item){
	
	with(inv)
	{
		#region
		
		var ii = 0; repeat ( inv_slots ){
			if ds_inventory[# 0, ii] == items.none
			{
				ds_inventory[# 0 , ii] = _item;
				ds_inventory[# 1, ii] += 1;
				exit;
			} else if ds_inventory[# 0, ii] == _item
				{
					ds_inventory[# 1, ii] += 1;
					exit;
				} else { ii++; }
			} 
			
		#endregion
		
	}
}