function scr_tvdraw()
{
	if live_call() return live_result;
	
	if tvreset != global.hud
	{
		tvreset = global.hud;
		targetspr = spr_tv_open;
		state = states.transition;
		sprite_index = targetspr;
	}
	
	var char = obj_player1.character;
	
	var tv_x = SCREEN_WIDTH - 115;
	var tv_y = 80;
	
	if global.hud == HUD_STYLES.april
	{
		tv_x = SCREEN_WIDTH - 127;
		tv_y = 107;
	}
	
	var custom = scr_modding_hook_any("tv/position", [tv_x, tv_y]);
	if custom != undefined && is_array(custom) && array_length(custom) == 2 && is_real(custom[0]) && is_real(custom[1])
	{
		tv_x = custom[0];
		tv_y = custom[1];
	}
	
	var collect_x = irandom_range(-collect_shake, collect_shake);
	var collect_y = irandom_range(-collect_shake, collect_shake);
	
	// combo
	if global.hud != HUD_STYLES.april
		scr_tv_drawcombo(tv_x, tv_y, collect_x, collect_y, 0);
	
	if room != strongcold_endscreen
	{
		// custom background
		if !scr_modding_hook_falser("tv/background", [tv_x + collect_x, tv_y + collect_y + hud_posY])
		{
			
		}
		
		// REMIX tv background
		else if REMIX && global.hud == HUD_STYLES.final && sprite_exists(tv_bg.sprite)
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
			
			gpu_set_blendmode(bm_subtract);
			draw_sprite(spr_clip, 1, 278 / 2, 268 - tv_bg.y);
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
			var tv_bg_sprite = spr_bgfinal;
			var bgindex = tv_bg_index;
			
			if spr_bgfinal == spr_tv_bgfinal && global.hud != HUD_STYLES.final
			{
				tv_bg_sprite = spr_tv_aprilbg;
				bgindex = char == "N" ? 2 : 0;
			}
			
			draw_sprite_ext(tv_bg_sprite, bgindex, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
		}
		
		// player
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
		var tv_palette = scr_tv_get_palette();
		if tv_palette.paletteselect != 0
		{
			pal_swap_set(tv_palette.spr_palette, tv_palette.paletteselect, false);
			var spr = targetspr == spr_tv_open ? sprite_index : spr_empty;
			draw_sprite_ext(spr, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
		}
		
		// static
		if state == states.tv_whitenoise
			draw_sprite(spr_whitenoise, tv_trans, tv_x + collect_x, tv_y + collect_y + hud_posY);
		
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
		
		// custom
		scr_modding_hook("tv/postdraw", [tv_x + collect_x, tv_y + collect_y + hud_posY]);
		
		// april combo
		if global.hud == HUD_STYLES.april
			scr_tv_drawcombo(tv_x, tv_y, collect_x, collect_y, 1);
	}
	
	// bubble prompt
	if bubblespr != noone
		draw_sprite_ext(bubblespr, bubbleindex, SCREEN_WIDTH - 448, 53, 1, 1, 1, c_white, alpha);
	if !surface_exists(promptsurface)
		promptsurface = surface_create(290, 102);
	
	surface_set_target(promptsurface);
	draw_clear_alpha(0, 0);
	draw_set_font(lfnt("tvbubblefont"));
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	if bubblespr == spr_tv_bubble
	{
		promptx -= promptspd;
		if bubblespr != spr_tv_bubbleclose && promptx < (350 - string_width(prompt))
		{
			bubblespr = spr_tv_bubbleclose;
			bubbleindex = 0;
		}
		draw_text_color(promptx - 350, 50, prompt, c_black, c_black, c_black, c_black, 1);
	}
	
	surface_reset_target();
	draw_surface(promptsurface, SCREEN_WIDTH - 610, 0);
	draw_set_align();
	
	if global.hud == HUD_STYLES.final
		scr_panicdraw();
	else
		scr_panicdraw_old();
}
