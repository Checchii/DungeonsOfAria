/* 
create events basically initialise the object's variables
when the object is created.

This happens according to the current room the player is in.
However, for some objects we don't want this to happen every time the player
moves back and forth between rooms.

Alternatively you can instantiate these objects once in an "initialising"
room that the player will never be able to access again during playthrough.

This prevents objects from being unintentionally created multiple times,
ultimately saving space in memory.
*/


















