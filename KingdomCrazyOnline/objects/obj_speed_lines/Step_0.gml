/// @description Insert description here
// You can write your code in this editor


timer -= 1;

if timer = 0
	instance_destroy();

if timer mod 3 == 0
{
	choose(0,1);
	//image_xscale = choose(1, -1);
	//image_yscale = choose(1, -1);
}