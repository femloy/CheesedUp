init_collision();
movespeed = 0;
image_speed = 0.35;
countdownmax = 120;
countdown = countdownmax;
depth = -10;
kick = false;
drop = false;
mask_index = spr_player_mask;

var i = 0;
while (scr_solid(x, y))
{
	x += obj_noiseboss.image_xscale;
	i++;
	if (i > room_width)
		break;
}
