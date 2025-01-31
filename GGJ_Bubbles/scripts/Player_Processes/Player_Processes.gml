function reset_variables()
{
	left = 0;
	right = 0;
	up = 0;
	down = 0;
}

function get_imput()
{
	if keyboard_check(ord("A")) or keyboard_check(vk_left) or gamepad_button_check(0, gp_padl)		left	= 1;
	if keyboard_check(ord("D")) or keyboard_check(vk_right) or gamepad_button_check(0, gp_padr)		right	= 1;
	if keyboard_check(ord("W")) or keyboard_check(vk_up) or gamepad_button_check(0, gp_padu)		up		= 1;
	if keyboard_check(ord("S")) or keyboard_check(vk_down) or gamepad_button_check(0, gp_padd)		down	= 1;
}

function calc_movement()
{
	var _hmove = right - left;
	var _vmove = down - up;
	
	if _hmove != 0 or _vmove != 0 {
		
		var _dir = point_direction(0, 0, _hmove, _vmove);
		
		_hmove = lengthdir_x(walk_spd, _dir);
		_vmove = lengthdir_y(walk_spd, _dir);
		
		x += _hmove;
		y += _vmove;
	} 
}

function player_collision_wall()
{
	var _tx = x;
	var _ty = y;
	
	//move to previous step out of the collision
	
	x = xprevious;
	y = yprevious;
	
	var _distx = abs(_tx - x);
	var _disty = abs(_ty - y);
	
	repeat(_distx)
	{
		if !place_meeting(x + sign(_tx - x), y, oWall) x += sign(_tx - x);
	}
	
	repeat(_disty)
	{
		if !place_meeting(x, y + sign(_ty - y), oWall) y += sign(_ty - y);
	}
	
}