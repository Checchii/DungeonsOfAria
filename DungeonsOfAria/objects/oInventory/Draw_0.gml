// draw our 9 slice box inventory 

	draw_sprite_stretched
	(
		sInventory,
		0,
		oPlayer.x - 75,
		oPlayer.y - 70,
		12 + row_length * 36,
		12+(((INVENTORTY_SLOTS-1) div row_length) +1) * 36
	);

	// draw the items
	for (var i = 0; i < INVENTORTY_SLOTS; i += 1)
	{
		var xx = oPlayer.x + (i mod row_length) * 36 + 2;
		var yy = oPlayer.y + (i div row_length) * 36 + 2;
		var hover = (oMouse.inventoryHover == id) && (oMouse.slotHover ==i);
	
		draw_sprite(sSlot, hover, xx -69, yy -64);
	
		if (inventory[i] != -1)
		{
			var alpha = 1.0;
			
			if (oMouse.inventoryDrag == id) && (oMouse.slotDrag == i)
			{
				alpha = 0.5;
			}
			
			draw_set_alpha(alpha);
			draw_sprite(sInvItems, inventory[i], xx - 69, yy - 64)
			draw_set_alpha(1.0);
		}
	}

