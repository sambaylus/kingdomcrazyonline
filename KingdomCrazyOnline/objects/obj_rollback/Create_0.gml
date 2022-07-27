/// @description Insert description here
// You can write your code in this editor

show_debug_message("ROLLBACK OBJECT CREATED!");

input         = 
{
	"left"    : [vk_left],
	"right"   : [vk_right],
	"pickup"  : [ord("X")],
	"jump"    : [ord("Z")]
}

rollback_define_input(input);
rollback_use_random_input(false)

rollback_define_player(obj_player);
	
/*
// Configuration
//<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>

player_object = -1;
players_max   = 4;
game_room     = rm_battle1;

region        = "North America";
region_list   = [];


rollback_define_input(input);
rollback_use_random_input(false)
//<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>
*/

#macro ROLLBACK obj_rollback

join_game = function() 
{
	rollback_join_game();
};

start_game = function(_players = obj_rollback_settings.players_max, _sync = obj_rollback_settings.sync_test, _region = obj_rollback_settings.region)
{
	rollback_create_game(_players, _sync, _region);
}

counter = 0;