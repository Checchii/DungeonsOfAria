if room == rm_titleScreen
{
	set_song_ingame( sngIntro, 60, 0);
}

if room == rm_house
{
	set_song_ingame(sngHome, 60, 0);
}

if room == rm_outside
{
	set_song_ingame( sngTown, 60, 0);
}

if room == rm_dungeon1F || room == rm_dungeon2F
{
	set_song_ingame( sngDungeon, 60, 0);
}

if room == rm_path
{
	set_song_ingame( noone, 60, 0);
}

if room == rm_boss3F
{
	set_song_ingame( sngBoss, 60, 0);
}