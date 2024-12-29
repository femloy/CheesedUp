live_auto_call;

if buffer > 0
{
	buffer--;
	exit;
}

scr_menu_getinput();

var move = key_down2 - key_up2;
if move != 0
{
	sound_play(sfx_step);
	sel = wrap(sel + move, -1, array_length(mods) - 1);
}

if key_back or (key_jump && sel == -1)
{
	sound_play(sfx_back);
	with obj_option
	{
		optionselected = 0;
		backbuffer = 2;
	}
	instance_destroy();
}
else if key_jump
{
	if is_callable(mods[sel].select_func)
		mods[sel].select_func();
}

var move = key_left2 + key_right2;
if sel >= 0 && move != 0
{
	var m = mods[sel];
	if m.enabled != 2 && is_instanceof(m.mod_struct, Mod)
	{
		sound_play(sfx_select);
		
		m.enabled = !m.enabled;
		if m.enabled
			m.mod_struct.init();
		else
			m.mod_struct.cleanup();
	}
}
