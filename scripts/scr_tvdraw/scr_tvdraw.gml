function scr_tvdraw()
{
	if live_call() return live_result;
	
	if tvreset != global.hud
	{
		tvreset = global.hud;
		targetspr = spr_tv_open;
		state = states.transition;
		sprite_index = spr_tv_idle;
	}
	
	var char = obj_player1.character;
	if SUGARY_SPIRE
		var sugary = check_sugarychar();
	
	var tv_x = SCREEN_WIDTH - 115;
	var tv_y = 80;
	
	if global.hud == hudstyles.april
	{
		tv_x = SCREEN_WIDTH - 127;
		tv_y = 107;
	}
	
	var collect_x = irandom_range(-collect_shake, collect_shake);
	var collect_y = irandom_range(-collect_shake, collect_shake);
	
	// sugary bobbing
	if SUGARY_SPIRE
	{
		if sugary
		{
			tv_x -= 13;
			tv_y += -6 + Wave(2, -2, 3, 0); // collect_y serves as an offset
		}
	}
	
	// combo
	if global.hud != hudstyles.april
	{
		if SUGARY_SPIRE && sugary
			scr_tv_drawcombo(tv_x, tv_y, collect_x, collect_y, 1);
		else if BO_NOISE && char == "BN"
			scr_tv_drawcombo(tv_x, tv_y, collect_x, collect_y, 2);
		else
			scr_tv_drawcombo(tv_x, tv_y, collect_x, collect_y, 0);
	}
	
	if room != strongcold_endscreen
	{
		// sugary tv background
		if SUGARY_SPIRE && (SUGARY or (check_sugary() && instance_exists(obj_ghostcollectibles))) && global.hud == hudstyles.final
		{
			// secrets
			var bgindex = tv_bg_index, bgcol = c_white;
			if instance_exists(obj_ghostcollectibles)
				bgindex = 9; //SUGARY ? 9 : 20;
			if obj_player1.state == states.secretenter && instance_exists(obj_fadeout)
				bgcol = merge_color(c_white, c_black, clamp(obj_fadeout.fadealpha, 0, 1));
			
			// decide sprite
			var sprite = global.panic ? spr_tv_bgescape_ss : spr_tv_bgfinal_ss;
			if sugary
				sprite = global.panic ? spr_tv_bgescape_ssSP : spr_tv_bgfinal_ssSP;
			
			// draw
			draw_sprite_ext(sprite, bgindex, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, bgcol, alpha);
			
			// flash white
			if instance_exists(obj_hungrypillarflash)
			{
				draw_set_flash(c_white);
				draw_sprite_ext(sprite, bgindex, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, obj_hungrypillarflash.fade * alpha);
				draw_reset_flash();
			}
		}
		
		// REMIX tv background
		else if REMIX && global.hud == hudstyles.final && sprite_exists(tv_bg.sprite)
		{
			// secrets
			var bgindex = tv_bg.sprite, bgcol = c_white;
			if instance_exists(obj_ghostcollectibles)
				bgindex = spr_gate_secretBG;
			if obj_player1.state == states.secretenter && instance_exists(obj_fadeout) && global.leveltosave != "secretworld"
				bgcol = merge_color(c_white, c_black, clamp(obj_fadeout.fadealpha, 0, 1));
			
			// move it
			var movespeed// = -obj_player1.hsp / 15;
			//if round(movespeed) == 0
				movespeed = -0.25;
			
			tv_bg.x += movespeed;
			if !surface_exists(tv_bg.surf)
				tv_bg.surf = surface_create(278, 268);
			
			// draw it
			surface_set_target(tv_bg.surf);
			
			toggle_alphafix(true); // chateau tv background
			
			for(var i = 0; i < sprite_get_number(bgindex); i++)
				draw_sprite_tiled(bgindex, i, 278 / 2 + tv_bg.x * max(lerp(-1, 1, tv_bg.parallax[i]), 0), 268);
			
			var clip = spr_tv_clip;
			if SUGARY_SPIRE && sugary
				clip = spr_tv_clipSP;
			
			gpu_set_blendmode(bm_subtract);
			draw_sprite(clip, 1, 278 / 2, 268 - tv_bg.y);
			gpu_set_blendmode(bm_normal);
			
			surface_reset_target();
			
			if PANIC && global.panicbg
			{
				toggle_alphafix(false);
				
				shader_set(shd_panicbg);
				var panic_id = shader_get_uniform(shd_panicbg, "panic");
				shader_set_uniform_f(panic_id, clamp(global.wave / global.maxwave, -0.5, 1));
				var time_id = shader_get_uniform(shd_panicbg, "time");
				shader_set_uniform_f(time_id, (scr_current_time() / 1000) % (pi * 6));
			}
			draw_surface_ext(tv_bg.surf, tv_x + collect_x - 278 / 2, tv_y + collect_y + hud_posY - 268 + tv_bg.y, 1, 1, 0, bgcol, alpha);
			shader_reset();
			
			toggle_alphafix(true);
		}
		
		// normal tv background
		else
		{
			var tv_bg_sprite = spr_tv_bgfinal;
			var bgindex = tv_bg_index;
			
			if SUGARY_SPIRE && sugary
				tv_bg_sprite = spr_tv_bgfinalSP;
			
			if global.hud != hudstyles.final
			{
				tv_bg_sprite = spr_tv_aprilbg;
				
				bgindex = 0;
				if char == "N"
					bgindex = 2;
			}
			
			draw_sprite_ext(tv_bg_sprite, bgindex, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
		}
		
		// player
		var tv_palette = 0;
		if global.hud == hudstyles.final
		{
			if char == "N"
				tv_palette = 1;
			if char == "V"
				tv_palette = 2;
		}
		
		pal_swap_player_palette();
		pal_swap_supernoise();
		draw_sprite_ext(sprite_index, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
		
		// noise jetpack
		var _red = global.noisejetpack && (obj_player1.character != "N" || obj_player1.noisepizzapepper);
		if _red
		{
			cuspal_reset();
			pal_swap_set(obj_player1.spr_palette, 2, false);
			draw_sprite_ext(sprite_index, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
		}
		pal_swap_reset();
		
		// tv frame palette
		if tv_palette != 0
		{
			pal_swap_set(spr_tv_palette, tv_palette, false);
			var spr = spr_tv_empty;
			if sprite_index == spr_tv_open
				spr = sprite_index;
			draw_sprite_ext(spr, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
		}
		
		// static
		if (state == states.tv_whitenoise)
		{
			pal_swap_set(spr_tv_palette, tv_palette, false);
			
			if SUGARY_SPIRE && sugary
				var charspr = spr_tv_whitenoiseSP;
			else
				var charspr = SPRITES[? "spr_tv_whitenoise" + char];
			draw_sprite(charspr ?? spr_tv_whitenoise, tv_trans, tv_x + collect_x, tv_y + collect_y + hud_posY);
		}
		
		// noise coming out of the tv has an edge case
		if sprite_index == spr_tv_exprheatN
		{
			pal_swap_player_palette();
			pal_swap_supernoise();
			draw_sprite_ext(sprite_index, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
			
			if _red
			{
				cuspal_reset();
				pal_swap_set(obj_player1.spr_palette, 2, false);
				draw_sprite_ext(sprite_index, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
			}
		}
		pal_swap_reset();
		
		if SUGARY_SPIRE
		{
			// propeller
			if sugary && targetspr != spr_tv_off && targetspr != spr_tv_open
			{
				propeller_index += 0.35;
				draw_sprite_ext(spr_pizzytvpropeller, propeller_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
			}
		}
		
		// april combo
		if global.hud == hudstyles.april
			scr_tv_drawcombo(tv_x, tv_y, collect_x, collect_y, 3);
	}
	
	// bubble prompt
	if (bubblespr != noone)
		draw_sprite_ext(bubblespr, bubbleindex, SCREEN_WIDTH - 448, 53, 1, 1, 1, c_white, alpha);
	if (!surface_exists(promptsurface))
		promptsurface = surface_create(290, 102);
	surface_set_target(promptsurface);
	draw_clear_alpha(0, 0);
	draw_set_font(lfnt("tvbubblefont"));
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	if (bubblespr == spr_tv_bubble)
	{
		promptx -= promptspd;
		if (bubblespr != spr_tv_bubbleclose && promptx < (350 - string_width(prompt)))
		{
			bubblespr = spr_tv_bubbleclose;
			bubbleindex = 0;
		}
		draw_text_color(promptx - 350, 50, prompt, c_black, c_black, c_black, c_black, 1);
	}
	surface_reset_target();
	draw_surface(promptsurface, SCREEN_WIDTH - 610, 0);
	draw_set_align();
	
	if global.hud == hudstyles.final
		scr_panicdraw();
	else
		scr_panicdraw_old();
}
