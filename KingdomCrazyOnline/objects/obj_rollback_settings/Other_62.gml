/// @description Insert description here
// You can write your code in this editor

if ds_map_find_value(async_load, "id") == request_regions
{
	
	if (async_load[? "http_status"] == 200)
	{
	    var _struct = json_parse(async_load[? "result"]);
	    var _data = _struct.data;
	    var _num_regions = array_length(_data);
    
	    for (var i = 0; i < _num_regions; i++)
	    {
	        region_list[i] = _data[i];
			show_debug_message(region_list[i]);
	    }
	
		on_regions_receive();
	}
}