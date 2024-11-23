if pet == PET.noiserat
{
	pal_swap_set(spr_noisepalette, 1);
	event_inherited();
	pal_swap_reset();
}
else
	event_inherited();
