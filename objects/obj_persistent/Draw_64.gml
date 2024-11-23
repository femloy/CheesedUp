live_auto_call;

// old text event
if global.hud == hudstyles.old
{
	with obj_tv
	{
		draw_set_font(lang_get_font("bigfont"));
		draw_set_align(fa_center, fa_bottom);
		draw_set_color(c_white);
	
		xi = (SCREEN_WIDTH / 2) + random_range(1, -1);
		if showtext
			yi = Approach(yi, SCREEN_HEIGHT - 8, 5);
		else
			yi = Approach(yi, SCREEN_HEIGHT + 60 + (string_height(message) - 16), 1);
	
		draw_text_new(xi, yi, string(message));
	}
}

// fps count
if global.showfps && global.option_hud
&& (!instance_exists(obj_version) or instance_exists(obj_option))
&& !instance_exists(obj_disclaimer) && !instance_exists(obj_loadingscreen)
{
	draw_set_font(global.smallfont);
	draw_set_colour(c_white);
	draw_set_align(fa_right, fa_bottom);
	
	var xx = SCREEN_WIDTH - string_width("A");
	var yy = SCREEN_HEIGHT - 8;
	
	if global.option_timer && !(room == Realtitlescreen || room == Longintro || room == Finalintro || room == Mainmenu || room == hub_loadingscreen || room == Creditsroom || room == Johnresurrectionroom || room == rank_room || instance_exists(obj_titlecard) || !global.option_hud
	|| room == characterselect || room == editor_entrance or instance_exists(obj_swapunlocked)) && (!safe_get(obj_pause, "pause") or global.option_speedrun_timer)
	{
		yy -= string_height("A");
		if global.option_timer_type == 2
			yy -= string_height("A");
	}
	if instance_exists(obj_version)
		yy -= string_height("A") * 2;
	
	draw_text_transformed(xx, yy, string(fps), 1, 1, 0);
}
draw_set_align();

// the good meter
if global.goodmode
{
	draw_set_colour(c_white);
	draw_set_align(fa_center);
	draw_set_font(lang_get_font("font_small"));
	draw_text(SCREEN_WIDTH / 2 + random_range(-multiplier, multiplier), 32 + random_range(-multiplier, multiplier), concat("Good Mode ", multiplier, "x"));
}

// gif
if DEBUG && keyboard_check_pressed(vk_f11)
{
	gif_record = !gif_record;
	if gif_record
		gif_image = gif_open(SCREEN_WIDTH, SCREEN_HEIGHT);
	else
	{
		gif_save(gif_image, $"screenshots/{DATE_TIME_NOW}.gif");
		if !window_get_fullscreen()
			launch_external($"explorer.exe \"{game_save_id}screenshots\\\"");
	}
}
if gif_record
{
	gif_add_surface(gif_image, application_surface, 2);
	
	draw_set_colour(c_red);
	draw_set_align(fa_center);
	draw_set_font(global.font_small);
	draw_text(SCREEN_WIDTH / 2, 32, "Recording GIF");
}

// global message
if gotmessage.time != -1
{
	// black overlay
	draw_set_colour(c_black);
	draw_set_alpha(0.25);
	draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
	
	// prepare text
	draw_set_alpha(1);
	draw_set_colour(c_white);
	tdp_draw_set_font(lfnt("font_small"));
	
	// person says...
	tdp_draw_set_align(fa_center, fa_middle);
	if is_string(gotmessage.author)
		tdp_draw_text(SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2) - 20, concat(embed_value_string(lstr("global_message_says"), [gotmessage.author]), "\n"));
	else
		tdp_draw_text(SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2) - 20, concat(lstr("global_message"), "\n"));
	
	// message
	var msgstr = gotmessage.message;
	if !is_string(msgstr)
		msgstr = "(error)";
	draw_text_ext_transformed((SCREEN_WIDTH / 2) + random_range(-1, 1), SCREEN_HEIGHT / 2, "\n" + msgstr, 16, SCREEN_WIDTH / 2, 2, 2, 0);
	
	tdp_text_commit();
	
	// reset align
	draw_set_align();
	gotmessage.time--;
}

if !DEBUG
{
	with obj_player
	{
		if !visible
			break;
		if character == "MS"
		{
			toggle_alphafix(false);
		
			draw_set_color(c_white);
			var xx = x - CAMX;
			var yy = y - CAMY;
		
			var dir = (-current_time) % 360;
			var dis1 = 50, dis2 = 150;
			draw_arrow(xx + lengthdir_x(dis2, dir), yy + lengthdir_y(dis2, dir), xx + lengthdir_x(dis1, dir), yy + lengthdir_y(dis1, dir), 20);
		
			draw_sprite_ext(spr_uparrow, 0, xx - Wave(100, 150, 1, 0), yy, 1, 1, -90, c_white, 1);
		
			draw_set_font(lang_get_font("font_small"));
			draw_set_align(fa_center);
			draw_text(xx + random_range(-3, 3), yy - 120 + random_range(-3, 3), "DOGSHIT SPRITES!");
		
			draw_set_colour(c_red);
		
			if (current_time / 10) % 100 > 50
			{
				var rad = 100;
				repeat 5
				{
					draw_circle(xx, yy, rad, true);
					rad--;
				}
			}
		
			toggle_alphafix(true);
		}
	}
}
