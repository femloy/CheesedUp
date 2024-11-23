var _baddieID = other.baddieID;
if !instance_exists(_baddieID)
	exit;

if check_boss(_baddieID.object_index)
{
	with _baddieID
	{
		state = states.grabbed;
		grabbedby = 1;
		scr_boss_grabbed();
	}
	exit;
}

if (_baddieID.state != states.grabbed && _baddieID.object_index != obj_pizzaball && !_baddieID.invincible && _baddieID.hittable && _baddieID.state != states.ghostpossess)
{
	with (playerid)
	{
		if ((floor(image_index) < 4 || (/*global.attackstyle == 3 && */image_index < 6)) && (state == states.lungeattack || state == states.handstandjump) && state != states.chainsaw && _baddieID.state != states.hit)
		{
			var lag = 5;
			var baddie_id = _baddieID.id;
			movespeed = 6;
			if (ds_list_find_index(hitlist, baddie_id) == -1)
			{
				ds_list_add(hitlist, baddie_id);
				with (_baddieID)
				{
					sound_play_3d("event:/sfx/pep/punch", x, y);
					hp = min(hp - 0.3, 1);
					instance_create(x, y, obj_bangeffect);
					image_xscale = -other.xscale;
					hit_connected = true;
					trace([hithsp, hitvsp]);
					scr_hitstun_enemy(id, lag, ((other.x + ((other.movespeed + 0.5) * 60 * other.xscale)) - x) / 60, round((other.y - y) / 10));
					
					invtime = lag + 5;
					flash = true;
					if (!important)
					{
						global.combotime = 60;
						global.heattime = 60;
					}
					other.lunge_hit_buffer = 100;
				}
				if _baddieID.hp <= -1
					DoFinisher();
				else
				{
					hit_connected = true;
					lunge_hits++;
					finisher_hits++;
					if (state == states.handstandjump)
					{
						state = states.lungeattack;
						if character == "P"
							randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7, spr_punch]);
						else
							randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch]);
						image_index = 0;
					}
				}
				
				vsp = 0;
				scr_hitstun_player(lag);
				
				var debriscount = floor(lunge_hits / 5);
				repeat debriscount
				{
					with (create_debris(x, y, spr_slapstar))
						vsp = irandom_range(-6, -11);
				}
				instance_create(other.x, other.y, obj_parryeffect);
			}
		}
	}
}
