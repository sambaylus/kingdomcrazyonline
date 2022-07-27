/// @description Insert description here
// You can write your code in this editor

sequence = -1;

SOUND.play_music(msc_theme);

var a = layer_get_all_elements("Sequence");
for (var i = 0; i < array_length(a); i++;)
{
	if layer_get_element_type(a[i]) == layerelementtype_sequence
	{
		sequence = a[i];
		break;
	}
}