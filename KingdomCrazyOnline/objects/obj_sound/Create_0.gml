/// @description Insert description here
// You can write your code in this editor

master_gain = 1;

playing_sounds = []

play_music = function(_soundid) {
	return audio_play_sound(_soundid, 0, true);
}

play = function(_soundid, _pitch = 1, _gain = 1) 
{
	var _sound = audio_play_sound(_soundid, 0, false);
	
	var _soundid_gain = audio_sound_get_gain(_soundid);
	audio_sound_gain(_sound, master_gain * _soundid_gain * _gain, 0);
	
	audio_sound_pitch(_sound, _pitch);
	
	playing_sounds[array_length(playing_sounds)] = _sound;
	return _sound;
}

stop_all = function() {
	for (var i = array_length(playing_sounds)-1; i >= 0; i--)
	{
		_sound = playing_sounds[i];
		audio_stop_sound(_sound);
		array_delete(playing_sounds, i, 1);	
	}	
}

#macro SOUND obj_sound
if (instance_number(obj_sound) > 1) {instance_destroy()};