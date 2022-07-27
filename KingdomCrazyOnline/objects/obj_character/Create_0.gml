/// @description Insert description here
// You can write your code in this editor

event_inherited();

if sprite_index = -1
	sprite = new Sprite(spr_block);
else
	sprite = new Sprite(sprite_index);

// Variables
xspeed = 0;
xmove = 0;
xpush = 0;
xfriction = .1;

yspeed = 0;
yspeed_gravity = .25;

move_speed = .5;
move_speed_max = 3;

jump_speed = 5;

facing = 1;
grounded = false;

platform_target = noone;

#region FUNCTIONS 
can_jump = function(_jump_speed = jump_speed)
{
	if grounded
	and input_jump
	{
		effect_create(x, y, spr_effect_jump);
		jump(_jump_speed);	
	}
}

jump = function(_jump_speed = jump_speed)
{
	yspeed = -_jump_speed;	
}

can_move = function(_move_speed = move_speed)
{
	move((input_right - input_left)*_move_speed);	
}

move = function(_move_speed = move_speed)
{
	xmove += _move_speed;
	xmove = clamp(xmove, -move_speed_max, move_speed_max);
}
#endregion

#region PHYSICS
physics_update = function() {
	yspeed += yspeed_gravity;
	repeat(abs(yspeed))
	{
		if yspeed > 0
		{
			// Check for a headstomp
			with (obj_character)
			{
				if id = other.id
				or invulnerable > 0
					continue;
					
				if place_meeting(x, y - 1, other)
				and !place_meeting(x, y, other)
				{
					other.on_character_stomp(id);
					break;
				}
			}
		}
	
		if yspeed >= 0
		{
			with (obj_platform)
			{
				if place_meeting(x, y - 1, other)
				and !place_meeting(x, y, other)
				{
					other.platform_target = id;
				}
			}
		}
		else
		{
			platform_target = noone;	
		}
		
		if !place_meeting(x, y + sign(yspeed), obj_solid)
		and platform_target = noone
		{
			y += sign(yspeed);	
		}
		else
		{
			yspeed = 0;	
		}
	}
	
	if yspeed < 0
	or !place_meeting(x, y + 1, platform_target)
	{
		platform_target = noone;
	}
	
	if place_meeting(x, y + 1, obj_solid)
	or platform_target != noone
	{
		if grounded = false
		{
			effect_create(x, y, spr_effect_land);	
		}
		grounded = true;
	}
	else
		grounded = false;
	
	xspeed = xmove + xpush;
	
	if xmove < 0
		facing = -1;
	if xmove > 0
		facing = 1;
	
	xmove *= xfriction;
	if grounded
		xpush *= xfriction;
		
	// Does this go here?
	sprite.x_scale = facing;
	
	repeat(abs(xspeed))
	{
		if !place_meeting(x + sign(xspeed), y, obj_solid)
		{
			x += sign(xspeed);
		}
	}
	
	with (obj_character)
	{
		on_character_overlap(id);
	}
}

#endregion

on_character_overlap = function(_other) {
	
}

on_character_stomp = function(_other) {
	if _other.team_id != team_id
	and _other.invulnerable = false
	{
		yspeed = -2;
		_other.hurt();
	}
}

hurt = function() {
	state.change("hurt");
	yspeed = -2;
	xmove = 2;
}

// State Things
input_left = 0;
input_right = 0;
input_jump = 0;
input_pickup = 0;

state = new State_Controller(id);