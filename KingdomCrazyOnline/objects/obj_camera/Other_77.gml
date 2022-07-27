/// @description Insert description here
// You can write your code in this editor

with obj_player
{
	if player_id = obj_rollback_settings.player_local
		other.follow_target = id;
}

show_debug_message(follow_target);