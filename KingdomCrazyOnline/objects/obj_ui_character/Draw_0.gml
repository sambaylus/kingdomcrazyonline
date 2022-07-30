/// @description Insert description here
// You can write your code in this editor

var _xcenter = x + sprite_width*.5;
var _ycenter = y + sprite_height*.6;

draw_self();
draw_set_font(fnt_text);
draw_text_outline(_xcenter, _ycenter - 8, name, c_white, color);

draw_sprite(spr_ui_hearts, life, _xcenter, _ycenter + 3);	