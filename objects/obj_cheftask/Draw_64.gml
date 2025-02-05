if sprite_index != spr_newclothes
{
	lang_draw_sprite(sprite_index, image_index, x, y);
	draw_sprite(achievement_spr, achievement_index, x, y - 80);
}
else
{
	var spr = spr_newclothes;
	switch character
	{
		case "N":
			spr = spr_newclothesN;
			spr_palette = spr_noisepalette;
			break;
	}
	
	shader_set(global.Pal_Shader);
	if texture != noone
		pattern_set(scr_color_array(character), sprite_index, image_index, image_xscale, image_yscale, texture, true);
	pal_swap_set(spr_palette, paletteselect, false);
	lang_draw_sprite(spr, image_index, x, y);
	if texture != noone
		pattern_reset();
	reset_shader_fix();
}
