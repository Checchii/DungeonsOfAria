// inherits event from NPC Parent, displays Interaction Button
event_inherited();

// destroy shop window if player moves away
if distance_to_object(oPlayer) > interactionDistance && instance_exists(oStoreWindow)
{
	oStoreWindow.toggleOn = false;
}