function scr_combo_freeze(player)
{
	with player
	{
		if state == states.door || state == states.teleport || state == states.shotgun || state == states.tube || state == states.spaceshuttle || state == states.taxi || state == states.gottreasure || state == states.victory || state == states.gottreasure || state == states.actor || state == states.comingoutdoor || (state == states.knightpep && (sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder)) || instance_exists(obj_fadeout) || (collision_flags & colflag.secret) > 0
			return true;
		if room == forest_G1b or global.combotimepause > 0
			return true;
	}
	return false;
}
function scr_combo_drain(player)
{
	if MOD.NoiseWorld
		return 0.1;
	if player.character == "G"
		return 0.1;
	return 0.15;
}
function scr_heat_drain(player)
{
	return heat_timedrop;
}
