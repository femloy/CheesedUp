live_auto_call;

// get input
if anim_con == 0
	scr_menu_getinput();

// controls
move_hor = key_left2 + key_right2;
if arrowbufferH == 0
	move_hor = key_left + key_right;

move_ver = key_down2 - key_up2;
if arrowbufferV == 0
	move_ver = key_down - key_up;

if key_left != 0 or key_right != 0
{
	if arrowbufferH == -1
		arrowbufferH = 20;
	else if arrowbufferH == 0
		arrowbufferH = 4;
}
else
	arrowbufferH = -1;

if key_up != 0 or key_down != 0
{
	if arrowbufferV == -1
		arrowbufferV = 20;
	else if arrowbufferV == 0
		arrowbufferV = 4;
}
else
	arrowbufferV = -1;

if arrowbufferH > 0
	arrowbufferH--;
if arrowbufferV > 0
	arrowbufferV--;

if submenu == 0
{
	// cancel
	if key_back && anim_con == 0
	{
		close_menu();
		sound_play(sfx_back);
		anim_con = 1;
	}

	// select
	if key_jump && is_method(select) && anim_t >= 1
		select();
}

if anim_con != 0 && anim_t <= 0
	instance_destroy();
