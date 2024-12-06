live_auto_call;

if !init
	exit;
event_inherited();

if submenu == 0
{
	#region MOVE
	
	if anim_con != 2 switch sel.side
	{
		// CHARACTER
		case 0:
			handx = lerp(handx, SCREEN_WIDTH / 2 - 50, 0.25);
			handy = lerp(handy, -200, 0.1);
			sel.page = 0;
			
			if move_hor != 0
			{
				if move_hor == -1// && !DEBUG
				{
					sideoffset = 10;
					//fmod_event_instance_set_parameter(global.snd_golfjingle, "state", 0, true);
					//fmod_event_instance_play(global.snd_golfjingle);
					exit;
				}
				
				sel.side = move_hor == 1 ? 1 : 2;
				if sel.side == 2
					sel.pal = 0;
				if sel.side == 1
					sel.page = floor(sel.pal / (13 * 7));
				
				sound_play(sfx_angelmove);
				
				flashpal[0] = sel.pal;
				flashpal[1] = 4;
			}
			if move_ver != 0
			{
				var prevpal = sel.char;
				sel.char = clamp(sel.char + move_ver, 0, array_length(characters) - 1);
	
				if sel.char != prevpal
				{
					skin_tip = 0;
			
					charshift[1] = move_ver;
					charshift[2] = 0; // alpha
			
					mixing = false;
					sel.mix = 0;
			
					sound_play(sfx_angelmove);
					event_user(0);
				}
			}
			break;
	
		// PALETTE
		case 1:
			var array = !mixing ? palettes : mixables;
			var max_column = 13;
			var max_total = max_column * 7; // 13 columns 7 rows
			
			var sel_page = "page", sel_pal = "pal";
			if mixing
			{
				sel_page = "mixpage";
				sel_pal = "mix";
			}
			
			var page_offset = max_total * sel[$ sel_page];
			var length = min(array_length(array) - page_offset, max_total);
			var visual_pal = sel[$ sel_pal] - page_offset;
			
			if move_hor == -1 && visual_pal % max_column == 0
			{
				if sel[$ sel_page] > 0
				{
					sel[$ sel_page] -= 1;
					sound_play(sfx_angelmove);
					
					sel[$ sel_pal] -= max_total;
					sel[$ sel_pal] += max_column - 1;
					
					pageoffset = -100;
				}
				else if !mixing
				{
					sel.side = 0;
					event_user(0);
					sound_play(sfx_angelmove);
				}
			}
			else
			{
				// change page
				if move_hor == 1 && visual_pal % max_column == (max_column - 1)
				&& length < array_length(array) - page_offset
				{
					sel[$ sel_page] += 1;
					sound_play(sfx_angelmove);
					
					sel[$ sel_pal] = (floor(visual_pal / max_column) * max_column) + (max_total * sel[$ sel_page]);
					while sel[$ sel_pal] >= array_length(array)
						sel[$ sel_pal] -= max_column;
					
					pageoffset = 100;
					//sel.pal = 0;
				}
				else
				{
					var prevpal = sel[$ sel_pal];
					
					// move left and right
					if (visual_pal % max_column != (max_column - 1) or move_hor == -1)
					&& visual_pal + move_hor < length
					{
						sel[$ sel_pal] += move_hor;
						visual_pal = sel[$ sel_pal] - page_offset; // crash fix
					}
					
					// move up and down
					if visual_pal + move_ver * max_column >= 0
					&& visual_pal + move_ver * max_column < length
						sel[$ sel_pal] += move_ver * max_column;
					
					// sound on move
					if sel[$ sel_pal] != prevpal
					{
						//charshift[0] = -0.75;
						//charshift[2] = 0; // alpha
						sound_play(sfx_angelmove);
		
						flashpal[0] = sel[$ sel_pal];
						flashpal[1] = 4;
					}
					
					// reset palette mix
					if !mixing && !palettes[sel.pal].mixable
					{
						sel.mix = 0;
						mixing = false;
					}
				}
			}
			break;
	
		// CUSTOM
		case 2:
			if move_hor == 1 && (sel.pal % 13 == 12 or sel.pal + 1 > array_length(custom_palettes))
			{
				sel.side = 0;
				event_user(0);
				sound_play(sfx_angelmove);
			}
			else
			{
				var prevpal = sel.pal;
				if (sel.pal % 13 != 0 or move_hor == 1) && sel.pal + move_hor < array_length(custom_palettes) + 1
					sel.pal += move_hor;
		
				if sel.pal + move_ver * 13 >= 0 && sel.pal + move_ver * 13 < array_length(custom_palettes) + 1
					sel.pal += move_ver * 13;
				
				if sel.pal != prevpal
				{
					charshift[0] = 0.75;
					charshift[2] = 0; // alpha
					sound_play(sfx_angelmove);
					
					flashpal[0] = sel.pal;
					flashpal[1] = 4;
				}
				
				if key_jump
				{
					submenu = 1;
					sel.pal = 0;
					
					var color_count = characters[sel.char].color_count;
					if color_count == noone
						color_count = sprite_get_height(characters[sel.char].spr_palette);
					
					for(var i = 0; i < color_count; i++)
					{
						var col = pal_swap_get_pal_color(characters[sel.char].spr_palette, 0, i);
						var r = colour_get_red(col);
						var g = colour_get_green(col);
						var b = colour_get_blue(col);
						
						custom_palette[i * 4] = r / 255;
						custom_palette[i * 4 + 1] = g / 255;
						custom_palette[i * 4 + 2] = b / 255;
						custom_palette[i * 4 + 3] = 1;
					}
				}
			}
			break;
	}

	if flashpal[1] > 0
		flashpal[1]--;
	else
		flashpal[0] = -1;

	#endregion
	#region palette mixing

	if array_length(mixables) > 1 && sel.side == 1 && palettes[sel.pal].mixable
	{
		create_transformation_tip(lstr("mixingtip"), "palettemixing",,true);
		if key_attack2
			mixing = !mixing;
	}
	else
		mixing = false;
	mixingfade = Approach(mixingfade, mixing, 0.2);

	#endregion

	// charshifts
	charshift[0] = lerp(charshift[0], 0, 0.25); // horizontal
	charshift[1] = lerp(charshift[1], 0, 0.25); // vertical
	charshift[2] = lerp(charshift[2], 1, 0.25); // alpha

	// toggle noise pogo
	if sel.side == 0
	{
		if characters[sel.char].char == "N" && global.sandbox
		{
			if check_char("N")
				create_transformation_tip(lstr("noisetypetip"), "noisetype",,true);
			if key_taunt2
			{
				sound_play(sfx_step);
				noisetype = !noisetype;
			}
		}
	}
	else if key_taunt2
	{
		show_unlock = !show_unlock;
		sound_play_centered(sfx_stompenemy);
	}
}
else if submenu == 1 && anim_con != 2
{
	mixingfade = 0;
	if move_ver != 0
	{
		var color_count = characters[sel.char].color_count;
		if color_count == noone
			color_count = sprite_get_height(characters[sel.char].spr_palette);
		
		var prev = sel.pal;
		sel.pal = clamp(sel.pal + move_ver, 0, color_count - 1);
		
		if sel.pal != prev
		{
			
		}
	}
	
	// cancel
	if key_back && anim_con == 0
	{
		close_menu();
		sound_play(sfx_back);
		anim_con = 1;
	}
}

/*
if DEBUG && keyboard_check_pressed(ord("S"))
{
	var st = {};
	for(var i = 0; i < array_length(characters); i++)
	{
		sel.char = i;
		event_user(0);
		
		for(var j = 0; j < array_length(palettes); j++)
		{
			palettes[j].color = noone;
			if palettes[j].texture != noone
			{
				palettes[j].palette = sprite_get_name(palettes[j].texture);
				palettes[j].texture = noone;
			}
		}
		
		struct_set(st, characters[sel.char][0], palettes);
	}
	clipboard_set_text(json_stringify(st, true));
}
*/
