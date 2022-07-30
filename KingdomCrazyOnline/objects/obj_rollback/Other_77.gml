/// @description Insert description here
// You can write your code in this editor

if rollback_event_param.first_start == true
{
	obj_rollback_settings.player_local = rollback_event_param.player_id;	
	room_goto(rm_battle);
}