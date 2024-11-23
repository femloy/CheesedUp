live_auto_call;

var px = playerid.x, py = playerid.y + 20;
var dist = point_distance(x, y, px, py);
var angle = point_direction(x, y, px, py) + 90;

if dist > 1
{
	/*
	for(var i = 0; i < dist; i += sep)
	{
		draw_sprite_ext(spr_vigihook, 1, lerp(px, x + hsp, i / dist), lerp(py, y + vsp, i / dist), 1, 1, angle, c_white, 1);
	}
	*/
	
	draw_sprite_ext(spr_vigihook_rope, 1, px, py, 1, dist / 50, angle, image_blend, 1);
	
}
if dist < 1
	angle = point_direction(x, y, x - hsp_store, y - vsp_store) + 90;

draw_sprite_ext(spr_vigihook, 0, x, y, 1, 1, angle, image_blend, 1);
