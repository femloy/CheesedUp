image_speed = 0.35;
depth = 0;
subimg = 0;
image_speed = 0.35;
start = false;
image_xscale = 1;
snd = fmod_event_create_instance("event:/sfx/misc/toppinhelp");

if global.blockstyle == BLOCK_STYLES.old
{
	sprite_index = spr_pizzaboxunopen_old;
	mask_index = -1;
}
