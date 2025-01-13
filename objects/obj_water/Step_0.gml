live_auto_call;

instance_activate_object(my_solid);
with my_solid
{
	x = other.x;
	y = other.y;
	image_xscale = other.image_xscale;
	image_yscale = other.image_yscale;
}

with instance_place(x, y - 1, obj_baddie)
	instance_destroy();
if instance_exists(obj_genericdeath)
	exit;

with instance_place(x, y - 1, obj_player)
{
	var condition = (state != states.gotoplayer && state != states.trashjump && state != states.trashjumpprep && state != states.mach3 && state != states.parry && sprite_index != spr_mach3boost && !((state == states.ratmount or state == states.ratmountjump) && ratmount_movespeed >= 12))
	&& (state != states.machcancel || sprite_index == spr_playerN_divebomb || sprite_index == spr_playerN_divebombfall || sprite_index == spr_playerN_divebombland);
	
	if place_meeting(x, y, other.my_solid)
		instance_deactivate_object(other.my_solid);
	
	if condition
	{
		if place_meeting(x, y + 1, other)
		{
			if state != states.trashroll
			{
				if character == "V"
				{
					instance_deactivate_object(other.my_solid);
					if !place_meeting(x, y + 1, obj_solid)
					{
						while bbox_bottom <= other.y
							y++;
						if y >= other.bbox_top - 10 or vsp >= 0
						{
							if state != states.swimming
							{
								movespeed = hsp;
								sprite_index = spr_playerV_swimidle;
								image_index = 0;
								
								if vsp >= 0
								{
									sound_play("event:/sfx/misc/watersplash");
									vsp = clamp(vsp, 6, 14);
									
									with (instance_create(x, y, obj_superdashcloud))
										sprite_index = spr_watereffect;
								}
							}
							state = states.swimming;
							burning = 2;
						}
					}
				}
				else
				{
					sound_play("event:/sfx/misc/watersplash");
					scr_losepoints();
					sprite_index = spr_scaredjump1;
					image_index = 0;
					image_speed = 0.35;
					state = states.fireass;
					movespeed = hsp;
					vsp = -14;
					instance_create(x, y + 20, obj_piranneapplewater);
					with instance_create(x, y, obj_superdashcloud)
						sprite_index = spr_watereffect;
				}
			}
			else
			{
				vsp = -6;
				sprite_index = spr_player_jumpdive1;
				image_index = 0;
			}
		}
	}
}
