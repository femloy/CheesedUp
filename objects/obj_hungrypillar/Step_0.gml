if (room == rm_editor)
	exit;

if (sprite_index != spr_protojohn)
{
	var player = obj_player1.id;
	
	if player.x > (x - 400) && player.x < (x + 400) && player.y > (y - 300) && player.y < (y + 300)
	&& (happyspr != noone or (player.state == states.chainsawbump || player.ratmount_movespeed == 12 || player.state == states.mach3 || player.state == states.rideweenie || player.state == states.rocket || player.state == states.tacklecharge || player.state == states.knightpepslopes || (player.state == states.grab && player.swingdingdash <= 0 && player.sprite_index == player.spr_swingding)))
		sprite_index = angryspr;
	else
	{
		if happyspr != noone
		{
			if sprite_index == angryspr
			{
				sprite_index = happyspr;
				alarm[0] = 100;
			}
		}
		else
			sprite_index = idlespr;
	}
}
