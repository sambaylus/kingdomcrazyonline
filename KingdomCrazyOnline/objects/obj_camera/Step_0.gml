/// @description
/// @description
var _border = width*.5 - 16;

//if instance_exists(obj_player)
//	follow_target = obj_player;
//
// DEBUG THINGS
//
// 
//if keyboard_check(ord("D"))
//{
//	set_pos(CAMERA.x + 10);	
//}
//if keyboard_check(ord("A"))
//{
//	set_pos(CAMERA.x - 10);	
//}
//
if follow_target != noone
{
	if follow_target.x - _border < x
		x_target = follow_target.x - _border;
	if follow_target.x + _border > right
		x_target = follow_target.x + _border - width;
	
	if follow_target.y - _border < y
		y_target = follow_target.y - _border;
	if follow_target.y + _border > bottom
		y_target = follow_target.y + _border - height;
		
	x_target = clamp(x_target, 0, room_width - width);
	y_target = clamp(y_target, 0, room_height - height);
}

x = lerp(x, x_target, pan_speed);
y = lerp(y, y_target, pan_speed);
x = clamp(x, 0, room_width - width);
y = clamp(y, 0, room_height - height + 32);
				
camera_set_view_pos(view_camera[0], x, y);
		
left = x;
top = y;
right = x + width;
bottom = y + height;

xcenter = (x + RESOLUTION_WIDTH)*.5;
ycenter = (y + RESOLUTION_HEIGHT)*.5;