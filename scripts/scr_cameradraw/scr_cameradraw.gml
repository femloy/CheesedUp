function scr_cameradraw()
{
	if live_call() return live_result;
	
	static timeattack_trans = 0;
	if global.timeattack
		timeattack_trans = Approach(timeattack_trans, 1, 0.05);
	else
		timeattack_trans = 0;
	
	if SUGARY_SPIRE
		var sugary = check_sugarychar();
	if BO_NOISE
		var bo = (player.character == "BN");
	
	var player = obj_player1;
	if global.kungfu
		draw_sprite(spr_pizzahealthbar, 8 - global.hp, 190, 70);
	
	draw_set_colour(c_white);
	if player.state != states.dead
	{
		var hide = (((MOD.Mirror && player.x > SCREEN_WIDTH - 250) or (!MOD.Mirror && player.x < 250)) && player.y < 169) or manualhide;
		with obj_tutorialbook
		{
			if in_level && (text_state == states.fall or text_state == states.normal)
				hide = true;
		}
		
		if SUGARY_SPIRE && sugary
			hud_posY = lerp(hud_posY, hide * -300, 0.15);
		else
			hud_posY = Approach(hud_posY, hide * -300, 15);
		
		var cmb = 0;
		if global.hud != hudstyles.april
		{
			if (global.combo >= 50)
				cmb = 2;
			else if (global.combo >= 25)
				cmb = 1;
		}
		
		if global.heatmeter && cmb < global.stylethreshold
			cmb = global.stylethreshold;
		
		if BO_NOISE && bo
			cmb = 1;
		
		if REMIX or global.heatmeter 
			pizzascore_index = (pizzascore_index + (0.25 * cmb)) % pizzascore_number;
		else
			pizzascore_index = 0;
		if cmb <= 0
		{
			if floor(pizzascore_index) != 0
				pizzascore_index += 0.35;
			else
				pizzascore_index = 0;
		}
	
		var heatfill = spr_heatmeter_fill;
		var heatmeter = spr_heatmeter;
		var heatpal = spr_heatmeter_palette;
	
		switch player.character
		{
			case "SP":
				if SUGARY_SPIRE
				{
					heatfill = spr_heatmeter_fillSP;
					heatmeter = spr_heatmeterSP;
					heatpal = spr_heatmeter_paletteSP;
				}
				break;
		}
	
		var sw = sprite_get_width(heatfill);
		var sh = sprite_get_height(heatfill);
		var b = global.stylemultiplier;
		var hud_xx = 121 + irandom_range(-collect_shake, collect_shake);
		var hud_yy = 90 + irandom_range(-collect_shake, collect_shake) + hud_posY;
		
		if global.hud == hudstyles.april
		{
			hud_xx += 28;
			hud_yy += 15;
			b = global.style / 55;
		}
		
		if SUGARY_SPIRE && sugary
		{
			hud_xx += 7;
			hud_yy += 6;
		}
		if BO_NOISE && bo
			hud_yy -= 20;
	
		// heat meter
		if global.heatmeter
		{
			shader_set(global.Pal_Shader);
			pal_swap_set(heatpal, min(global.stylethreshold, 3) + (global.stylethreshold >= 3 && global.style >= 55), false);
			draw_sprite_part(heatfill, pizzascore_index, 0, 0, sw * b, sh, hud_xx - 95, hud_yy + 24);
			draw_sprite_ext(heatmeter, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha);
			reset_shader_fix();
		}
		
		// pizza score
		if !global.timeattack or timeattack_trans < 1
		{
			var pizzascorespr = spr_pizzascore;
			var peppersprite = spr_pizzascore_pepper;
			var pepperonisprite = spr_pizzascore_pepperoni;
			var olivesprite = spr_pizzascore_olive;
			var shroomsprite = spr_pizzascore_shroom;
	
			if SUGARY_SPIRE && sugary
			{
				pizzascorespr = spr_cakehud;
				peppersprite = spr_cakehud_crank;
				pepperonisprite = spr_cakehud_brank;
				olivesprite = spr_cakehud_arank;
				shroomsprite = spr_cakehud_srank;
			}
			else if BO_NOISE && bo
			{
				pizzascorespr = spr_pizzascoreBN;
				peppersprite = spr_null;
				pepperonisprite = spr_null;
				olivesprite = spr_null;
				shroomsprite = spr_null;
			}
			
			var pizzascore_y = lerp(hud_yy, hud_yy - 200, timeattack_trans);
			draw_sprite_ext(pizzascorespr, pizzascore_index, hud_xx, pizzascore_y, 1, 1, 0, c_white, alpha);
	
			var _score = global.collect;
			if global.coop
				_score += global.collectN;
	
			if _score >= global.crank
				draw_sprite_ext(peppersprite, pizzascore_index, hud_xx, pizzascore_y, 1, 1, 0, c_white, alpha);
			if _score >= global.brank
				draw_sprite_ext(pepperonisprite, pizzascore_index, hud_xx, pizzascore_y, 1, 1, 0, c_white, alpha);
			if _score >= global.arank
				draw_sprite_ext(olivesprite, pizzascore_index, hud_xx, pizzascore_y, 1, 1, 0, c_white, alpha);
			if _score >= global.srank
				draw_sprite_ext(shroomsprite, pizzascore_index, hud_xx, pizzascore_y, 1, 1, 0, c_white, alpha);
		}
		
		// rank bubble
		var rx = hud_xx + 142;
		var ry = hud_yy - 22;
		
		if SUGARY_SPIRE && sugary
		{
			rx = hud_xx + 119;
			ry = hud_yy - 45;
		}
		
		if global.timeattack
			rx = lerp(rx, hud_xx - 50, timeattack_trans);
		
		if global.hud == hudstyles.final or REMIX
			scr_rankbubbledraw(rx, ry);
		
		// score text
		if !global.timeattack
		{
			draw_set_align();
			var collectfont = global.collectfont;
			if SUGARY_SPIRE && sugary
				collectfont = global.collectfontSP; 
			if BO_NOISE && bo 
				collectfont = global.collectfontBN;
		
			draw_set_font(collectfont);
			
			var text_y = 0;
			if !(BO_NOISE && bo)
			{
				switch floor(pizzascore_index)
				{
					case 1:
					case 2:
					case 3:
						text_y = 1;
						break;
					case 5:
					case 10:
						text_y = -1;
						break;
					case 6:
					case 9:
						text_y = -2;
						break;
					case 7:
						text_y = -3;
						break;
					case 8:
						text_y = -5;
						break;
				}
			}
	
			var cs = 0;
			with obj_comboend
				cs += comboscore;
			with obj_particlesystem
			{
				for (var i = 0; i < ds_list_size(global.collect_list); i++)
					cs += ds_list_find_value(global.collect_list, i).value;
			}
			var sc = _score - global.comboscore - cs;
			if sc < 0
				sc = 0;
			var str = string(sc);
			var num = string_length(str);
			var w = string_width(str);
		
			var xx = hud_xx - (w / 2);
			var yy = hud_yy - 56 + text_y;
		
			if SUGARY_SPIRE && sugary
			{
				xx -= 6;
				yy -= 11;
			}
		
			if global.hud == hudstyles.april
			{
				if lastcollect != sc
				{
					color_array = array_create(num);
					for (i = 0; i < num; i++)
						color_array[i] = choose(irandom(3));
					lastcollect = sc;
				}
				shader_set(global.Pal_Shader);
			}
	
			draw_set_alpha(alpha);
			for (i = 0; i < num; i++)
			{
				if SUGARY_SPIRE && sugary
					var yy2 = i % 2 == 0 ? -4 : 0;
				else
				{
					var yy2 = (i + 1) % 2 == 0 ? -5 : 0;
					if global.hud == hudstyles.april
						pal_swap_set(spr_font_palette, color_array[i], false);
				}
				draw_text(floor(xx), floor(yy + yy2), string_char_at(str, i + 1));
				xx += w / num;
			}
			draw_set_alpha(1);
			pal_swap_reset();
		}
		
		// bullets
		var showbullet = player.character != "V" && player.character != "S" && !player.isgustavo;
		
		var bx = hud_xx - 70, by = hud_yy + 54;
		if global.heatmeter
			by += 42;
		if global.shootstyle == shootstyles.pistol && showbullet
		{
			var spr = spr_peppinobullet_collectible, yo = -76;
			switch player.character
			{
				case "N":
					spr = spr_noisebombHUD;
					yo = -16;
					break;
			}
			bx = scr_draw_fuel(bx, by + yo, spr, global.bullet, 3, global.doublegrab == doublestyles.chainsaw ? -8 : 8) + 20;
		}
		if global.doublegrab == doublestyles.chainsaw && showbullet
			bx = scr_draw_fuel(bx, by, spr_fuelHUD, global.fuel, 3, global.shootstyle == shootstyles.pistol ? -8 : 8);
	
		draw_set_font(lang_get_font("bigfont"));
		draw_set_halign(fa_center);
		draw_set_color(c_white);
		
		/*
		if player.character == "V"
		{
			//draw_text(200 + healthshake, 125 + healthshake, global.playerhealth);
			//draw_sprite(spr_pizzaHUD, floor(global.playerhealth / 11), 190, 70);
		}
		*/
		
		if (BO_NOISE && bo) or global.hud == hudstyles.april
		{
			var ix = 50, iy = 30;
			if BO_NOISE && bo
			{
				ix = 41;
				iy = 150 + hud_posY;
			}
			
			draw_sprite_ext(spr_inv, image_index, ix, iy, 1, 1, 1, c_white, alpha);
		    if global.key_inv
		        draw_sprite_ext(spr_key, image_index, ix, iy, 1, 1, 1, c_white, alpha);
		}
	}
}
