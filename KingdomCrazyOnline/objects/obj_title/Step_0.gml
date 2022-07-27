/// @description Insert description here
// You can write your code in this editor

if mode = 0
{
	counter += 1;
	if counter = room_speed * .75
	{
		SOUND.play(snd_kingdom_crazy);
	}	
	
	if keyboard_check_pressed(vk_anykey)
	or mouse_check_button_pressed(mb_any)
	{
		instance_create_depth(x, y, depth -10, obj_flash);
		SOUND.stop_all();
		SOUND.play(snd_start);
		
		if sequence != -1
		{
			var _frames = layer_sequence_get_length(sequence)*.5;
		}
		
		mode = 1;
		counter = 0;
	}
}

if mode = 1
{
	layer_sequence_headpos(sequence, 290);

	counter += 1;
	if counter > room_speed * 2
	{
		room_goto(rm_setup_1);	
	}
}