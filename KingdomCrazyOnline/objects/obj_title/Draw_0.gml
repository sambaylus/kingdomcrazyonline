/// @description Insert description here
// You can write your code in this editor


draw_set_halign(fa_center);
draw_set_valign(fa_center);

if mode = 0
	draw_text_outline(room_width*.5, room_height*.5, label,c_white,c_black);
else
{
	if counter mod 5 == 0
		draw_text_outline(room_width*.5, room_height*.5, label);
}