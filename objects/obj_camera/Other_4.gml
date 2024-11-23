shake_camera(0, 0);
if global.coop
	camera_zoom(1, 100);
smooth_buffer = 0;

limitcam = [0, 0, room_width, room_height];
camzoom = 1;
angle = 0;
lag = -1;
lagpos = undefined;
manualhide = false;
