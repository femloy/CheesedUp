switch (state)
{
	case states.normal:
		sprite_index = spr_stupidratprop1;
		hsp = image_xscale * 3;
		if (check_solid(x + sign(hsp), y))
			image_xscale *= -1;
		break;
	case states.idle:
		sprite_index = spr_stupidratprop2;
		hsp = 0;
		break;
}
scr_collide();
