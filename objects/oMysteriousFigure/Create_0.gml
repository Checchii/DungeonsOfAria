// @description - Initializing Variables for Quest Objectives
event_inherited();

myTextBox = noone;
myName = "Mysterious Figure";

myText[0] = "Psst, see that dungeon west of here?";
myText[1] = "Bring me back 3 Slime Goops and I'll make it worth your troubles.";

myText1[0] = "You're still hunting Slime Goops. I need 3 in total."

myText2[3] = "Excellent. Here's a little something for your troubles."

myText3[4] = "Care to do me another favor?"
myText3[5] = "I need Magical Skulls, 5 should do the trick. I'll give you something good in exchange."


questActive = false;
questCompleted = false;

quest_name = "";

item_counter = 0;
reward_xp = 0;

interactionDistance = 10;
interactionKey = false;

approached = false;

// if player meets requirement or not change dialogue accordingly
meetsRequirement = false;

// 0 denoting next dialogue page, -1 = exit dialogue (destroy)
nextLine = [0];







