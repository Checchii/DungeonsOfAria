if (itemDrag != -1)
{
	draw_set_alpha(0.5);
	draw_sprite(sInvItems, itemDrag, mouse_x, mouse_y);
	depth = -1010;
	draw_set_alpha(1.0);
}








