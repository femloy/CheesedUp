function scr_scareenemy()
{
	var player = instance_nearest(x, y, obj_player);
	if state != states.grabbed && state != states.stun && state != states.hit && state != states.secret
	&& sprite_index != scaredspr && state != states.idle && state != states.staggered
	{
		if ((player.x > (x - 400) && player.x < (x + 400)) && (y <= (player.y + 90) && y >= (player.y - 130))
		&& ((player.xscale > 0 && x >= player.x) || (player.xscale < 0 && x <= player.x)))
		{
			if ((player.state == states.chainsawbump || player.ratmount_movespeed == 12 || player.state == states.mach3 || (player.character == "S" && abs(player.hsp) >= 16) || player.state == states.rideweenie || player.state == states.rocket || player.state == states.tacklecharge || player.state == states.knightpepslopes || (player.state == states.grab && player.swingdingdash <= 0 && player.sprite_index == player.spr_swingding)
			or (player.state == states.twirl && player.movespeed >= 12)))
			{
				if (collision_line(x, y, player.x, player.y, obj_solid, false, true) == noone)
				{
					state = states.idle;
					sprite_index = scaredspr;
					if (x != player.x)
						image_xscale = -sign(x - player.x);
					scaredbuffer = 100;
					if (irandom(100) <= 5)
						sound_play_3d("event:/sfx/voice/enemyrarescream", x, y);
					if (vsp < 0)
						vsp = 0;
					if (grounded)
						vsp = -3;
				}
			}
		}
	}
}
function scr_enemybird()
{
	if state == states.stun && stunned > 100 && !birdcreated
	{
		birdcreated = true;
		with instance_create(x, y, obj_enemybird)
			ID = other.id;
	}
}
function scr_boundbox(correct_mask = false)
{
	if !boundbox && alarm[11] <= 0
	{
		with instance_create(x, y, obj_baddiecollisionbox)
		{
			sprite_index = other.sprite_index;
			mask_index = correct_mask ? other.mask_index : other.sprite_index;
			baddieID = other.id;
			other.boundbox = true;
		}
	}
}
function check_heat()
{
	return usepalette && !(object_index == obj_cheeseslime && snotty) && object_index != obj_ninja
	&& (object_index != obj_kentukykenny or !important);
}
