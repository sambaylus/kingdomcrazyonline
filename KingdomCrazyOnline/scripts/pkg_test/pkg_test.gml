/*
function _State(_name) constructor {
	name = _name;
	on_enter = function(){};
	on_leave = function(){};
	on_step = function(){};
	on_animation_end = function(){};
	counter = 0;
}

function State_Controller(_id) constructor {
	parent = _id;
	_states = array_create(0);
	state_counter = 0;
	
	step = function() {
		current_state.on_step();
		state_counter += 1;
	}

	animation_end = function() {
		current_state.on_animation_end();	
	}
	
	add_state = function(_name) {
		var _state = new _State(_name);
		_states[array_length(_states)] = _state;
		_state.parent = parent;
		return _state;
	}
	
	get_state = function(_name) {
		for (var i = 0; i < array_length(_states); i++)
		{
			_state = _states[i];
			if (_state.name = _name)
			{
				return _state;
			}
		}
		return -1;
	}
	
	change = function(_name) {
		var _state = get_state(_name);
		if (_state.name != current_state.name)
		{
			current_state.on_leave();
			current_state = _state;
			state_counter = 0;
			current_state.on_enter();
		}
		
		return current_state;
	}
	
	current_state = add_state("idle");
	phase = 0;
	
	return self;
}

function state_change(_name) {
	var _state = state.get_state(_name);
		
	if (_state.name != state.current_state.name)
	{
		var leave = state.current_state.on_leave;
		state.current_state = _state;
		state.state_counter = 0;
		var enter = state.current_state.on_enter;
		leave();
		enter();
	}

}

function state_step() {
	var _step = state.current_state.on_step;	
	_step();
}