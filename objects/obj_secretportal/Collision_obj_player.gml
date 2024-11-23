if instance_exists(obj_genericdeath)
	exit;

if (active && !instance_exists(obj_jumpscare) && !in_saveroom())
{
	if sprite_index != spr_close
	{
		sprite_index = spr_close;
		image_index = 0;
		sound_play_3d(snd_enter, x, y);
	}
	
	if DEATH_MODE && death
	{
		sound_play("event:/modded/sfx/deathcollect");
		scr_sound_multiple(global.snd_collect, x, y);
		
		global.combotime = 60;
		global.heattime = 60;
		
		var val = heat_calculate(750);
		global.collect += val;
		
		for (var yy = 0; yy < 4; yy++)
		{
			for (var xx = 0; xx < 4; xx++)
			{
				spr_palette = noone;
				paletteselect = 0;
			
				var spr = scr_collectspr(obj_collect, , false);
				create_collect(x - 48 + 16 * xx, y - 48 + 16 * yy, spr, 0, spr_palette, paletteselect);
			}
		}
		instance_create(0, 0, obj_secretfound);
		
		add_saveroom();
		with obj_deathmode
			time_fx += 15;
	}
	if !DEATH_MODE or (!death or instance_exists(obj_deathportalexit))
	{
		if !touched
		{
			with obj_camera
				lock = true;
			if (secret)
				notification_push(notifs.secret_exit, [room]);
			else
				notification_push(notifs.secret_enter, [room, targetRoom]);
			if (!secret)
			{
				obj_music.secret = true;
				obj_music.secretend = false;
			}
			else
			{
				obj_music.secretend = true;
				obj_music.secret = false;
			}
		}
		playerid = other.id;
		other.ghostpepper = 0;
		other.ghostdash = false;
		other.x = x;
		other.y = y - 30;
		other.vsp = 0;
		other.hsp = 0;
		other.cutscene = true;
		other.brick = true;
		with (obj_brickcomeback)
		{
			create_particle(x, y, part.genericpoofeffect);
			instance_destroy();
		}
		if (!touched)
		{
			other.superchargedeffectid = noone;
			if (other.state != states.knightpep && other.state != states.knightpepslopes && other.state != states.knightpepbump && other.state != states.firemouth)
			{
				if (!other.isgustavo)
					other.sprite_index = other.spr_hurt;
				else
					other.sprite_index = other.spr_ratmount_hurt;
				other.image_speed = 0.35;
			}
			if (other.state == states.knightpepslopes)
			{
				other.sprite_index = other.spr_knightpepfall;
				other.state = states.knightpep;
				other.hsp = 0;
				other.vsp = 0;
			}
			other.tauntstoredstate = other.state;
			other.tauntstoredmovespeed = other.movespeed;
			other.tauntstoredhsp = other.hsp;
			other.tauntstoredvsp = other.vsp;
			other.tauntstoredsprite = other.sprite_index;
			other.state = states.secretenter;
		}
		with (obj_heatafterimage)
			visible = false;
		instance_destroy(obj_superchargeeffect);
	}
	touched = true;
}
