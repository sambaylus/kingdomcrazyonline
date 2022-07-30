/// @description Insert description here
// You can write your code in this editor

event_inherited();
if invulnerable > 0
	invulnerable -= 1;
	
var input = rollback_get_input(player_id);

input_left = input.left;
input_right = input.right;
input_jump = input.jump_pressed;
input_pickup = input.pickup_pressed;
input_emote1 = input.emote1_pressed;
input_emote2 = input.emote2_pressed;
input_emote3 = input.emote3_pressed;

sprite.update();
sprite.update_effects();
state.step();