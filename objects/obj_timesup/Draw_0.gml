live_auto_call;

draw_self();
if do_wait && wait <= 0
{
	wait_fade = Approach(wait_fade, 1, 0.05);
	
	draw_set_font(lfnt("creditsfont"));
	global.tdp_text_try_outline = true;
	draw_set_alpha(wait_fade);
	scr_draw_text_arr(SCREEN_WIDTH / 2 - tip1[2] / 2, SCREEN_HEIGHT - 150, tip1[0], c_white, wait_fade);
	scr_draw_text_arr(SCREEN_WIDTH / 2 - tip1[2] / 2, SCREEN_HEIGHT - 150 + 32, tip2[0], c_white, wait_fade);
	global.tdp_text_try_outline = false;
	draw_set_alpha(1);
	tdp_text_commit();
}
