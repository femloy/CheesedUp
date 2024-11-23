live_auto_call;

if !active
	exit;

if !string_pos("treasure", room_get_name(room)) && room != rank_room && room != timesuproom
{
	var xx = scr_current_time() / 30, yy = Wave(-25, 25, 5, 0);
	draw_sprite_tiled_ext(spr_intro_plotpizzafaceBG, image_index, xx + CAMX * 0.1, yy + CAMY * 0.1, 1, 1, obj_drawcontroller.use_dark ? c_black : c_white, Wave(0, 0.35, 2.5, 0));
}
