/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

player_id = -1;

// Variables
xspeed = 0;
xmove = 0;
xpush = 0;
xfriction = .8;

yspeed = 0;
yspeed_gravity = .2;

move_speed = .35;
move_speed_default = 1;
move_speed_max = move_speed_default;

jump_speed = 5;

facing = 1;
grounded = false;

platform_target = noone;

on_character_stomp = function(_other) {
	if _other.invulnerable = false
	{
		yspeed = -2;
		_other.hurt();
	}
}

on_character_hit = function(_other) {
	if _other.invulnerable = false
	and _other.player_id != player_id
	{
		xpush*= -.25;
		_other.hurt(sign(xspeed));
	}
}

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
				if invulnerable > 0
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
	
	var _xmove = xmove;
	
	xspeed = _xmove + xpush;
	
	if xmove < 0
		facing = -1;
	if xmove > 0
		facing = 1;
	
	xmove *= xfriction;
	if grounded
		xpush *= xfriction;
	
	repeat(abs(xspeed))
	{
		with obj_character
		{
			if invulnerable > 0
				continue;
					
			if place_meeting(x - sign(other.xspeed), y, other)
			{
				
				other.on_character_hit(id);
				break;
			}
		}
		
		if !place_meeting(x + sign(xspeed), y, obj_solid)
		{
			x += sign(xspeed);
		}
		else
		{
			xpush *= .5;	
		}
	}
	
}

#endregion