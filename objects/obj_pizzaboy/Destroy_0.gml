if in_baddieroom()
	exit;

repeat 3
{
	create_slapstar(x, y);
	create_baddiegibs(x, y);
}
shake_camera(3, 3 / room_speed);
with instance_create(x, y, obj_sausageman_dead)
{
	sprite_index = other.spr_dead;
	spr_palette = other.spr_palette;
	paletteselect = other.paletteselect;
	usepalette = other.usepalette;
	image_alpha = other.image_alpha;
	if SUGARY_SPIRE
		sugary = other[$ "sugary"] ?? false;
	image_blend = other.image_blend;
}

if !important
{
	notification_push(notifs.pizzaboy_dead, [room]);
	sound_play_3d("event:/sfx/enemies/kill", x, y);
}
