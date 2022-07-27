
function Sprite(_sprite = -1) constructor {
	visible = true;
	x_offset = 0;
	x_offset_speed = 0;
	x_offset_bounce = 1;
	y_offset = 0;
	y_offset_speed = 0;
	y_offset_bounce = 1;
	
	x_effect_origin = 0.5;
	y_effect_origin = 1;
	
	index = _sprite;
	frame = 0;
	speed = 0;
	speed_default = .25;
	
	x_scale = 1;
	y_scale = 1;
	
	x_scale_effect = 1;
	x_scale_effect_speed = 0;
	x_scale_effect_bounce = .4;
	x_scale_effect_bounce_time = 10;
	
	y_scale_effect = 1;
	y_scale_effect_speed = 0;
	y_scale_effect_bounce = .4;
	y_scale_effect_bounce_time = 10;
	
	y_offset_effect = 0;
	x_offset_effect = 0;
	
	color_default = c_white;
	color = color_default;
	
	angle_default = 0;
	angle = 0;
	angle_target = 0;
	
	angle_effect = 0;
	angle_effect_speed = 0;
	angle_effect_bounce = 1;
	
	x_shift_effect = 0;
	x_shift_effect_speed = 0;
	x_shift_effect_bounce = 1;
	
	y_shift_effect = 0;
	y_shift_effect_speed = 0;
	y_shift_effect_bounce = 1;
	
	alpha = 1;
	group = "";
	looping = false;
	
	priority = 0;
	
	animation_bounce = 1;
	
	animation_ignore = false;
	x_shift = 0;
	y_shift = 0;
	shift_speed = 0;
	
	default_sprite = index;
	width = sprite_get_width(index);
	height = sprite_get_height(index);
	
	jiggle = function(_x = 1.1, _y = 0.9, _xbounce = .7, _ybounce = .7) {
		//set_effect_origin(0.5, 1.0);
		x_scale_effect = _x;
		y_scale_effect = _y;
		x_scale_effect_bounce = _xbounce;
		y_scale_effect_bounce = _ybounce;
	}
	
	shove = function(_x = 0, _y = 0, _bounce = .4) {
		x_shift_effect = _x;
		y_shift_effect = _y;
		x_shift_effect_bounce = _bounce;
		y_shift_effect_bounce = _bounce;
	}
	
	grow = function() {
		x_scale_effect = 0;
		y_scale_effect = 0;
	}
	
	squish = function(_xscale = 1, _yscale = 1, _xbounce = x_scale_effect_bounce, _ybounce = y_scale_effect_bounce, _xoscillations = x_scale_effect_bounce_time, _yoscillations = y_scale_effect_bounce_time) {
		x_scale_effect = _xscale;
		y_scale_effect = _yscale;
		x_scale_effect_bounce = _xbounce;
		y_scale_effect_bounce = _ybounce;
		x_scale_effect_bounce_time = _xoscillations;
		y_scale_effect_bounce_time = _yoscillations
	}
	
	sprite_end = function() {
	}
	
	play = function(_sprite = -1, _speed = speed_default, _looping = true, _priority = 0) {
		if priority > _priority
			return;
		
		if index = _sprite
		and speed = _speed
		and looping = _looping
			return;
		
		index = _sprite;
		if index != _sprite
			frame = 0;
		speed = _speed;
		looping = _looping;
		priority = _priority;
		sprite_end = function(){};
	}
	
	freeze_frame = function(_sprite = -1, _frame = 0) 
	{
		if priority > 0
			return;
			
		index = _sprite;
		speed = 0;
		frame = _frame;
	}
	
	enter_frame = function(_frame) {
		if floor(frame) = _frame
		and floor(frame) > floor(frame - speed)
			return true;
		return false;
	}
	
	set_effect_origin = function(_x, _y) 
	{
		x_effect_origin = _x;
		y_effect_origin = _y;
		return self;
	}
	
	draw = function(_x = x, _y = y, _centered = false) 
	{
		if index != -1
		{			
			draw_sprite_ext(index, frame, _x + x_offset_effect + x_shift_effect, _y + y_offset_effect + y_shift_effect, x_scale * x_scale_effect, y_scale * y_scale_effect, angle + angle_effect, color, alpha);
		}
	}
	
	update = function() {
		if index = -1
			return;
			
		frame += speed;
		
		var _frames = sprite_get_number(index);
		if frame >= _frames
		{
			if looping
				frame -= _frames;
			else
			{
				speed = 0;
				frame = _frames-1;
				sprite_end();
			}
		}
		
		update_effects();
		
		var _height = sprite_get_height(index);
		var _yorigin = sprite_get_yoffset(index);
		var _yoffset = _yorigin/_height;
		y_offset_effect = _height*(y_effect_origin - _yoffset)*(1-(y_scale * y_scale_effect));
		
		var _width = sprite_get_width(index);
		var _xorigin = sprite_get_xoffset(index);
		var _xoffset = _xorigin/_width;

		x_offset_effect = _width*(x_effect_origin - _xoffset)*(1-(x_scale * x_scale_effect));
	}
	
	update_effects = function() 
	{
		var _numeric_array;
		_numeric_array = numeric_springing(x_scale_effect, x_scale_effect_speed, 1, 1 * x_scale_effect_bounce, x_scale_effect_bounce_time, 1);
		x_scale_effect = _numeric_array[0];
		x_scale_effect_speed = _numeric_array[1];
		
		_numeric_array = numeric_springing(y_scale_effect, y_scale_effect_speed, 1, 1 * y_scale_effect_bounce, y_scale_effect_bounce_time, 1);
		y_scale_effect = _numeric_array[0];
		y_scale_effect_speed = _numeric_array[1];
		
		_numeric_array = numeric_springing(angle_effect, angle_effect_speed, 0, 1 * angle_effect_bounce, .4, 10);
		angle_effect = _numeric_array[0];
		angle_effect_speed = _numeric_array[1];

		_numeric_array = numeric_springing(x_shift_effect, x_shift_effect_speed, 0, 1 * x_shift_effect_bounce, .4, 10);
		x_shift_effect = _numeric_array[0];
		x_shift_effect_speed = _numeric_array[1];

		_numeric_array = numeric_springing(y_shift_effect, y_shift_effect_speed, 0, 1 * y_shift_effect_bounce, .4, 10);
		y_shift_effect = _numeric_array[0];
		y_shift_effect_speed = _numeric_array[1];
	}
}

function numeric_springing(argument0, argument1, argument2, argument3, argument4, argument5) {

	var _ret,                   //Array containing output value and velocity
	_x = argument0,             //Input value
	_v = argument1,             //Input velocity
	_x_t = argument2,           //Target value
	_damping = argument3,       //Damping of the oscillation (0 = no damping, 1 = critically damped)
	_ang_freq = 2*pi*argument4, //Oscillations per second
	_t = argument5/room_speed,  //How much of a second each step/use of the script takes (1 = normal time, 2 = twice as fast,..)
	_delta_v, _delta_x, _delta;

	_delta = (1+2*_t*_damping*_ang_freq)+power(_t,2)*power(_ang_freq,2);
	_delta_x = (1+2*_t*_damping*_ang_freq)*_x+_t*_v+power(_t,2)*power(_ang_freq,2)*_x_t;
	_delta_v = _v+_t*power(_ang_freq,2)*(_x_t-_x);

	_ret[1] = _delta_v/_delta; //Output velocity
	_ret[0] = _delta_x/_delta; //Output value

	return _ret;
}


