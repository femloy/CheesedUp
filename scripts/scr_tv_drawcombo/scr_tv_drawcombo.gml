function scr_tv_drawcombo(tv_x, tv_y, collect_x, collect_y, style, tv_palette)
{
	static combo_shake = 0;
	if REMIX
	{
		static combo_prev = 0;
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
	
	switch style
	{
		case 0: // PIZZA TOWER
		case 2: // BO NOISE
			var _cx = tv_x + combo_posX;
			var _cy = tv_y + 117 + hud_posY + combo_posY;
			var _perc = global.combotime / 60;
			var _minX = _cx - 56;
			var _maxX = _cx + 59;
		
			if REMIX
			{
				_cx = round(_cx);
				_cy = round(_cy);
			}
		
			if style == 2
				combofill_x = lerp(combofill_x, _maxX + ((_minX - _maxX) * _perc), 0.5);
			else
				combofill_x = lerp(combofill_x, _minX + ((_maxX - _minX) * _perc), 0.5);
			combofill_y = _cy;
			
			var combobubblefill, combobubble, combofont, combofillpalette, combopalette;
			if style != 2
			{
				combobubblefill = spr_tv_combobubblefill;
				combobubble = spr_tv_combobubble;
				combofont = global.combofont2;
				combofillpalette = spr_tv_combofillpalette;
			}
			else if BO_NOISE
			{
				combobubblefill = spr_tv_combobubblefillBN;
				combobubble = spr_tv_combobubbleBN;
				combofont = global.combofont2BN;
				combofillpalette = spr_tv_combofillpalette;
				draw_sprite(spr_tv_combobubblehandBN, image_index, _cx, _cy);
			}
			
			pal_swap_set(combofillpalette, scr_can_p_rank() ? 2 : 1, false);
			draw_sprite(combobubblefill, combofill_index, combofill_x, combofill_y);
			pal_swap_set(spr_tv_palette, tv_palette, false);
			lang_draw_sprite(combobubble, image_index, _cx, _cy);
			
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
		
		case 1:
			if SUGARY_SPIRE
			{
				// sugary combo
				var _cx = tv_x + combo_posX - 170 - 13;
				var _cy = tv_y + 16 + 6 + hud_posY + combo_posY;
				var _hy = hand_y;
	
				var _perc = global.combotime / 60;
				if global.combo <= 0
				{
					hand_x = Approach(hand_x, 80, 8);
					hand_y = Approach(hand_y, -32, 8);
					_hy = 50;
				}
				else if _cy > -150
				{
					hand_x = lerp(hand_x, 0, 0.15);
					hand_y = lerp(hand_y, lerp(35, -30, _perc), 0.25);
				}
	
				var xx = (_cx - 50) + (-3 + 50);
				var yy = (_cy - 91) + (_hy + 100);
		
				draw_reset_clip();
				draw_set_mask(_cx - 50, _cy - 91, spr_tv_combometercutSP);
				draw_sprite(spr_tv_combometergooSP, propeller_index, xx, yy);
				draw_reset_clip();
				
				pal_swap_set(spr_tv_palette, tv_palette);
				draw_sprite(spr_tv_combobubbleSP, image_index, _cx, _cy);
				draw_sprite(spr_tv_combometerhandSP, image_index, _cx + hand_x + 80, max(_cy, 60 + hud_posY) + min(hand_y, 20) + 24);
			
				draw_set_font(global.combofontSP);
				draw_set_align(fa_center);
				draw_set_color(c_white);
				draw_text(_cx, _cy - 90, string(visualcombo) + "x");
				pal_swap_reset();
			}
			break;
		
		case 3: // APRIL 2021
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
				var b = (global.combotime / 55);
				
				var col = c_white;
				if scr_can_p_rank()
					col = #9850F8;
				draw_sprite_part_ext(spr_barpop, 1, 0, 0, sw * b, sh, barxx, baryy, 1, 1, col, 1);
			}
			break;
	}
}
