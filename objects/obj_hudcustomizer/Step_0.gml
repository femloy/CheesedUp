live_auto_call;

// get input
if buffer-- > 0
{
	buffer--;
	exit;
}
scr_menu_getinput();

// trust me I know this is cancer but trust me Please
var move_hor = key_left2 + key_right2;
var moveh_hor = key_left + key_right;
var move_ver = key_down2 - key_up2;

if sel != -1
{
	var sel_prev = sel;
	var opts = menus[menu_sel].options;
	
	for(var i = 0; i < array_length(opts); i++)
	{
		if opts[i].type == 0 && is_callable(opts[i].func)
			opts[i].func(0);
	}
	
	if opts[sel].type == 1 && (moveh_hor != 0 or move_hor != 0)
	{
		with opts[sel]
		{
			value = Approach(value, moveh_hor == 1 ? 1 : 0, other.key_attack ? 0.01 : 0.03);
			set_func(value);
		}
	}
	else if move_hor == 1
		sel = find_nearest_button(opts, sel, "right");
	else if move_hor == -1
		sel = find_nearest_button(opts, sel, "left");
	else if move_ver == 1
		sel = find_nearest_button(opts, sel, "down");
	else if move_ver == -1
		sel = find_nearest_button(opts, sel, "up");
	
	if sel != sel_prev
	{
		sound_play(sfx_step);
		array_copy(old_cursor, 0, current_cursor, 0, 4);
		cursor_time = 0;
	}
	
	if key_back
	{
		sound_play(sfx_back);
		sel = -1;
		
		array_copy(old_cursor, 0, current_cursor, 0, 4);
		cursor_time = 0;
	}
	else if key_jump
	{
		if opts[sel].type == 0 && is_callable(opts[sel].func)
		{
			sound_play(sfx_select);
			opts[sel].func(1);
		}
	}
}
else
{
	var sel_prev = menu_sel;
	menu_sel = clamp(menu_sel + move_hor, 0, array_length(menus) - 1);
	
	if menu_sel != sel_prev
	{
		sound_play(sfx_step);
		array_copy(old_cursor, 0, current_cursor, 0, 4);
		cursor_time = 0;
	}
	
	if key_back
	{
		sound_play(sfx_back);
		with obj_modconfig
			visible = true;
		instance_destroy();
	}
	
	if key_jump
	{
		sound_play(sfx_select);
		sel = 0;
		
		array_copy(old_cursor, 0, current_cursor, 0, 4);
		cursor_time = 0;
	}
}
