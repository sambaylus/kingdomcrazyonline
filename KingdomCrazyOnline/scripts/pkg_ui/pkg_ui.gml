// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_text_outline(_x, _y, _text, _text_color = c_white, _text_outline_color = c_black){
	draw_set_color(_text_outline_color);
	draw_text(_x-1, _y, _text);
	draw_text(_x+1, _y, _text);
	draw_text(_x, _y-1, _text);
	draw_text(_x, _y+1, _text);
	draw_set_color(_text_color);
	draw_text(_x,_y, _text);
}