if instance_exists(obj_vigilanteboss) && obj_vigilanteboss.snotty
{
	pal_swap_set(spr_vigipalette, SKIN_SNOTTY, false);
	draw_self();
	pal_swap_reset();
}
else
	draw_self();
