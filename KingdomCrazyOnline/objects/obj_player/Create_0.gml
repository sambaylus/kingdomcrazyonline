/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

idle_sprite = spr_cloak_idle_blue;
hurt_sprite = spr_cloak_hurt_blue;

move_speed = 1;
move_speed_max = 1;
xfriction = .8;

x = irandom(room_width);
//y = irandom(room_height);

hurt = function(_id) {
	yspeed = -2;
	xpush = facing * -2;
	state.change("hurt");
}

on_character_stomp = function(_id) {
	//state.change("hurt");
	_id.hurt();
	jump();
}

#region Idle State
state.add_state("idle",
	// Enter
	,
	function(){
		can_jump();
		can_move();
		physics_update();
	},
	// Exit
	,
	// End Step
	function(){
		if grounded
		{
			if xmove >= 1 or
			xmove <= -1
				sprite.play(idle_sprite, .3);
			else
				sprite.freeze_frame(idle_sprite, 0);
		}
		else
		{
			sprite.speed = 0;
			
			if yspeed < 0
				sprite.frame = 1;
			else
				sprite.frame = 2;
		}
	}
);
#endregion
state.change("idle");

#region Hurt State
state.add_state("hurt",
	// Enter
	function(){
		invulnerable = room_speed*2;	
	},
	function(){
		physics_update();
		if grounded
			state.change("lay");
	},
	// Exit
	function(){
		//invulnerable = false;
	},
	// End Step
	function(){
		sprite.freeze_frame(hurt_sprite, 0);
	}
);
#endregion

#region Lay State
state.add_state("lay",
	// Enter
	function(){
	},
	// Step
	function(){
		physics_update();
		if state.counter > room_speed
		{
			yspeed = -3;
			state.change("idle");
		}
	},
	// Exit
	function(){
		
	},
	// End Step
	function(){
		sprite.freeze_frame(hurt_sprite, 1);
	}
);
#endregion