/// @description Insert description here
// You can write your code in this editor

#macro global obj_global

#macro GRID_SIZE 16

fnt_display = font_add_sprite(spr_fnt_display, ord("0"), true, 1);

function platforms_create() {
	// This creates a jump-through platform on every asset on the "Platforms" layer in the room editor.
	var _layer = layer_get_id("Platforms");
	if _layer != -1
	{
		var a = layer_get_all_elements(_layer);

		//for (var i = 0; i < array_length(a); i++)
		for (var i = array_length(a)-1; i >=0; i--)
		{
			var _element = a[i];
			var _index = layer_sprite_get_sprite(_element);

			var _x = layer_sprite_get_x(_element);
			var _y = layer_sprite_get_y(_element);
			var _xscale = layer_sprite_get_xscale(_element);
			var _yscale = layer_sprite_get_yscale(_element);
			
			var _platform = instance_create_depth(_x, _y, 400, obj_platform);
			_platform.image_xscale = ((_xscale*sprite_get_width(_index))/GRID_SIZE);
			_platform.image_yscale = (((_yscale)*sprite_get_height(_index))/GRID_SIZE);
			_platform.width = _platform.image_xscale;
			_platform.height = _platform.image_yscale;
		}
	}
	else
	{
		show_debug_message("Without a layer named 'Platforms', no platforms were created.");	
	}

	// This creates a solid object on every asset on the "Solids" layer in the room editor.
	var _layer = layer_get_id("Solids");
	if _layer != -1
	{
		var a = layer_get_all_elements(_layer);

		//for (var i = 0; i < array_length(a); i++)
		for (var i = array_length(a)-1; i >=0; i--)
		{
			var _element = a[i];
			var _index = layer_sprite_get_sprite(_element);

			var _x = layer_sprite_get_x(_element);
			var _y = layer_sprite_get_y(_element);
			var _xscale = layer_sprite_get_xscale(_element);
			var _yscale = layer_sprite_get_yscale(_element);
			
			var _platform = instance_create_depth(_x, _y, 400, obj_solid);
			_platform.image_xscale = ((_xscale*sprite_get_width(_index))/GRID_SIZE);
			_platform.image_yscale = (((_yscale)*sprite_get_height(_index))/GRID_SIZE)-1;
			_platform.width = _platform.image_xscale;
			_platform.height = _platform.image_yscale;
		}
	}
	else
	{
		show_debug_message("Without a layer named 'Solids', no solids were created.");	
	}
}