// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function effect_create(_x, _y, _sprite, _speed = .2) {
	var _effect = instance_create_depth(_x, _y, 0, obj_effect);
	_effect.sprite_index = _sprite;
	_effect.image_speed = _speed;
	return _effect;
}