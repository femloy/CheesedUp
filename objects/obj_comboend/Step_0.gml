if eggplant && !instance_exists(playerid)
	exit;

if (timer > 0)
	timer--;
else
{
	timer = timer_max;
	if (comboscore > 0)
	{
		if (combominus <= 1)
			combominus = 1;
		comboscore -= round(combominus);
		if (comboscore < 0)
			comboscore = 0;
		
		spr_palette = noone;
		paletteselect = 0;
		
		var spr = scr_collectspr(obj_collect,, false);
		if !eggplant
			create_collect(camera_get_view_x(view_camera[0]) + x, camera_get_view_y(view_camera[0]) + y, spr, round(combominus), spr_palette, paletteselect);
		else
			create_collect(playerid.x, playerid.y - 100, spr, round(combominus), spr_palette, paletteselect);
	}
	else if (alarm[1] == -1)
		alarm[1] = 50;
}
if !eggplant
{
	if global.combotime > 0 && global.combo > 0 && !(SUGARY_SPIRE && check_sugarychar())
	&& global.hud == HUD_STYLES.final
		y = Approach(y, ystart + 100, 10);
}

title_index += 0.35;
if (title_index >= 2)
	title_index = frac(title_index);
if (room == rank_room || room == timesuproom)
	instance_destroy();

if REMIX
{
	if instance_exists(obj_endlevelfade)
		instance_destroy();
}
