/// @description Insert description here
// You can write your code in this editor

if distance_to_object(oPlayer) < interactionDistance
{
	if myTextBox == noone
	{
	myTextBox = instance_create_layer(x, y, "Text", oTextBox);
	myTextBox.text = myText;
	myTextBox.creator = self;
	myTextBox.name = myName;
	}
}










