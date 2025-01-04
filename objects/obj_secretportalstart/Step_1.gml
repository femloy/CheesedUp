if !active
	exit;
if (room == tower_soundtestlevel && (obj_player1.state == states.backtohub || obj_player1.state == states.comingoutdoor || obj_player1.targetDoor == "A"))
{
	instance_destroy();
	exit;
}

depth = 0;
image_speed = 0.35;
switch (sprite_index)
{
	case spr_open:
		with (obj_heatafterimage)
			visible = false;
		with (obj_player)
		{
			if (object_index != obj_player2 || global.coop)
			{
				x = other.x;
				y = other.y;
				roomstartx = x;
				roomstarty = y;
				hsp = 0;
				vsp = 0;
				movespeed = 0;
				cutscene = true;
				visible = false;
			}
		}
		if waitbuffer == 0
			post_player_modifiers();
		with obj_camera
		{
			if !point_in_rectangle(other.x, other.y, limitcam[0], limitcam[1], limitcam[2], limitcam[3])
				other.image_index = 0;
		}
		waitbuffer = 80;
		drop = false;
		if (floor(image_index) == (image_number - 1))
		{
			sound_play_3d(snd_exit, x, y);
			sprite_index = spr_idle;
			with (obj_player)
			{
				if ((object_index != obj_player2 || global.coop))
				{
					if (other.override_state != noone)
					{
						state = other.override_state;
						sprite_index = other.override_sprite;
						image_index = 0;
						
						var vars = variable_struct_get_names(other.override_vars);
						for(var i = 0; i < array_length(vars); i++)
							variable_instance_set(id, vars[i], other.override_vars[$ vars[i]]);
					}
					else
					{
						if (!isgustavo && tauntstoredstate != states.knightpep && tauntstoredstate != states.knightpepslopes && tauntstoredstate != states.knightpepbump && tauntstoredstate != states.firemouth && tauntstoredstate != states.removed_state && tauntstoredstate != states.removed_state && tauntstoredstate != states.removed_state)
						{
							visible = true;
							cutscene = false;
							sprite_index = spr_bodyslamstart;
							image_index = 0;
							state = states.freefallprep;
							freefallsmash = 0;
							vsp = !CHAR_OLDNOISE ? -5 : -7;
						}
						else if (isgustavo)
							state = states.ratmount;
						else
						{
							var cotton = state == states.removed_state || state == states.removed_state || state == states.removed_state;
							if (cotton)
							{
								hsp = 0;
								sprite_index = spr_cotton_drill;
							}
							else
							{
								if (state == states.knightpep)
									hsp = 0;
						
								sprite_index = tauntstoredsprite;
							}
						}
					}
				}
			}
		}
		break;
	
	case spr_idle:
		if (!drop)
		{
			with (obj_heatafterimage)
				visible = false;
			with (obj_player1)
			{
				x = other.x;
				y = other.y - 10;
				visible = true;
				hsp = 0;
				movespeed = 0;
				vsp = 10;
				scale_xs = Approach(scale_xs, 1, 0.05);
				scale_ys = Approach(scale_ys, 1, 0.05);
				fallinganimation = 0;
				if (scale_xs == 1)
					other.drop = true;
				if (other.drop)
				{
					if (other.override_state != noone && other.override_sprite != noone)
						state = other.override_state;
					else
					{
						if (!isgustavo && (tauntstoredstate == states.knightpep || tauntstoredstate == states.knightpepslopes || tauntstoredstate == states.knightpepbump || tauntstoredstate == states.firemouth || tauntstoredstate == states.removed_state || tauntstoredstate == states.removed_state || tauntstoredstate == states.removed_state))
						{
							state = tauntstoredstate;
							movespeed = tauntstoredmovespeed;
							hsp = tauntstoredhsp;
							sprite_index = tauntstoredsprite;
								
							if (state == states.actor || state == states.backbreaker || state == states.chainsaw || state == states.machcancel)
							{
								sprite_index = spr_bodyslamstart;
								image_index = 0;
								state = states.freefallprep;
								freefallsmash = 0;
								vsp = !CHAR_OLDNOISE ? -5 : -7;
							}
							
							switch (state)
							{
								case states.knightpep:
									hsp = 0;
									movespeed = 0;
									break;
								case states.knightpepslopes:
									movespeed = 0;
									hsp = 0;
									state = states.knightpep;
									sprite_index = spr_knightpepfall;
									break;
								case states.firemouth:
									if (sprite_index == spr_firemouthdash)
									{
										hsp = 0;
										movespeed = 0;
										sprite_index = spr_firemouthidle;
									}
									break;
							}
						}
					}
				}
			}
		}
		if (drop)
		{
			if (waitbuffer > 0)
				waitbuffer--;
			else
			{
				sprite_index = spr_close;
				image_index = 0;
			}
		}
		break;
	
	case spr_close:
		if (floor(image_index) == (image_number - 1))
		{
			image_index = image_number - 1;
			instance_destroy();
		}
		break;
}
