function scr_pistolcollision(damage, x_previous = 0, line = true)
{
	for (var i = 0; i < array_length(collision_list); i++)
	{
		var b = collision_list[i]
		var _inst = -4
		if line
			_inst = collision_line(x, y, x_previous, y, b, false, true)
		else
			_inst = instance_place(x, y, b)
		if line && _inst == -4
			_inst = instance_place(x, y, b)
		scr_pistolhit(_inst, damage)
	}
}

function scr_pistolhit(object, damage)
{
	var _result = false;
	with object
	{
		switch object_index
		{
			case obj_vigilanteboss:
				if (state != states.hit && (state != states.mach2 or kick) && (flickertime <= 0 && vsp > 0) && !reposition)
				{
					_result = true;
					flash = true;
					alarm[2] = 3;
					if other.object_index == obj_pistolbullet
					{
						if other.sprite_index == spr_peppinobulletGIANT
						{
							with obj_camera
							{
								shake_mag = 4;
								shake_mag_acc = 4 / room_speed;
							}
						}
						repeat 3
							create_debris(other.x, other.y, spr_slimedebris);
					}
					instance_create(other.x, other.y, obj_bangeffect);
					if (bullethit < 8)
						bullethit += damage;
					if (bullethit >= 8)
					{
						if !pizzahead
						{
							if other.object_index == obj_pistolbullet
							{
								repeat 8
									create_debris(other.x, other.y, spr_slimedebris)
							}
							instance_create(other.x, other.y, obj_parryeffect);
							scr_sleep(30);
							scr_hitstun_enemy(id, 10, other.image_xscale * 20, -7);
							linethrown = true;
							thrown = true;
							mach2 = false;
							image_xscale = -other.image_xscale;
							sound_play_3d("event:/sfx/enemies/kill", x, y);
							if (elitehit <= 1 && phase == 1)
							{
								sound_play("event:/sfx/misc/blackoutpunch");
								instance_create_unique(0, 0, obj_blackoutline);
								instance_create_unique(0, 0, obj_superattackeffect);
								state = states.phase1hurt;
								sprite_index = spr_playerV_hurt;
								hsp = 0;
								vsp = 0;
								buildup = 100;
								with (obj_player)
								{
									hurted = false;
									image_alpha = 1;
									alarm[5] = -1;
									alarm[6] = -1;
									alarm[8] = -1;
									event_perform(ev_alarm, 7);
								}
							}
						}
						else
						{
							obj_player1.baddiegrabbedID = id;
							grabbedby = 1;
							scr_boss_grabbed();
						}
					}
					if other.object_index != obj_playerbombexplosion
						instance_destroy(other);
				}
				break;
			
			case obj_pizzafaceboss_p2:
				if (state != states.hit && (flickertime <= 0 && grounded && vsp > 0))
				{
					_result = true;
					flash = true;
					alarm[2] = 3;
					if other.object_index == obj_pistolbullet
					{
						if (other.sprite_index == spr_peppinobulletGIANT)
							shake_camera(4, 4 / room_speed);
						repeat (3)
							create_debris(other.x, other.y, spr_slimedebris);
					}
					instance_create(other.x, other.y, obj_bangeffect);
					if (bullethit < 22)
						bullethit += damage;
					if (bullethit >= 22)
					{
						if other.object_index == obj_pistolbullet
						{
							repeat 8
								create_debris(other.x, other.y, spr_slimedebris);
						}
						instance_create(other.x, other.y, obj_parryeffect);
						scr_sleep(30);
						sound_play_3d("event:/sfx/enemies/kill", x, y);
						if (elitehit <= 1)
						{
							sound_play("event:/sfx/misc/blackoutpunch");
							instance_create_unique(0, 0, obj_superattackeffect);
							instance_create_unique(0, 0, obj_blackoutline);
							state = states.phase1hurt;
							sprite_index = spr_pizzahead_hurt;
							hsp = 0;
							vsp = 0;
							buildup = 100;
							hitX = x;
							hitY = y;
							with (obj_player)
							{
								hurted = false;
								image_alpha = 1;
								alarm[5] = -1;
								alarm[6] = -1;
								alarm[8] = -1;
								event_perform(ev_alarm, 7);
							}
						}
						else
							elitehit--;
					}
					if other.object_index != obj_playerbombexplosion
						instance_destroy(other);
				}
				break;
			
			case obj_vigilantecow:
			case obj_pizzahead_cog:
			case obj_targetguy:
				_result = true;
				flash = true;
				flashbuffer = 8;
				if (sprite_index == spr_peppinobulletGIANT)
					shake_camera(3, 3 / room_speed);
				instance_create(other.x, other.y, obj_bangeffect);
				if (bullethit > 0)
					bullethit -= damage;
				if (bullethit <= 0)
				{
					instance_create(other.x, other.y, obj_parryeffect);
					scr_sleep(30);
					sound_play_3d("event:/sfx/enemies/kill", x, y);
					instance_destroy();
				}
				if other.object_index != obj_playerbombexplosion
					instance_destroy(other);
				break;
			
			case obj_johnecheese:
				_result = true;
				repeat (3)
					create_debris(other.x, other.y, spr_slimedebris);
				instance_create(other.x, other.y, obj_bangeffect);
				instance_create(other.x, other.y, obj_parryeffect);
				instance_destroy();
				break;
			
			default:
				if object_is_ancestor(object_index, obj_baddie)
				{
					if check_boss(object_index) && !other.object_index != obj_playerbombexplosion
					{
						// TODO april pistol boss damage
						
						_result = true;
						instance_destroy(other);
					}
					/*
					else if object_index == obj_grandpa && !other.object_index != obj_playerbombexplosion
					{
						if other.image_xscale == -image_xscale
						{
							sprite_index = spr_grandpa_punch;
							image_index = 0;
						}
						if other.object_index != obj_playerbombexplosion
							instance_destroy(other);
					}
					*/
					else if state == states.underground
					{
						// do nothing
					}
					else if destroyable && boundbox
					{
						global.style += (5 + floor(global.combo / 5));
						instance_destroy();
					}
				}
				else
					instance_destroy();
				break;
		}
	}
	return _result;
}
