if scene == 999 && !oldintro
{
	video_set_volume((global.option_unfocus_mute && !window_has_focus()) ? 0 : global.option_master_volume);
	
	var _data = video_draw();
	var _status = _data[0];
	
	if _status == 0
	{
	    var s = _data[1];
		var w = surface_get_width(s), h = surface_get_height(s);
		var scale = SCREEN_HEIGHT / h;
		
	    draw_surface_ext(s, SCREEN_WIDTH / 2 - (w * scale) / 2, 0, scale, scale, 0, c_white, 1);
	}
}
if showtext
{
	draw_set_font(lang_get_font("creditsfont"));
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	global.tdp_text_try_outline = true;
	scr_draw_text_arr(16, SCREEN_HEIGHT - 48, text);
	global.tdp_text_try_outline = false;
	tdp_text_commit();
}
