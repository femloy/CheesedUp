function scr_cameradraw_mini()
{
	if live_call() return live_result;
	
	static timeattack_trans = 0;
	if global.timeattack
		timeattack_trans = Approach(timeattack_trans, 1, 0.05);
	else
		timeattack_trans = 0;
	
	static score_prev = 0;
	static score_hurt = 0;
	
	var pad = round(global.minimal_pad * 50);
	
	// setup
	var player = obj_player1;
	var hide = (((MOD.Mirror && player.x > SCREEN_WIDTH - 150) or (!MOD.Mirror && player.x < 150)) && player.y < 100) or manualhide;
	hud_posY = Approach(hud_posY, hide * -200, 15);
	
	// figure out score
	draw_set_font(global.minimal_number);
	
	var cs = 0;
	with obj_comboend
		cs += comboscore;
	with obj_particlesystem
	{
		for (var i = 0; i < ds_list_size(global.collect_list); i++)
			cs += ds_list_find_value(global.collect_list, i).value;
	}
	
	var collect = max(global.collect - global.comboscore - cs, 0);
	var collect_str = string(collect); 
	
	if collect < 10
		collect_str = concat("0", collect_str);
	if collect < 100
		collect_str = concat("0", collect_str);
	if collect < 1000
		collect_str = concat("0", collect_str);
	
	var xx = 24 + pad, yy = 16 + hud_posY + pad;
	var rx = xx, ry = yy + 6;
	
	// rank bubble
	if !global.timeattack or timeattack_trans < 1
	{
		if global.minimal_rankspot == 1
		{
			rx = xx + string_width(collect_str) + 15;
			ry = yy + 10;
		}
		scr_rankbubbledraw(rx, lerp(ry, -50, timeattack_trans));
		
		// score
		draw_set_align();
	
		if score_prev != collect
		{
			if collect < score_prev && (global.panic or player.state == states.hurt)
				score_hurt += ceil((score_prev - collect) / 10);
			score_prev = collect;
		}
	
		if score_hurt > 0
		{
			score_hurt = Approach(min(score_hurt, 10), 0, 0.1);
			pal_swap_set(spr_numpalette_minimal, min(score_hurt, 1));
			collect_shake = score_hurt;
		}
	
		for(var i = 1; i <= string_length(collect_str); i++)
		{
			var sh = random_range(-collect_shake, collect_shake) / 2, sv = random_range(-collect_shake, collect_shake) / 2;
			draw_text(xx + sh + ((i - 1) * 18), lerp(yy, -50, timeattack_trans) + sv, string_char_at(collect_str, i));
		}
		pal_swap_reset();
	}
	
	// bullet and chainsaw
	var bx = xx, by = yy + lerp(25, 0, timeattack_trans);
	if player.character != "S" && player.character != "V" && !player.isgustavo
	{
		if global.shootstyle == SHOOT_STYLES.pistol
		{
			var spr = spr_bullet_minimal, pad = 2;
			switch player.character
			{
				case "N":
					spr = spr_bomb_minimal;
					pad = -2;
					break;
			}
			bx = scr_draw_fuel(bx, by, spr, global.bullet, , pad);
		}
		if global.doublegrab == DOUBLE_STYLES.chainsaw
			bx = scr_draw_fuel(bx + 2, by - 1, spr_fuel_minimal, global.fuel);
	}
}
