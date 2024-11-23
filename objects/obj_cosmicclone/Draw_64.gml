live_auto_call;

if room == rank_room
	exit;

draw_sprite_ext(spr_vignette, 0, 
	-SCREEN_WIDTH / 2, -SCREEN_HEIGHT / 2,
	get_screen_xscale() * 2, get_screen_yscale() * 2,
	0, #280040, 1);
