if !global.option_hud
	exit;
if global.hud != hudstyles.final
	exit;

if !REMIX && !(SUGARY_SPIRE && sugary)
{
	for (var i = 0; i < array_length(afterimages); i++)
	{
		var b = afterimages[i];
		//trace($"combo after image {i}: {b[3]}");
		lang_draw_sprite_ext(b[2], b[3], b[0], b[1], image_xscale, image_yscale, image_angle, image_blend, b[4]);
		afterimages[i][4] -= 0.15;
	}
}
scr_combotitledraw(sprite_index, SCREEN_WIDTH + x, y, title, title_index);
