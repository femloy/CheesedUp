function scr_player_mach3effect()
{
	var do_macheffect = (state == states.mach3 or state == states.machcancel || (state == states.ghost && ghostdash && ghostpepper >= 3) || state == states.mach2 || (state == states.Sjump && global.afterimage == AFTERIMAGES.mach) || ratmount_movespeed >= 12 || gusdashpadbuffer > 0)
	or (character == "S" && (abs(movespeed) >= 10 or sprite_index == spr_crazyrun)) or (CHAR_POGONOISE && pogochargeactive) or (state == states.tumble && character == "V" && movespeed >= 11);
	
	if IT_old_machroll()
		do_macheffect |= state == states.machroll or state == states.machslide;
	if IT_grab_mach3effect()
		do_macheffect |= state == states.handstandjump;
	
	if do_macheffect && !macheffect
		toomuchalarm1 = 1;
	macheffect = do_macheffect;
	
	if toomuchalarm1 > 0
	{
		toomuchalarm1 -= 1;
		if toomuchalarm1 <= 0 && do_macheffect && !instance_exists(obj_swapgusfightball)
		{
			with create_mach3effect(x, y, sprite_index, image_index - 1)
			{
				playerid = other.object_index;
				copy_player_scale(other);
			}
			toomuchalarm1 = 6;
		
			if sprite_index == spr_fightball && instance_exists(obj_swapmodefollow)
			{
				with create_mach3effect(x, y, obj_swapmodefollow.spr_fightball, image_index - 1)
				{
					playerid = other.object_index;
					copy_player_scale(other);
				}
			}
		}
	}
}

function scr_player_speedlines()
{
	var do_speedlines = abs(hsp) > 12 && (movespeed > 12 && state == states.mach3 or (character == "S" && state == states.normal));
	if IT_old_speedlines()
		do_speedlines = state == states.mach2;
	
	if do_speedlines && !cutscene && (collision_flags & colflag.secret) <= 0 && room != timesuproom
	{
		if !instance_exists(speedlineseffectid)
		{
			with instance_create(x, y, obj_speedlines)
			{
				playerid = other.object_index;
				other.speedlineseffectid = id;
			}
		}
	}
	else if instance_exists(speedlineseffectid)
		instance_destroy(speedlineseffectid);
}

function scr_player_blurafterimage()
{
	if !IT_blur_afterimage()
		exit;
	
	var do_blur = (breakdance_speed >= 0.6 || (state == states.slipbanan && sprite_index == spr_rockethitwall) || mach4mode == true || boxxeddash == true || state == states.ghost || state == states.tumble || state == states.ratmountbounce || state == states.noisecrusher || state == states.ratmountattack || state == states.handstandjump || (state == states.barrelslide || (state == states.grab && sprite_index == spr_swingding && swingdingdash <= 0) || state == states.freefall || state == states.lungeattack || state == states.ratmounttrickjump || state == states.trickjump));
	if blur_effect > 0
		blur_effect--;
	else if do_blur
	{
		if visible && (collision_flags & colflag.secret) == 0
		{
			blur_effect = 2;
			with create_blur_afterimage(x, y, sprite_index, image_index - 1, xscale)
				playerid = other.id;
		}
	}
}
