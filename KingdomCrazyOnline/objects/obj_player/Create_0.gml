/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

carry = false;

dash_sprite = spr_cloak_dash_blue;

color = c_ocean;

switch(player_id)
{
	case 1:
		idle_sprite = spr_cloak_idle_red;
		hurt_sprite = spr_cloak_hurt_red;
		color = c_red;
	break;
	
	case 2:
		idle_sprite = spr_cloak_idle_yellow;
		hurt_sprite = spr_cloak_hurt_yellow;
		color = c_yellow;
	break;
	
	case 3:
		idle_sprite = spr_cloak_idle_green;
		hurt_sprite = spr_cloak_hurt_green;
		color = c_green;
	break;
	
	default:
		idle_sprite = spr_cloak_idle_blue;
		hurt_sprite = spr_cloak_hurt_blue;
		color = c_ocean;
	break;
}

sprite_index = idle_sprite;

life = 3;

move_speed = 1;
move_speed_max = 1;
xfriction = .8;

with obj_player_spawn
{
	if player_id = other.player_id
	{
		if x >= room_width *.5
			other.facing = -1;
		other.x = x;
		other.y = y;
	}
}

hurt = function(_hit_speed = 1) {
	yspeed = -2;
	xpush = facing * -2 * -_hit_speed;
	state.change("hurt");
	life -= 1;
}

on_character_stomp = function(_id) {
	//state.change("hurt");
	_id.hurt();
	jump();
}

emote = function(_index) {
	with (obj_emote)
	{
		if parent = other.id
			instance_destroy();
	}
			
	sprite.squish();
	_emote = instance_create_depth(x, y - 24, depth - 1, obj_emote);
	_emote.parent = id;	
	_emote.sprite.frame = _index;
}

#region Idle State
state.add_state("idle",
	// Enter
	,
	function(){
		if obj_battle_controller.mode != Battle_Modes.fight
		{
			physics_update();
			return;
		}
		
		can_jump();
		can_move();
		
		if input_emote1 {emote(1);}
		if input_emote1 {emote(2);}
		if input_emote1 {emote(3);}

		
		if input_pickup
		{
			if carry
			{
				var _instance = instance_create_depth(x, y - 16, depth - 1, obj_crate);
				_instance.xpush = facing*3;
				_instance.yspeed = -2;
				_instance.player_id = player_id;
				carry = false;
			}
			else
			{
				if instance_exists(platform_target)
				{
					if object_is_ancestor(platform_target.object_index, obj_pickup)
					{
						state.change("pickup");
						instance_destroy(platform_target);
						platform_target = noone;
					}
				}
			}
		}
		
		physics_update();
	},
	// Exit
	,
	// End Step
	function(){
		if grounded
		{
			if abs(xmove) >= .5
				sprite.play(idle_sprite, .2);
			else
				sprite.freeze_frame(idle_sprite, 0);
		}
		else
		{
			sprite.freeze_frame(idle_sprite, 0);
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

#region Dash State
state.add_state("dash",
// Enter
function(){
},
// Step
function(){	

},
//Exit
function(){
},
//End Step
function(){
	sprite.play(dash_sprite, .2);
}
);
#endregion

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

#region Pickup
state.add_state("pickup",
	// Enter
	function(){
		carry = true;
	},
	// Step
	function(){
		if state.counter > 5
		{
			state.change("idle");	
		}
	},
	// Exit
	function(){},
	// End Step
	function(){}
)

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
			if life > 0
			{
				xpush = 0;
				yspeed = -3;
				state.change("idle");
			}
			else
			{
				state.change("death");	
			}
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

#region Lay State
state.add_state("death",
	// Enter
	function(){
		invulnerable = room_speed*.5;	
},
	// Step
	function(){
		physics_update();
		//if state.counter > room_speed *.5
		{
			effect_create(x, y - 8, spr_effect_poof, .25);
			instance_destroy();
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