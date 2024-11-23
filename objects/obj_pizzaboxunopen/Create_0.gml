image_speed = 0.35;
depth = 0;
subimg = 0;
image_speed = 0.35;
start = false;
image_xscale = 1;
snd = fmod_event_create_instance("event:/sfx/misc/toppinhelp");

if global.blockstyle == blockstyles.old
{
	sprite_index = spr_pizzaboxunopen_old;
	mask_index = -1;
}
if SUGARY_SPIRE
{
	sugary = SUGARY;
	if sugary
		sprite_index = spr_confecticage;
}
if BO_NOISE
{
	bo = MIDWAY;
	if bo
		sprite_index = spr_pizzaboxunopen_bo;
}
