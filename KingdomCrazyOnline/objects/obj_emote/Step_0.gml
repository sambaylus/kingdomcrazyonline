/// @description Insert description here
// You can write your code in this editor

sprite.update();
sprite.update_effects();

if parent
{
	x = parent.x;
	y = parent.y - 21;
}

counter += 1;
if counter > room_speed *.75
	instance_destroy();