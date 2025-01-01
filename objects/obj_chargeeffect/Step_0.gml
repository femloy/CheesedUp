ensure_order;

var condition = playerid.state != states.rocket && playerid.gusdashpadbuffer <= 0 && playerid.state != states.mach3 && playerid.ratmount_movespeed < 12 && playerid.state != states.crouchslide && playerid.state != states.shoulderbash && !(playerid.character == "S" && (playerid.sprite_index == playerid.spr_mach4 or playerid.sprite_index == playerid.spr_crazyrun));
if condition && !scr_modding_hook_truer("player/chargeeffect/condition")
{
	instance_destroy();
	exit;
}

if scr_modding_hook_falser("player/chargeeffect/prestep")
{
	copy_player_scale(playerid);
	
	x = playerid.x + (((playerid.sprite_index == playerid.spr_Sjumpcancel) ? 20 : 0) * playerid.xscale);
	y = playerid.y - (playerid.character == "M" ? 10 : 0);
	
	if playerid.state == states.rocket
		x = playerid.x + (playerid.xscale * 18);
	if playerid.state == states.ratmount
		x = playerid.x + (playerid.xscale * 18);
	if playerid.sprite_index == playerid.spr_fightball
		x = playerid.x + (playerid.xscale * 18);
	
	visible = !(room == rank_room);
	if place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart)
		visible = false;
	if playerid.sprite_index == playerid.spr_rocketstart
		visible = false;
	
	scr_modding_hook("player/chargeeffect/poststep");
}
