/// @description Insert description here
// You can write your code in this editor

draw_sprite_stretched_ext(sprite_index, 0, x, y + __hover*hover_offset, sprite_width, sprite_height, image_blend, 1);
draw_set_font(fnt_text);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_dark);
draw_text(x + sprite_width*.5, y + sprite_height*.5, label);