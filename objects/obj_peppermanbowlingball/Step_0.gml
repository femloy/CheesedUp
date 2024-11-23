if (fallbuffer > 0)
	fallbuffer--;
else
	fall = true;
if (fall == 0)
	y = Approach(y, 32, 2);
if (fall == 1)
	y += 9;
if (check_solid(x, y + 1) && fall == 1)
{
	sound_play_3d("event:/sfx/pepperman/statuedestroy", x, y);
	destroy = true;
	instance_destroy();
}
