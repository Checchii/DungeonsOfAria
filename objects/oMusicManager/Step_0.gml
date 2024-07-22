
var _finalVol = global.musicVolume*global.masterVolume;

// play the target song
if songAsset != targetSongAsset
{
	// tell the old song to fade out
	if audio_exists( songInstance )
	{
		// add our songInstance to our array of songs to fade out
		array_push( fadeOutInstances, songInstance );
		// add the songInstance's starting volume ( so there's no abrupt change in volume )
		array_push( fadeOutInstVol, fadeInVolume );
		// add the fadeOutInstance's fade out frames
		array_push( fadeOutInstTime, endFadeOutTime );
		
		// reset the song instance and song asset variables
		songInstance = noone;
		songAsset = noone;
	
	}
	
	
	// play the song, if the old song has faded out
	if array_length( fadeOutInstances ) == 0
	{
		if audio_exists( targetSongAsset )
		{
			// play the song and store it's instance in a variable
			songInstance = audio_play_sound( targetSongAsset, 4, true );
	
			// start the song's volume at 0
			audio_sound_gain( songInstance, 0, 0);
			fadeInVolume = 0;
	
		}
	
		// set the song asset to match the target song asset
		songAsset = targetSongAsset;
	}
	
}

// volume control
	// main song volume
	if audio_is_playing( songInstance )
	{
		// fade the song in
		if startFadeInTime > 0
		{
			if fadeInVolume < 1 { fadeInVolume += 1/startFadeInTime; } else fadeInVolume =1;
		}
		// if fade in time is 0 start the song
		else
		{
			fadeInVolume = 1;
		}
	
		// actually set the gain
		audio_sound_gain( songInstance, fadeInVolume*_finalVol, 0);
	}

	// fading songs out
	for (var i = 0; i < array_length( fadeOutInstances ); i++ )
	{
		// fade the volume
		if fadeOutInstVol[i] > 0
		{
			if fadeOutInstVol[i] > 0 { fadeOutInstVol[i] -= 1/fadeOutInstTime[i]; };
		}
		
		// immediately cut volume to 0 else
		else
		{
			fadeOutInstVol[i] = 0;
		}
		
		// actually set the gain
		audio_sound_gain( fadeOutInstances[i], fadeOutInstVol[i]*_finalVol, 0);
		
		// stop the song when it's volume is 0 and remove it from ALL arrays
		if fadeOutInstVol[i] <= 0
		{
			// stop playing the song
			if audio_is_playing( fadeOutInstances[i] ) { audio_stop_sound( fadeOutInstances[i] ); };
			
			// remove it from the arrays
			array_delete( fadeOutInstances, i, 1 );
			array_delete( fadeOutInstVol, i, 1);
			array_delete( fadeOutInstTime, i, 1);
			
			// set the loop back 1 since we just deleted an entry
			i--;
		}
	}