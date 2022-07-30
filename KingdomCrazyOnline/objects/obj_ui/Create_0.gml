/// @description Insert description here
// You can write your code in this editor

__hover = false;
hover_offset = 1;
click_offset = 3;

label = "";

width = sprite_width;
height = sprite_height;

on_click = function() {
	action();
	SOUND.play(snd_confirm);
}

action = function(){};
on_hover_enter = function(){
SOUND.play(snd_cursor, 1.2);
};
on_hover_exit = function(){
SOUND.play(snd_cursor, .8)

};

active = true;