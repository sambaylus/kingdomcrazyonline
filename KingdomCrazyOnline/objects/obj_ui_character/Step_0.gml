/// @description Insert description here
// You can write your code in this editor

switch (player_id)
{
	case 0:
	color = c_ocean;
	break;
	case 1:
		color = c_red;
	break;
	case 2:
		color = c_yellow;
	break;
	case 3:
		color = c_green;
	break;
}

image_blend = color;
name = "";

with obj_player
{
	if player_id = other.player_id
	{
		other.name = player_name;
		other.life = life;
	}
}