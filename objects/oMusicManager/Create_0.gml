// global volume control
global.masterVolume = .4;
global.musicVolume = .4;

// info for the song we are currently playing / trying to play
songInstance = noone; 

songAsset = noone;
targetSongAsset = noone;

endFadeOutTime = 0; // number of frames to fade out song playing
startFadeInTime = 0; // number of frames to fade in new song

fadeInVolume = 1; // volume of song instance

// for fading music out and stopping songs that are no longer playing
fadeOutInstances = array_create(0); // the audio instance to fade out
fadeOutInstVol = array_create(0); // the volumes of each individual audio instance
fadeOutInstTime = array_create(0); // how fast the fadeout should happen
