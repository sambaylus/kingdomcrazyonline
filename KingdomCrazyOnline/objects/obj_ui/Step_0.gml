/// @description Insert description here
// You can write your code in this editor

if position_meeting(mouse_x, mouse_y, id)
and active
{
	if __hover = false
	{
		on_hover_enter();	
	}
	
	__hover = true;
	
	if mouse_check_button_pressed(mb_left)
	{
		on_click();
	}

}
else
{
	if __hover = true
	{
		on_hover_exit();		
	}
	__hover = false;	
}