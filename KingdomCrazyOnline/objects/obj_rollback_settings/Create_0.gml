/// @description Insert description here
// You can write your code in this editor

// Configuration
//<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>

host = false;

player_object = obj_player;
players_max   = 4;
game_room     = rm_battle1;

sync_test     = true;
region        = "North America";
region_list   = [];

request_regions = -1;

get_regions = function() {
	request_regions = http_get(rollback_api_server + "/gg/regions");	
}

get_regions();

on_regions_receive = function()
{
	//rollback_start();
}

rollback_display_events(false);

//<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>

player_local = 0;