if room == rank_room
	visible = false;

mask_index = playerid.mask_index;
if check_slope(x, y + 1) && scr_solid(x, y + 1)
	y = playerid.y;

x += Vspeed + playerid.hsp;
y += (Hspeed + playerid.vsp) - 1;

if is_visible
{
	visible = playerid.visible;
	if place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart)
		visible = false;
}
if !instance_exists(obj_pizzaface_thunderdark) && global.stylethreshold < 2
	visible = false;
