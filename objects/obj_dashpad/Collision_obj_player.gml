var t = id;
with (other)
{
	if (state != states.gotoplayer && state != states.ghost && state != states.actor)
	{
		if (boxxed == 0 && isgustavo == 0 && other.buffer == 0/* && other.sprite_index == spr_dashpad*/)
		{
			if (state == states.trashjump || state == states.trashjumpprep)
				create_debris(x, y, spr_player_trashlid);
			if (state == states.animatronic)
			{
				with (instance_create(x, y, obj_peshinodebris))
					image_index = 0;
				with (instance_create(x, y, obj_peshinodebris))
					image_index = 1;
				with (instance_create(x, y, obj_peshinodebris))
					image_index = 2;
			}
			
			var changecoord = true;
			if place_meeting(x, y, obj_superspring)
				changecoord = false;
			if changecoord
			{
				if SUGARY_SPIRE && other.sugary
				{
					// snap to ground
					for(var i = 1; i < 200; i++)
					{
						if scr_solid(x, y + i)
						{
							y += i - 1;
							break;
						}
					}
				}
				else
					y = other.y - 14;
			}
			
			vsp = 0;
			create_particle(x, y, part.jumpdust, 0);
			if (sprite_index != spr_dashpadmach)
			{
				sprite_index = spr_dashpadmach;
				image_index = 0;
			}
			scr_fmod_soundeffect(snd_dashpad, x, y);
			machhitAnim = false;
			state = states.mach3;
			xscale = sign(other.image_xscale);
			dir = xscale;
			if (movespeed < 14)
			{
				movespeed = 14;
				hsp = xscale * movespeed;
			}
			else
			{
				movespeed += 0.5;
				hsp = xscale * movespeed;
			}
			other.buffer = 30;
		}
		else
		{
			if (boxxed && other.buffer == 0/* && other.sprite_index != spr_dashpad*/)
			{
				changecoord = true;
				if (place_meeting(x, y, obj_superspring))
					changecoord = false;
				if (changecoord)
					y = other.y - 14;
				vsp = 0;
				create_particle(x, y, part.jumpdust, 0);
				scr_fmod_soundeffect(global.snd_ventilator, x, y);
				xscale = sign(other.image_xscale);
				dir = xscale;
				boxxeddash = true;
				if (abs(movespeed) < 14)
					movespeed = xscale * 14;
				else
					movespeed += (xscale * 0.5);
				sprite_index = spr_boxxedpepwalk;
				boxxeddashbuffer = 40;
				state = states.boxxedpep;
				other.buffer = 30;
			}
			if (isgustavo && other.buffer == 0 && gusdashpadbuffer == 0)
			{
				sound_play_3d("event:/sfx/misc/dashpad", x, y);
				changecoord = true;
				if (place_meeting(x, y, obj_superspring))
					changecoord = false;
				if (changecoord)
					y = other.y - 14;
				vsp = 0;
				create_particle(x, y, part.jumpdust, 0);
				xscale = sign(other.image_xscale);
				dir = xscale;
				
				particle_set_scale(part.crazyrunothereffect, t.image_xscale, 1);
				create_particle(x, y, part.crazyrunothereffect);
				
				with (instance_create(x, y, obj_superdashcloud))
					image_xscale = t.image_xscale;
				
				other.buffer = 30;
				ratmount_movespeed = max(ratmount_movespeed + 0.5, 12);
				movespeed = ratmount_movespeed * xscale;
				gustavodash = 51;
				state = states.ratmount;
				if !check_char("G")
					gusdashpadbuffer = 25;
			}
		}
	}
}
