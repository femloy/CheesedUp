SS_CODE_START;

// pto code never fails
var player = instance_place(x, y, obj_player);
if player && player.state == states.climbwall && floor(player.image_index) % 4 == 0
{
	with create_debris(player.x, player.y + 43, spr_molassesgoop)
		vsp = -player.vsp / 4;
}

SS_CODE_END;
