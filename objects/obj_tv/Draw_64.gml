draw_set_font(lang_get_font("bigfont"));
draw_set_align(fa_center, fa_bottom);
draw_set_color(c_white);

if !hud_is_forcehidden()
{
	if global.hud == HUD_STYLES.debug
	{
	
	}
	else if global.hud == HUD_STYLES.old
		scr_tvdraw_old();
	else if global.hud == HUD_STYLES.minimal
		scr_tvdraw_mini();
	else
		scr_tvdraw();
}
