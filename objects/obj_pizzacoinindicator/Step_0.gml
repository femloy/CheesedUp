if !show
{
	if REMIX && image_alpha > 0
		image_alpha -= 0.1;
	else
		visible = false;
}

if instance_exists(obj_weaponmachine)
    show = 1;
if show > 0
{
    show -= 1;
	image_alpha = 1;
    visible = true;
}

if REMIX
{
	image_speed = Approach(image_speed, 0.35, 0.02);
	if global.pizzacoinOLD != coin_prev
	{
		if global.pizzacoinOLD > coin_prev
		{
			yo = 0;
			vsp = -4;
		}
		image_speed = 1;
		coin_prev = global.pizzacoinOLD;
	}
	if yo < 0 or vsp < 0
	{
		yo += vsp;
		vsp += 1;
	}
	else
	{
		yo = 0;
		vsp = 0;
	}
}
else
{
	image_speed = 0.35;
	yo = 0;
}
