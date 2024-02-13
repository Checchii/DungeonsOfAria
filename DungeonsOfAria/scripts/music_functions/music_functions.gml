
function set_song_ingame( _song, _fadeOutCurrentSong = 0, _fadeIn = 0)
{
	with( oMusicManager )
	{
		targetSongAsset = _song;
		endFadeOutTime = _fadeOutCurrentSong;
		startFadeInTime = _fadeIn;
	}
}