if instance_exists(obj_loadingscreen)
	exit;

if global.inputdisplay && keyalpha > 0
{
	scr_getinput(true);
	
	var _camx = CAMX;
	var _camy = CAMY;
	
	x = pos[0];
	y = pos[1];
	
	if !surface_exists(surf)
		surf = surface_create(maxx, maxy);
	
	surface_set_target(surf);
	draw_set_alpha(1);
	draw_clear_alpha(c_black, 0);

	// dont block the view
	var left = x, right = x + maxx, top = y, bottom = y + maxy;
	
	image_alpha = keyalpha;
	if instance_exists(obj_player1)
	{
		var px = obj_player1.x - _camx, py = obj_player1.y - _camy;
		if px >= left - 25 && px <= right + 25
		&& py >= top - 50 && py <= bottom + 25
			image_alpha = min(keyalpha, 0.5);
	}
	
	// draw it
	draw_inputdisplay(0, 0);
	surface_reset_target();
	
	// draw result
	draw_surface_ext(surf, x, y, 1, 1, 0, c_white, image_alpha);
	
	// customize
	var mx = mouse_x_gui, my = mouse_y_gui;
	if mx >= left && mx <= right && my >= top && my <= bottom
	{
		if mouse_check_button_pressed(mb_left) && !drag
		{
			drag = true;
			dragoffset = [pos[0] - mx, pos[1] - my];
		}
		draw_set_alpha(1);
		draw_set_colour(drag ? c_red : merge_colour(c_blue, c_aqua, 0.75));
		draw_rectangle(left, top, right - 1, bottom - 1, true);
	}
	if !mouse_check_button(mb_left)
		drag = false;
	
	if drag
	{
		pos[0] = mx + dragoffset[0];
		pos[1] = my + dragoffset[1];
		
		with obj_shell
			WC_drag_inst = noone;
	}
	pos[0] = clamp(pos[0], keysep, SCREEN_WIDTH - maxx - keysep);
	pos[1] = clamp(pos[1], keysep, SCREEN_HEIGHT - maxy - keysep);
}
else if surface_exists(surf)
	surface_free(surf);
