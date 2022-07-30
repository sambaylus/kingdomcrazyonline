/// @description Insert description here
// You can write your code in this editor


timer -= 1;

if timer = 0
	instance_destroy();

if timer mod 3 == 0
{
	//choose(0,1);
	var _switch = (rollback_current_frame mod 2 == 0);
	if _switch
		image_xscale = 1;
	else
		image_xscale = -1;
	_switch = (rollback_current_frame mod 3 == 0);
	if _switch
		image_yscale = 1;
	else
		image_yscale = -1;
}