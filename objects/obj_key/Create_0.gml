if room == rm_editor
	exit;

/*
if global.key_inv == 1
{
	vsp = -15;
	hsp = random_range(-4, 4);
}
*/
init_collision();
inv_frame = false;
grav = 0.4;
image_speed = 0.35;

if SUGARY_SPIRE
{
	sugary = SUGARY;
	if sugary
		sprite_index = spr_spookey_idle;
}
