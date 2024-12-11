function scr_cameradraw()
{
	if live_call() return live_result;
	
	static timeattack_trans = 0;
	timeattack_trans = global.timeattack ? Approach(timeattack_trans, 1, 0.05) : 0;
	
	var lap3 = REMIX && global.laps >= 1 && !global.timeattack;
	if SUGARY_SPIRE
		var sugary = check_sugarychar();
	
	var player = obj_player1;
	if global.kungfu
		draw_sprite(spr_pizzahealthbar, 8 - global.hp, 190, 70);
	
	draw_set_colour(c_white);
	if player.state == states.dead
		exit;
	
	var hud_xx = 121 + irandom_range(-collect_shake, collect_shake);
	var hud_yy = 90 + irandom_range(-collect_shake, collect_shake) + hud_posY;
		
	if global.hud == hudstyles.april && !lap3
	{
		hud_xx += 28;
		hud_yy += 15;
	}
		
	var rx = hud_xx + 142; // rank bubble
	var ry = hud_yy - 22;
		
	// sprites
	var heatfill = spr_heatmeter_fill;
	var heatmeter = spr_heatmeter;
	var heatpal = spr_heatmeter_palette;
		
	var pizzascorespr = spr_pizzascore;
	var peppersprite = spr_pizzascore_pepper;
	var pepperonisprite = spr_pizzascore_pepperoni;
	var olivesprite = spr_pizzascore_olive;
	var shroomsprite = spr_pizzascore_shroom;
		
	var collectfont = global.collectfont;
	var collectpalette = spr_font_palette;
		
	if SUGARY_SPIRE && sugary
	{
		heatfill = spr_heatmeter_fillSP;
		heatmeter = spr_heatmeterSP;
		heatpal = spr_heatmeter_paletteSP;
			
		pizzascorespr = spr_cakehud;
		peppersprite = spr_cakehud_crank;
		pepperonisprite = spr_cakehud_brank;
		olivesprite = spr_cakehud_arank;
		shroomsprite = spr_cakehud_srank;
			
		collectfont = global.hud == hudstyles.april ? global.collectfontSP : global.candlefont;
		collectpalette = spr_candlefontpalette;
			
		hud_xx += 7;
		hud_yy += 6;
	}
		
	if lap3
	{
		pizzascorespr = spr_lap3hud;
		peppersprite = noone;
		pepperonisprite = noone;
		olivesprite = noone;
		shroomsprite = noone;
			
		collectfont = global.lap3scorefont;
		lap3 = true;
			
		hud_xx += Wave(-4, 4, 2, 10);
		hud_yy += Wave(-1, 1, 4, 0);
	}
		
	// The Code
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
		
	var sw = sprite_get_width(heatfill);
	var sh = sprite_get_height(heatfill);
	var b = global.stylemultiplier;
		
	if global.hud == hudstyles.april
		b = global.style / 55;
	
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
		var pizzascore_y = lerp(hud_yy, hud_yy - 200, timeattack_trans);
		draw_sprite_ext(pizzascorespr, pizzascore_index, hud_xx, pizzascore_y, 1, 1, 0, c_white, alpha);
			
		var _score = global.collect;
		if global.coop
			_score += global.collectN;
			
		if _score >= global.crank && sprite_exists(peppersprite)
			draw_sprite_ext(peppersprite, pizzascore_index, hud_xx, pizzascore_y, 1, 1, 0, c_white, alpha);
		if _score >= global.brank && sprite_exists(pepperonisprite)
			draw_sprite_ext(pepperonisprite, pizzascore_index, hud_xx, pizzascore_y, 1, 1, 0, c_white, alpha);
		if _score >= global.arank && sprite_exists(olivesprite)
			draw_sprite_ext(olivesprite, pizzascore_index, hud_xx, pizzascore_y, 1, 1, 0, c_white, alpha);
		if _score >= global.srank && sprite_exists(shroomsprite)
			draw_sprite_ext(shroomsprite, pizzascore_index, hud_xx, pizzascore_y, 1, 1, 0, c_white, alpha);
			
		// lap 3
		if lap3
		{
			draw_set_font(global.lap3lapfont);
			draw_set_align(fa_center);
			draw_text(hud_xx + 148 - .2, pizzascore_y - 50 + .2, global.laps + 1);
		}
	}
		
	// rank bubble
	if lap3
	{
		rx += 82;
		ry -= 10;
	}
	else if SUGARY_SPIRE && sugary
	{
		rx = hud_xx + 119;
		ry = hud_yy - 45;
	}
		
	if global.timeattack
	{
		rx = lerp(rx, hud_xx - 50, timeattack_trans);
		ry = lerp(ry, hud_yy - 22, timeattack_trans);
	}
		
	if global.hud == hudstyles.final or REMIX
		scr_rankbubbledraw(rx, ry);
		
	// score text
	if !global.timeattack
	{
		draw_set_align();
		draw_set_font(collectfont);
			
		var text_y = 0;
		if !lap3
		{
			switch floor(pizzascore_index)
			{
				case 1: case 2: case 3: text_y = 1; break;
				case 5: case 10: text_y = -1; break;
				case 6: case 9: text_y = -2; break;
				case 7: text_y = -3; break;
				case 8: text_y = -5; break;
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
			if global.hud == hudstyles.april
			{
				xx -= 6;
				yy -= 11;
			}
			else
				yy -= 16;
		}
			
		var use_palette = global.hud == hudstyles.april xor (SUGARY_SPIRE && sugary);
		if use_palette
		{
			if lastcollect != sc
			{
				color_array = array_create(num);
				for (i = 0; i < num; i++)
					color_array[i] = irandom(sprite_get_width(collectpalette) - 1);
				lastcollect = sc;
			}
		}
			
		draw_set_alpha(alpha);
		for (i = 0; i < num; i++)
		{
			if collectfont == global.lap3scorefont
				var yy2 = 20;
			else if SUGARY_SPIRE && sugary
				var yy2 = i % 2 == 0 ? -4 : 0;
			else
				var yy2 = (i + 1) % 2 == 0 ? -5 : 0;
				
			if use_palette
				pal_swap_set(collectpalette, color_array[i], false);
				
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
		
	if global.hud == hudstyles.april
	{
		var ix = 50, iy = 30;
		draw_sprite_ext(spr_inv, image_index, ix, iy, 1, 1, 1, c_white, alpha);
		if global.key_inv
		    draw_sprite_ext(spr_key, image_index, ix, iy, 1, 1, 1, c_white, alpha);
	}
}
