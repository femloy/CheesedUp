function scr_tvdraw_old()
{
	if live_call() return live_result;
	
	var tvx = SCREEN_WIDTH - 128 + irandom_range(-obj_camera.collect_shake, obj_camera.collect_shake);
	var tvy = 74 + irandom_range(-obj_camera.collect_shake, obj_camera.collect_shake);
	
	static comboprev = 0;
	
	if tvreset != global.hud
	{
		alarm[0] = -1;
		tvreset = global.hud;
		imageindexstore = 0;
		once = false;
		yi = 600;
		showtext = false;
		tvsprite = spr_tvdefault;
		image_speed = 0.1;
	}
	
	#region SPRITE
	
	alpha = 1;
	if (instance_exists(obj_player1) && obj_player1.y < camera_get_view_y(view_camera[0]) + 200 && obj_player1.x > camera_get_view_x(view_camera[0]) + SCREEN_WIDTH - 200)
	or obj_camera.manualhide
		alpha = 0.5;
	
	if instance_exists(obj_itspizzatime)
	{
		old_hud_message(lstr("message_panic"), 200);
		tvsprite = spr_tvexit;
		image_speed = 0.25;
	}
	
	// good job you don't in fact suck
	else if instance_exists(obj_player1) && obj_player1.sprite_index == obj_player1.spr_levelcomplete
	{
		alarm[0] = 50
		tvsprite = spr_tvclap
		once = true
	}
	
	// owie moans in pain uwu
	else if instance_exists(obj_player1) && obj_player1.state == states.hurt 
	{
		if !once
			message = lstr(concat("message_hurt", choose(1, 2, 3, 4)));
		once = true
		
		old_hud_message(message, 50);
		tvsprite = spr_tvhurt
	}
	
	// skull emoji face ass
	else if instance_exists(obj_player1) && (obj_player1.state == states.timesup or obj_player1.state == states.ejected)
	{
		alarm[0] = 50
		tvsprite = spr_tvskull
	}
	
	// combo
	else if global.combo != comboprev && (tvsprite == spr_tvdefault or tvsprite == spr_tvcombo or tvsprite == spr_tvescape)
	{
		if global.combo == 0
		{
			if obj_player1.state == states.comingoutdoor
				event_perform(ev_alarm, 0);
			else
			{
				tvsprite = spr_tvcomboresult;
				image_speed = 0;
				image_index = min(comboprev, 3);
				alarm[0] = 50;
			}
		}
		else
		{
			tvsprite = spr_tvcombo;
			imageindexstore = global.combo - 1;
			
			if REMIX && !global.timeattack
				alarm[0] = 80;
		}
		comboprev = global.combo;
	}
	
	if instance_exists(obj_player1) && obj_player1.state == states.keyget
		old_hud_message(lstr("message_key"), 50); // GOT THE KEY!
	
	if global.timeattack && tvsprite == spr_tvdefault
	{
		if global.combo > 0 && global.combotime > 0
			tvsprite = spr_tvcombo;
		else
			tvsprite = spr_tvescape;
	}
	
	#endregion
	#region DRAW
	
	var sprite = tvsprite, def = spr_tvdefault, combo = spr_tvcombo;
	if SUGARY_SPIRE
	{
		var sugary = check_sugarychar();
		if sugary
		{
			var def = spr_tvdefault_ss, combo = spr_tvcombo_ss;
			sprite = SPRITES[? sprite_get_name(tvsprite) + "_ss"] ?? def;
		}
	}
	
	if global.combo > 0 && global.combotime > 0 && (tvsprite == spr_tvcombo or tvsprite == spr_tvdefault)
	{
		// combo tv
		var wd = 16 + (global.combotime / 60) * sprite_get_width(sprite);
			
		draw_sprite_part_ext(def, image_index, wd, 0, sprite_get_width(sprite), sprite_get_height(sprite), tvx + wd - sprite_get_xoffset(sprite), tvy - sprite_get_yoffset(sprite), 1, 1, c_white, alpha);
		draw_sprite_part_ext(combo, global.combo - 1, 0, 0, wd, sprite_get_height(sprite), tvx - sprite_get_xoffset(sprite), tvy - sprite_get_yoffset(sprite), 1, 1, c_white, alpha);
	}
	else
		draw_sprite_ext(sprite, image_index, tvx, tvy, 1, 1, 0, c_white, alpha);
	
	draw_set_align(fa_center);
	if tvsprite == spr_tvcombo
	{
		var comboclear = spr_tvcomboclear;
		if SUGARY_SPIRE && sugary
			comboclear = spr_tvcomboclear_ss;
		
		draw_sprite_ext(comboclear, 0, tvx, tvy, 1, 1, 0, c_white, alpha);
		draw_text_new(tvx + 20, tvy + 1, string(global.combo));
	}
	if tvsprite == spr_tvdefault
		draw_text_new(tvx - 4, tvy - 14, string(global.collect));
	draw_set_alpha(1);
	draw_set_align();
	
	// frame
	var tv_palette = global.tvcolor;
	if tv_palette == 0
 		tv_palette = (SUGARY_SPIRE && sugary) ? 4 : 0;
	if (SUGARY_SPIRE && sugary) or tv_palette != 0
	{
		pal_swap_set(spr_tv_palette, tv_palette);
		draw_sprite_ext(!(SUGARY_SPIRE && sugary) ? spr_tvempty : spr_tvempty_ss, image_index, tvx, tvy, 1, 1, 0, c_white, alpha);
		pal_swap_reset();
	}
	
	// timer
	scr_panicdraw_old();
	
	// bullets
	var showbullet = obj_player1.character != "V" && obj_player1.character != "S" && !obj_player1.isgustavo;
	
	var by = 130, bpad = 10;
	if global.shootstyle == MOD_MOVES.pistol && showbullet
		scr_draw_fuel(SCREEN_WIDTH - 180, by, spr_bulletHUD, global.bullet, 3, -3);
	if global.doublegrab == MOD_MOVES.chainsaw && showbullet
		scr_draw_fuel(SCREEN_WIDTH - 100, by, spr_fuelHUD, global.fuel, 3, -20);
	
	#endregion
}
