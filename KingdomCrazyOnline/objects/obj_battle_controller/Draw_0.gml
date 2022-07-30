/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_font);

switch (mode)
{
	case Battle_Modes.intro:
		if intro_message != ""
			draw_sprite(spr_ui_ready, 0, obj_camera.x + obj_camera.width*.5, obj_camera.y + obj_camera.height*.5);
		//draw_text_outline(room_width*.5, room_height*.5, intro_message, c_white, c_black);
	break;
	
	case Battle_Modes.fight:
		if timer > room_speed * 60
			draw_sprite(spr_ui_fight, 0, obj_camera.x + obj_camera.width*.5, obj_camera.y + obj_camera.height*.5);
			//draw_text_outline(room_width*.5, room_height*.5, intro_message, c_white, c_black);
		draw_text_outline(room_width*.5, room_height*.15, display_timer);
	break;
	
	case Battle_Modes.victory:
		if mode_counter > 30
		{
			draw_text_outline(room_width*.5, room_height*.5, string(winner) + " WINS!", winner_color, c_white);	
		}
	break;
}