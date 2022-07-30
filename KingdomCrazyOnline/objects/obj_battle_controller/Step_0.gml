/// @description Insert description here
// You can write your code in this editor

switch (mode)
{
	case Battle_Modes.intro:
		intro_timer -= 1;
		if intro_timer = room_speed*2
		{
			intro_message = "Ready...";
			SOUND.play(snd_voice_ready);
		}
		if intro_timer = 0
		{
			instance_create_depth(0,0,0, obj_speed_lines);
			intro_message = "Fight!";
			SOUND.play(snd_voice_fight);
			mode = Battle_Modes.fight;
		}
	break;
	
	case Battle_Modes.fight:
		timer -= 1;
		display_timer = floor(timer/room_speed);
		
		if instance_number(obj_player) = 1
		{
			mode = Battle_Modes.victory;
			winner = obj_player.player_name;
			winner_color = obj_player.color;
		}
	break;

	case Battle_Modes.victory:
		mode_counter += 1;
		if mode_counter > room_speed * 3
		{
			mode_counter = 0;
			room_restart();
			mode = Battle_Modes.intro;
		}
	break;
}