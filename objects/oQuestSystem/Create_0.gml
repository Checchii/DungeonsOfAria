/// @description 
depth = -9999;

enum quests {
	
	slimey_droppings,
	heads_of_magic,
	guardian_of_depths,
	
}

// -1 denoting "INACTIVE" quest
var quest_array = [
	
	[
		"Slimey Droppings",
		-1,
		["Bring 3 Slime Goops to Mysterious Figure.", "Talk to Mysterious Figure to claim reward.", "Quest Completed!"] 
	],
	
	[
		"Heads Full Of Magic",
		-1,
		["Collect 5 Magical Skulls.", "Bring 5 Magical Skulls to Mysterious Figure.", "Quest Completed!"]
	],
	
	[
		"Guardian of Depths",
		-1,
		["Reach the farthest room in the Dungeon.", "Defeat the Guardian.", "Return to Mysterious Figure."]
	],

];

ds_quests = create_ds_grid_from_array(quest_array);
ds_quests_number = ds_grid_height(ds_quests);

systemQuestActive = false;
questProgress = 0;

questActive = false;
