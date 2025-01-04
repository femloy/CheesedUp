function scr_tv_drawcombo(tv_x, tv_y, collect_x, collect_y, style)
{
	if live_call(tv_x, tv_y, collect_x, collect_y, style) return live_result;
	
	// combo shake stuff
	static combo_shake = 0, combo_prev = 0;
	if REMIX
	{
		if combo_prev != visualcombo
		{
			if combo_prev < visualcombo
				combo_shake = 2;
			combo_prev = visualcombo;
		}
		combo_shake = Approach(combo_shake, 0, 0.15);
	}
	else
		combo_shake = 0;
	
	// actually draw it
	var _perc = global.combotime / 60;
	if !scr_modding_hook_falser("tv/drawcombo", [_perc, combo_shake])
		return;
	
	switch style
	{
		case 0:
			var _cx = tv_x + combo_posX;
			var _cy = tv_y + 117 + hud_posY + combo_posY;
			var _minX = _cx - 56;
			var _maxX = _cx + 59;
		
			if REMIX
			{
				_cx = round(_cx);
				_cy = round(_cy);
			}
			
			combofill_x = lerp(combofill_x, _minX + ((_maxX - _minX) * _perc), 0.5);
			combofill_y = _cy;
			
			var combobubblefill, combobubble, combofont, combofillpalette;
			combobubblefill = spr_tv_combobubblefill;
			combobubble = spr_tv_combobubble;
			combofont = global.combofont2;
			combofillpalette = spr_tv_combofillpalette;
			
			var custom = scr_modding_character(obj_player1.character);
			if custom != noone
			{
				// TODO
			}
			
			pal_swap_set(combofillpalette, scr_can_p_rank() ? 2 : 1, false);
			draw_sprite(combobubblefill, combofill_index, combofill_x, combofill_y);
			
			var pal = scr_tv_get_palette();
			pal_swap_set(pal.spr_palette, pal.paletteselect, false);
			lang_draw_sprite(combobubble, 0, _cx, _cy);
			
			draw_set_font(combofont);
			draw_set_align(fa_left);
	
			var _tx = _cx - 64;
			var _ty = _cy - 12;
		
			var _str = string(visualcombo);
			var num = string_length(_str);
			for (var i = num; i > 0; i--)
			{
				var char = string_char_at(_str, i);
				draw_text(_tx + random_range(-combo_shake, combo_shake), _ty + random_range(-combo_shake, combo_shake), char);
				_tx -= 22;
				_ty -= 8;
			}
			pal_swap_reset();
			break;
		
		case 1: // APRIL 2021
			if global.combo != 0 && sprite_index != spr_tv_open && sprite_index != spr_tv_off
			{
			    draw_sprite_ext(spr_tv_combo, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
				
				var str = string(global.combo);
			    if global.combo < 10
			        str = concat("0", str);
				
			    draw_set_align();
			    draw_set_font(global.combofont);
			    var num = string_length(str);
			    var w = string_width(str) / num;
			    var xx = 0, yy = 0;
			    for (var i = 0; i < num; i++)
			    {
			        var char = string_char_at(str, i + 1);
			        xx = (i * w) + random_range(-combo_shake, combo_shake);
			        yy = (i * 5) + random_range(-combo_shake, combo_shake);
			        draw_text(SCREEN_WIDTH - 171 + xx, 91 - yy + hud_posY, char);
			    }
				
				// combotime
				var barxx = SCREEN_WIDTH - 128 + -26;
				var baryy = 250 + 30;
				draw_sprite(spr_barpop, 0, barxx, baryy);
				var sw = sprite_get_width(spr_barpop);
				var sh = sprite_get_height(spr_barpop);
				
				var col = c_white;
				if scr_can_p_rank()
					col = #9850F8;
				draw_sprite_part_ext(spr_barpop, 1, 0, 0, sw * _perc, sh, barxx, baryy, 1, 1, col, 1);
			}
			break;
	}
}
