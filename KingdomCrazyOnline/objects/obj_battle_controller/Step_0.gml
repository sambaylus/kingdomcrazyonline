/// @description Insert description here
// You can write your code in this editor

switch (mode)
{
	case Battle_Modes.intro:
		intro_timer -= 1;
		if intro_timer = room_speed*2
			intro_message = "Ready...";
		if intro_timer = 0
		{
			instance_create_depth(0,0,0, obj_speed_lines);
			intro_message = "Fight!";
			mode = Battle_Modes.fight;
		}
	break;
	
	case Battle_Modes.fight:
		timer -= 1;
		display_timer = floor(timer/room_speed);
	break;
}