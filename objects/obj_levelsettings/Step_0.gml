live_auto_call;
ensure_order;

with obj_player
{
	if place_meeting(x, y, obj_startgate) && image_index >= image_number - 1
		image_speed = 0;
}

scr_menu_getinput();
switch menu
{
	case 0:
		if state == 0
		{
			var move = key_left2 + key_right2;
			if move != 0
				sel = wrap(sel + move, 0, 0 + has_replays);
			if key_jump
			{
				anim_t = 0;
				state = 1;
			}
			if --skip_buffer <= 0 && room != editor_entrance
			{
				with obj_player
				{
					if place_meeting(x, y, obj_startgate) && other.key_taunt2
					{
						with other
							event_user(1);
					}
				}
			}
		}
		break;
	case 1:
		if state == 0
		{
			// subsection
			if !visible
			{
				buffer = 2;
				break;
			}
			if buffer > 0
			{
				buffer--;
				break;
			}

			// move
			var move = (key_right2 or key_down2) - (-key_left2 or key_up2);
			if move_buffer == 0
			{
				move = (key_right or key_down) - (-key_left or key_up);
				move_buffer = 5;
			}
			else if move != 0 && move_buffer == -1
				move_buffer = 20;

			if key_right + key_left != 0
			or key_down - key_up != 0
			{
				if move_buffer > 0
					move_buffer--;
			}
			else
				move_buffer = -1;

			if move != 0
			{
				xo += move * 64;
				select(sel + move);
			}
			
			if tv_state == 1
			{
				tv_img += 0.35;
				if tv_img >= sprite_get_number(spr_modifiertv_switch)
				{
					tv_img = 0;
					tv_state = 0;
					refresh_sequence();
				}
			}
			
			if key_jump
			{
				if sel == -1
				{
					sound_play(sfx_select);
					
					reset_modifier();
					for(var i = 0; i < array_length(options_array); i++)
					{
						var opt = options_array[i];
						variable_struct_set(MOD, opt.vari, opt.opts[opt.value][1]);
					}
					event_user(1);
				}
				else
				{
					var opt = options_array[sel];
					opt.value += 1;
				
					if opt.value >= array_length(opt.opts)
						opt.value = 0;
				
					ds_list_delete(active_modifiers, ds_list_find_index(active_modifiers, opt.icon));
				
					if opt.value == 0
						sound_play_centered(sfx_enemyprojectile);
					else
					{
						sound_play_centered(sfx_killingblow);
						ds_list_add(active_modifiers, opt.icon);
						modif_shake = 4;
					}
					
					if is_array(opt.drawfunc) && array_length(opt.drawfunc) > 1
						refresh_sequence();
				}
			}

			xo = lerp(xo, 0, 0.25);
			yo = lerp(yo, 0, 0.25);
			modif_shake = Approach(modif_shake, 0, 0.25);
			
			if bgmix < 1
			{
				bgmix += 0.1;
				
				var c;
				if sel == -1
					c = #786898;
				else
					c = options_array[sel].color;
				bgcolor = merge_color(bgprev, c, bgmix);
			}
		}
		break;
}

if instance_exists(obj_titlecard)
	fadealpha = obj_titlecard.fadealpha;
if instance_exists(obj_fadeout)
	fadealpha = obj_fadeout.fadealpha;

if safe_get(obj_titlecard, "start")
	instance_destroy();
