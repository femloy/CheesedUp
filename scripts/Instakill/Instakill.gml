function scr_instakillcheck()
{
	var condition = ((state == states.ratmountbounce && vsp >= 0) || (state == states.noisecrusher && vsp >= 0) || sprite_index == spr_player_Sjumpcancel
	|| sprite_index == spr_swingding || sprite_index == spr_tumble || state == states.boxxedpepspin || state == states.trashroll || state == states.trashjump
	|| state == states.shotgundash || (state == states.shotgunfreefall && (sprite_index == spr_shotgunjump2 || sprite_index == spr_shotgunjump3))
	|| state == states.Sjump || state == states.rocket || state == states.rocketslide || state == states.chainsawbump
	|| (state == states.punch && ((sprite_index != spr_breakdanceuppercut && sprite_index != spr_breakdanceuppercutend) || vsp < 0)) || state == states.faceplant
	|| state == states.rideweenie || state == states.mach3 || (state == states.jump && sprite_index == spr_playerN_noisebombspinjump) || state == states.freefall
	|| state == states.fireass || state == states.jetpackjump || (state == states.firemouth && sprite_index != spr_firemouthintro) || state == states.hookshot
	|| state == states.jetpackjump || state == states.skateboard || state == states.mach4 || state == states.Sjump || state == states.machfreefall
	|| state == states.tacklecharge || (state == states.superslam && sprite_index == spr_piledriver) || state == states.knightpep || state == states.knightpepattack
	|| state == states.knightpepslopes || state == states.trickjump || state == states.cheesepep || state == states.cheeseball || state == states.ratmounttumble
	|| state == states.ratmountgroundpound || (global.noisejetpack == true && (character != "N" || noisepizzapepper)) || state == states.ratmountpunch
	|| state == states.machcancel || state == states.antigrav || holycross > 0 || state == states.barrelslide || state == states.barrelclimbwall
	|| ratmount_movespeed >= 12 || state == states.fightball || (character == "N" && state == states.slipnslide && instance_exists(obj_surfback)) || ghostdash == true
	|| state == states.slipbanan || state == states.shoulderbash || (state == states.machslide && (sprite_index == spr_mach3boost || sprite_index == spr_player_machslideboost3fall)))
	
	or (state == states.handstandjump && (sprite_index == spr_attackdash or sprite_index == spr_airattack or sprite_index == spr_airattackstart))
	or ((sprite_index == spr_jump or sprite_index == spr_tumble or sprite_index == spr_snick_spindash or abs(hsp) >= 16 or sprite_index == spr_snick_roll or sprite_index == spr_walljumpstart) && character == "S")
	or ((state == states.cotton or state == states.cottonroll) && movespeed >= 8) or state == states.cottondrill or sprite_index == spr_cotton_attack
	or (state == states.twirl && sprite_index == spr_pizzano_machtwirl)
	or (state == states.tumble && character == "V" && movespeed >= 11)
	or burning or state == states.stick_flyattack;
	
	if IT_baddie_mach2kill()
	{
		condition |= state == states.crouchslide or state == states.slipnslide or (state == states.hurt && thrown)
		or state == states.mach2 or state == states.climbwall or state == states.tumble or state == states.machroll;
	}
	
	return condition;
}

function Instakill()
{
	if state == states.cotton
		other.baddieID.image_blend = 0xFE8AFF;
	
	other.baddieID.grabbedby = 1;
	if (object_index == obj_player2)
		other.baddieID.grabbedby = 2;
	if (state == states.firemouth)
	{
		repeat (8)
		{
			with (instance_create(other.baddieID.x, other.baddieID.y, obj_firemouthflame))
			{
				hsp = random_range(5, 10);
				vsp = random_range(5, 10);
			}
		}
	}
	if (state == states.mach3 && sprite_index != spr_Sjumpcancel && sprite_index != spr_mach3hit && sprite_index != spr_playerN_jetpackboost && sprite_index != spr_playerN_jetpackslide)
	{
		if (sprite_index != spr_fightball)
			sprite_index = spr_mach3hit;
		image_index = 0;
	}
	if (character == "N" && state == states.boxxedpepspin)
	{
		sprite_index = spr_playerN_boxxedhit;
		image_index = 0;
	}
	if (state == states.chainsawbump && sprite_index != spr_chainsawhit)
	{
		image_index = 0;
		sprite_index = spr_chainsawhit;
	}
	other.baddieID.invtime = 25;
	suplexmove = true;
	if (object_index == obj_player1)
		other.baddieID.grabbedby = 1;
	else
		other.baddieID.grabbedby = 2;
	sound_play_3d("event:/sfx/pep/punch", x, y);
	if (other.baddieID.elite && other.baddieID.object_index != obj_pepperman && other.baddieID.object_index != obj_pizzafaceboss && other.baddieID.object_index != obj_vigilanteboss && other.baddieID.object_index != obj_noiseboss && other.baddieID.object_index != obj_fakepepboss && other.baddieID.object_index != obj_pf_fakepep && other.baddieID.object_index != obj_pizzafaceboss_p3)
		other.baddieID.elitehit = 0;
	other.baddieID.player_instakillmove = true;
	if (!other.baddieID.important)
		global.style += (3 + floor(global.combo / heat_nerf));
	if (!other.baddieID.elite or other.baddieID.elitehit <= 0)
		other.baddieID.mach3destroy = true;
	if (!other.baddieID.killprotection && !global.kungfu && (!other.baddieID.elite or other.baddieID.elitehit <= 0) && !check_boss(other.baddieID.object_index))
		other.baddieID.instakilled = true;
	if (!other.baddieID.important)
	{
		global.combotime = 60;
		global.heattime = 60;
	}
	global.hit += 1;
	if (!grounded && state != states.ratmountgroundpound && state != states.ratmountpunch && state != states.ratmountpunch && state != states.boxxedpepspin && state != states.freefall && (key_jump2 or input_buffer_jump > 0 or state == states.jetpackjump))
	{
		input_buffer_jump = 0;
		suplexmove = false;
		vsp = -11;
	}
	if (state == states.boxxedpepspin)
	{
		if (key_jump2)
			vsp = -10;
		boxxedpepjump = 10;
		noisejetpack = 80;
	}
	if (character == "M" && state == states.freefall)
	{
		vsp = -11;
		state = states.jump;
		sprite_index = spr_jump;
	}
	
	var stored_sprite = sprite_index;
	if (state == states.handstandjump/* && !key_slap*/)
	{
		image_index = random_range(0, image_number - 1);
		if (grounded)
			sprite_index = spr_groundedattack;
		else
			sprite_index = spr_ungroundedattack;
	}
	if (state == states.chainsawbump && !global.kungfu)
	{
		sprite_index = spr_chainsawhit;
		image_index = 0;
	}
	
	if IT_baddie_mach2kill() && !other.baddieID.killprotection
    {
        if state == states.mach3 or state == states.rocket or (state == states.tumble && sprite_index == spr_tumble)
		or (state == states.freefall && freefallsmash > 10) or state == states.superslam
		or state == states.chainsawbump or state == states.punch or state == states.firemouth
		or state == states.knightpep or state == states.knightpepslopes or state == states.grab
		or state == states.rideweenie or state == states.faceplant
        {
            other.baddieID.hp -= 99;
            other.baddieID.instakilled = true;
        }
    }
	
	var lag = 5;
	if (other.baddieID.heavy or check_kungfu_state())
		lag = 10;
	if state == states.handstandjump
		lag = 12;
	
	repeat 3
	{
		create_slapstar(x, y);
		create_baddiegibs(x, y);
	}
	shake_camera(3, 3 / room_speed);
	
	if (state != states.mach2 && state != states.tumble)
	{
		with (instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect))
			sprite_index = spr_kungfueffect;
	}
	if IT_april_enemy_throw() or (state == states.handstandjump && !check_boss(other.baddieID.object_index))
	{
		if key_up
        {
            other.baddieID.vsp = -11;
            other.baddieID.hsp = 0;
        }
        else if key_down
        {
            other.baddieID.vsp = 11;
            other.baddieID.hsp = 0;
        }
        else
        {
            other.baddieID.vsp = -8;
            other.baddieID.hsp = -other.baddieID.image_xscale * 8;
        }
		if state == states.handstandjump
			other.baddieID.shoulderbashed = true; // reduces hp minimum to die to -6
		suplexmove = false;
	}
	else
	{
		other.baddieID.hsp = xscale * (movespeed + 2);
		if (abs(other.baddieID.hsp) < 10)
			other.baddieID.hsp = xscale * 10;
		other.baddieID.vsp = -5;
	}
	
	if (state == states.machcancel || (state == states.ratmountbounce && character == "N")) && move != 0
    {
        other.baddieID.hsp = movespeed + (sign(movespeed) * 2);
        if (abs(other.baddieID.hsp) < 10)
        {
            if (move != 0)
                other.baddieID.hsp = (move * 10);
            else
                other.baddieID.hsp = (xscale * 10);
        }
    }
	
	other.baddieID.hp -= 1;
	other.baddieID.image_xscale = -xscale;
	instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect);
	
	scr_hitstun_enemy(other.baddieID, lag);
	scr_hitstun_player(lag, stored_sprite);
	
	if !other.baddieID.important && other.baddieID.destroyable && !check_boss(other.baddieID.object_index)
		create_baddiegibsticks(other.baddieID.x, other.baddieID.y);
}
