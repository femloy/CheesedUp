draw_set_alpha(1);
if hud_is_forcehidden()
	exit;

if global.hud == hudstyles.old
	scr_cameradraw_old();
else if global.hud == hudstyles.minimal
	scr_cameradraw_mini();
else
	scr_cameradraw();
