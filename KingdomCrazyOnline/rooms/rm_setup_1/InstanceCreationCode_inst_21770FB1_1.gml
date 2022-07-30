label = "Start New Game"
action = function() {
	obj_rollback_settings.host = true;
	room_goto(rm_setup_2);
	SOUND.play(snd_voice_show_on_the_road);
}