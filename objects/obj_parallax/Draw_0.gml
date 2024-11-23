live_auto_call;

if room_width > 16384 or room_height > 16384
	exit;
if global.performance
	exit;

if safe_get(obj_shell, "WC_oobcam") != true && room != editor_entrance
{
	var camx = camera_get_view_x(view_camera[0]), camy = camera_get_view_y(view_camera[0]);
	
	draw_reset_clip();
	draw_set_bounds(1, 1, room_width - 1, room_height - 1, false, false, true);
	draw_set_colour(c_black);
	draw_rectangle(camx, camy, max(room_width, camx + SCREEN_WIDTH) + 32, max(room_height, camy + SCREEN_HEIGHT) + 32, false);
	draw_reset_clip();
	
	/*
	//if camx < 0
		draw_rectangle(0, min(camy, -50), min(camx, -50) - 1, max(camy + SCREEN_HEIGHT, room_height + 50), false);
	//if camx > room_width - 960
		draw_rectangle(room_width, min(camy, -50), max(camx + SCREEN_WIDTH, room_width + 50), max(camy + SCREEN_HEIGHT, room_height + 50), false);
	//if camy < 0
		draw_rectangle(0, 0, room_width, min(camy, -50) - 1, false);
	//if camy > room_height - 540
		draw_rectangle(0, room_height, room_width, max(camy + SCREEN_HEIGHT, room_height + 50), false);
	*/
}
