live_auto_call;

if con == 0
	draw_sprite(spr_elevatoropen, 0, elevator_x - CAMX, elevator_y - CAMY);

draw_set_alpha(fade);
draw_set_color(c_black);
draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
draw_set_alpha(1);
