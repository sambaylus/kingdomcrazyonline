/// @description Insert description here
// You can write your code in this editor

if room = rm_lobby
{
	if obj_rollback_settings.host
	{
		obj_rollback.start_game();	
	}
	else
		obj_rollback.join_game();
}