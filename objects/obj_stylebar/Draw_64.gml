if hud_is_hidden() or hud_is_forcehidden() or !global.option_hud
	exit;

if global.hud == HUD_STYLES.old && global.heatmeter
{
	draw_set_color(c_white);
	var barxx = -26;
	var baryy = 30;
	draw_sprite(spr_barpop, 0, 230 + barxx, 50 + baryy);
	var sw = sprite_get_width(spr_barpop);
	var sh = sprite_get_height(spr_barpop);
	var b = global.style / 55;
	draw_sprite_part(spr_barpop, 1, 0, 0, sw * b, sh, 230 + barxx, 50 + baryy);
}
