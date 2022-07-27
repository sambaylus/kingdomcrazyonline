/// @description
/// @description
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

if instance_number(obj_camera) > 1
	instance_destroy();
	
#macro CAMERA obj_camera

#macro ROOM_CENTER room_width*.5
#macro ROOM_MIDDLE room_height*.5

#macro RESOLUTION_WIDTH 320
#macro RESOLUTION_HEIGHT 180
#macro WINDOW_SCALE 2

#macro SCREEN_WIDTH RESOLUTION_WIDTH
#macro SCREEN_HEIGHT RESOLUTION_HEIGHT

x = 0;
y = 0;
x_target = x;
y_target = y;
	
width = RESOLUTION_WIDTH;
height = RESOLUTION_HEIGHT;

left = x;
top = y;
right = x + width;
bottom = y + height;

zoom = 1;

cutscene = false;

headdir = 1;

scroll_padding = 128;
pan_speed = .25;

camera = camera_create_view(0, 0, RESOLUTION_WIDTH, RESOLUTION_HEIGHT, 0, -1, -1, -1, 0, 0);

follow_target = noone;

cutscene = false;

set_pos = function(_x = x, _y = y) {
	x = _x;
	x_target = x;
	y = _y;
	y_target = y;
}
	
pan = function(_x = x_target, _y = y_target, _speed = .25) {
		x_target = _x;
		y_target = _y;
		pan_speed = _speed;
		
		x_target = clamp(x_target, 0, room_width - width);
		y_target = clamp(y_target, 0, room_height - height + 32);
}

follow = function(_instance)
{
	follow_target = _instance;	
}

display_set_gui_size(RESOLUTION_WIDTH, RESOLUTION_HEIGHT);
surface_resize(application_surface, RESOLUTION_WIDTH, RESOLUTION_HEIGHT);