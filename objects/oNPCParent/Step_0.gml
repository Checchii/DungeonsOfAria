/// @description Interaction with player

var ShopX = oShopKeeper.x;
var ShopY = oShopKeeper.y;

var MFX = oMysteriousFigure.x;
var MFY = oMysteriousFigure.y;



// as the player approaches the npc create the interaction indicator button
if place_meeting(ShopX, ShopY, oPlayer)
{
	//instance_create_depth(x, y - 30, -900, oInteractionButton);
	instance_create_layer(x, y - 30, "InteractionButton", oInteractionButton);
	
	// if the button exists and the player moves away, remove the interaction button
	if instance_exists(oInteractionButton) && distance_to_object(oPlayer) > interactionDistance
	{
		instance_destroy(oInteractionButton);
	}
	
}


if place_meeting(MFX, MFY, oPlayer)
{
	//instance_create_depth(x, y - 30, -900, oInteractionButton);
	instance_create_layer(x, y - 30, "InteractionButton", oInteractionButton);
	
	// if the button exists and the player moves away, remove the interaction button
	if instance_exists(oInteractionButton) && distance_to_object(oPlayer) > interactionDistance
	{
		instance_destroy(oInteractionButton);
	}

}



// destroy text box if player moves away
if distance_to_object(oPlayer) > interactionDistance && myTextBox != noone
{
	instance_destroy(myTextBox)
	myTextBox = noone;
	
}





