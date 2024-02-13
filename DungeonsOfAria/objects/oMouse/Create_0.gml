// state machine
inventoryHover = -1;
slotHover = -1;
inventoryDrag = -1;
slotDrag = -1;
itemDrag = -1;

mouseOver = function()
{
	// empty hover results
	slotHover = -1;
	inventoryHover = -1;
	
	// mouse coordinates
	var mx = mouse_x;
	var my = mouse_y;
	
	
	// check for inventory slot hover
	with (oInventory)
	{
		
		if (point_in_rectangle
		(
			mx,
			my,
			oPlayer.x - 75,
			oPlayer.y - 70,
			oPlayer.x - 75 + 12+row_length*36,
			oPlayer.y - 70 + 12+(((INVENTORTY_SLOTS-1) div row_length)+1)*36
		))
		{
			// check for mouseover in each slot
			for (var i =0; i < INVENTORTY_SLOTS; i += 1)
			{
				var xx = oPlayer.x + (i mod row_length) * 36 + 2;
				var yy = oPlayer.y + (i div row_length) * 36 + 2;
				
				if (point_in_rectangle(mx, my, xx-69, yy-64, xx, yy))
				{
					other.slotHover = i;
					other.inventoryHover = id;
				}
			}
		}
	}
	
}

stateFree = function()
{
	mouseOver();
	// start to drag an item if slot is not empty
	if (mouse_check_button(mb_left)) && (slotHover != -1) && (inventoryHover.inventory[slotHover] != -1)
	{
		// enter the drag state
		state = stateDrag;
		itemDrag = inventoryHover.inventory[slotHover];
		inventoryDrag = inventoryHover;
		slotDrag = slotHover;
	}
}

stateDrag = function()
{
	mouseOver();
	if (!mouse_check_button(mb_left))
	{
		// swap with slot if hovering
		if (slotHover != -1)
		{
			InventorySwap(inventoryDrag, slotDrag, inventoryHover, slotHover);
		}
		
		// return to free state
		state = stateFree;
		itemDrag = -1;
		inventoryDrag = -1;
		slotDrag = -1;
	
	}
}

state = stateFree;