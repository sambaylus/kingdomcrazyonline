/// @description Insert description here
// You can write your code in this editor

for (var i = array_length(playing_sounds)-1; i >= 0; i--)
{
	_sound = playing_sounds[i];
	if 	!audio_is_playing(_sound)
	{
		array_delete(playing_sounds, i, 1);	
	}
}