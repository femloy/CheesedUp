with obj_player
{
	if !(place_meeting(x + hsp, y, other) || place_meeting(x + xscale, y, other))
		continue;
	
	stored_result = false;
	scr_modding_hook_callback("block/metalside", function()
	{
		if live_result == true
		{
			stored_result = true;
			return HOOK_CALLBACK_STOP;
		}
	});
	
	if (state == states.mach3 || (ghostdash == 1 && ghostpepper >= 3) || ratmount_movespeed >= 12
	|| state == states.rocket || state == states.knightpepslopes || state == states.shoulderbash
	or (check_sugarychar() && sprite_index == spr_machroll && abs(hsp) >= 12)
	or (state == states.slipbanan && SUGARY) or (abs(movespeed) >= 16 && character == "S" && (state == states.normal or state == states.jump or state == states.machroll))
	or sprite_index == spr_buttattack or sprite_index == spr_buttattackstart
	or (state == states.twirl && movespeed >= 12)
	or stored_result)
	{
		if character == "V" && !isgustavo
			instance_create(x, y, obj_dynamiteexplosion);
		with other
		{
			particle_hsp(other);
			instance_destroy();
		}
	}
}

var player = instance_nearest(x, y, obj_player);
if player && distance_to_object(player) <= 1
{
	if player.ghostdash == 1 && player.ghostpepper >= 3
	{
		particle_momentum();
		instance_destroy();
	}
	if place_meeting(x, y - 1, player) && ((player.state == states.freefall || player.state == states.superslam) && player.freefallsmash >= 10)
	{
		with player
		{
			if character == "M"
			{
				state = states.jump;
				vsp = -7;
				sprite_index = spr_jump;
			}
		}
		
		particle_vsp();
		instance_destroy();
	}
	if place_meeting(x, y - 1, player) && (((player.state == states.ratmountbounce || player.state == states.noisecrusher) && player.vsp > 0) || player.state == states.knightpep || player.state == states.hookshot)
	{
		particle_vsp();
		instance_destroy();
	}
	if superjumpable && place_meeting(x, y + 1, player) && player.state == states.Sjump
	{
		particle_vsp();
		instance_destroy();
	}
}
