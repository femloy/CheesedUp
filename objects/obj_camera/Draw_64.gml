draw_set_alpha(1);

if global.hud == hudstyles.debug
	scr_debugdraw();
else if !hud_is_forcehidden()
{
	if global.hud == hudstyles.old
		scr_cameradraw_old();
	else if global.hud == hudstyles.minimal
		scr_cameradraw_mini();
	else
		scr_cameradraw();
}
