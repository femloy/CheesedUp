image_speed = 0.35;
if string_starts_with(room_get_name(room), "strongcold")
	visible = true;

if image_xscale == 0.5 && image_yscale == 0.5
{
	sprite_index = spr_iceblock_small;
	image_xscale = 1;
	image_yscale = 1;
}
