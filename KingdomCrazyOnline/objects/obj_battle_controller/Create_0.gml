/// @description Insert description here
// You can write your code in this editor
timer = 61*room_speed;
display_timer = floor(timer/room_speed);

intro_timer = 4*room_speed;
intro_message = "";

enum Battle_Modes
{
	intro,
	ready,
	fight,
	victory,
	time,
	ko,
	length
}

mode = Battle_Modes.intro;
winner = "";
winner_color = "";

mode_counter = 0;