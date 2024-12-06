live_auto_call;

if !is_visible
	exit;
if check_skin(SKIN.cosmic)
{
	if self[$ "characters"] == undefined
		scr_characters(2);
	
	var c = characters[$ obj_player1.character], spr_palette = spr_peppalette, paletteselect = 0;
	if c != undefined
	{
		spr_palette = c.spr_palette;
		paletteselect = c.paletteselect;
	}
	
	pal_swap_set(spr_palette, paletteselect);
	draw_self();
	pal_swap_reset();
}
else if global.performance
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_purple, 1.0);
else
	draw_cosmic_clone(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
