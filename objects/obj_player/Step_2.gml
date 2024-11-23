live_auto_call;

// swap mode palette and collect difference
player_index = global.swapmode ? global.swap_index : 0;

var pal = player_index;
paletteselect = player_paletteselect[pal];
global.palettetexture = player_patterntexture[pal];
player_paletteindex = pal;

if global.collect != global.lastcollect
{
	var diff = global.collect - global.lastcollect;
	global.lastcollect = global.collect;
	if global.swapmode
		global.collect_player[player_index] += diff;
}

// slope rotation
if MOD.Golf
	exit;

if global.sloperot && state != states.knightpepslopes && state != states.Sjumpprep && state != states.Sjump && !(state == states.machroll && character == "S") && sprite_index != spr_playerN_jetpackboost
{
	var angle_target = 0, angle_spd = 0.6;
	
	var slope = check_slope(x, y + 1, true);
	if slope && state != states.backbreaker && vsp >= 0 && scr_slope()
		angle_target = scr_slope_angle(slope);
	
	if collision_rectangle(bbox_left - 20, bbox_top, bbox_right + 20, bbox_bottom + 8, obj_solid, false, true)
	{
		angle_target /= 2;
		angle_spd = 0.3;
	}
	if check_solid(x, y + 1)
	{
		angle_target = 0;
		angle_spd = 0.5;
	}
	
	angle = lerp(angle, angle_target * flip, angle_spd);
}
else
	angle = 0;

if gravityangle % 180 != 0
	angle = gravityangle;
else
	yscale = flip;
