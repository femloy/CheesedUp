draw_set_alpha(1);

if !hud_is_forcehidden()
{
	if global.hud == HUD_STYLES.debug
		scr_debugdraw();
	else if global.hud == HUD_STYLES.old
		scr_cameradraw_old();
	else if global.hud == HUD_STYLES.minimal
		scr_cameradraw_mini();
	else
		scr_cameradraw();
}
