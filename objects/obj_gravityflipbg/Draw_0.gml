switch state
{
	case 0:
		y = -600 * side;
		vspeed = 20 * side;
		friction = 1;
		state = 1;
		image_alpha = 0;
		break;
	case 1:
		if abs(vspeed) < 10
		{
			state = 2;
			friction = 0;
			if side == -1
				gravity_direction = 90;
			else
				gravity_direction = 270;
			gravity = 1;
		}
		break;
	case 2:
		if y < -540 / 0.5 or y > 540 / 0.5
			instance_destroy();
		break;
}
image_alpha = Approach(image_alpha, 0.25, 0.05);

draw_set_colour(side == -1 ? c_fuchsia : c_aqua);
var start = CAMX * 0.35, nd = CAMX + CAMW;

var iter = 20;
var f = start / iter;

for(var i = start; i < nd + iter; i += iter)
{
	random_set_seed(++f);
	
	var size = random_range(0.5, 1);
	var xx = i - (i % iter) + CAMX * lerp(0.5, 0.35, size);
	
	var yy = CAMY + CAMH / 2;
	yy += y * lerp(-.5, 1, size);
	
	draw_set_alpha(size * image_alpha);
	xx += random_range(-iter, iter);
	var wd = 8 * size;
	var ht = 500 * lerp(-.5, 1, size);
	
	draw_roundrect(xx - wd / 2, yy - ht / 2, xx + wd / 2, yy + ht / 2, false);
}
draw_set_alpha(1);
randomize();
draw_set_colour(c_white);
