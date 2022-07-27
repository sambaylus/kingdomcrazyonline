/// @description Insert description here
// You can write your code in this editor

event_inherited();
if invulnerable > 0
	invulnerable -= 1;
	
var input = rollback_get_input(player_id);

input_left = input.left;
input_right = input.right;
input_jump = input.jump_pressed;

sprite.update();
state.step();