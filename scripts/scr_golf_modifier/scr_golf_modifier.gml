function scr_golfball_y()
{
	return bbox_bottom - 17;
}

function scr_golfball_update()
{
	if live_call() return live_result;
	
	// state machine
	switch state
	{
		default:
			state = states.normal;
			hurted = false;
			flash = false;
			
			
			break;
		case states.debugstate:
		case states.door:
		case states.hurt:
			return false;
	}
	
	// go
	if mouse_check_button(mb_left)
	{
		var dir = point_direction(mouse_x, mouse_y, x, scr_golfball_y());
		angle = dir;
	}
	if mouse_check_button_released(mb_left)
	{
		var vel = min(point_distance(x, scr_golfball_y(), mouse_x, mouse_y) / 10, 24);
		var dir = point_direction(mouse_x, mouse_y, x, scr_golfball_y());
		
		hsp = lengthdir_x(vel, dir);
		vsp = lengthdir_y(vel, dir);
	}
	
	// collision
	var rad = 14;
	var bounce = 0.4;
	
	repeat abs(vsp)
	{
		if !collision_circle(x, scr_golfball_y() + sign(vsp), rad, obj_solid, true, true)
			y += sign(vsp);
		else
		{
			vsp *= -bounce;
			break;
		}
	}
	repeat abs(hsp)
	{
		if !collision_circle(x + sign(hsp), scr_golfball_y(), rad, obj_solid, true, true)
			x += sign(hsp);
		else
		{
			hsp *= -bounce;
			break;
		}
	}
	
	if vsp < 20
		vsp += grav;
	grounded = collision_line(x, scr_golfball_y(), x, scr_golfball_y() + rad + 1, obj_solid, true, true) ? true : false;
	
	var bottom = collision_circle(x, scr_golfball_y() + 1, rad, obj_solid, true, true);
	if !grounded && bottom
	{
		hsp += x > bottom.bbox_right ? 1 : -1;
	}
	
	if grounded
	{
		angle -= floor(abs(hsp)) * sign(hsp);
		hsp *= 0.99;
	}
	if hsp != 0
		xscale = sign(hsp);
	
	return true;
}
function scr_golfball_draw()
{
	if live_call() return live_result;
	
	var spr = spr_golfheadP;
	var img = 0;
	
	if mouse_check_button(mb_left)
	{
		var vel = min(point_distance(x, scr_golfball_y(), mouse_x, mouse_y) / 10, 24) * 10;
		var dir = point_direction(x, scr_golfball_y(), mouse_x, mouse_y);
		
		shader_reset();
		draw_set_colour(merge_color(c_red, c_lime, abs(sin(current_time / 200))));
		draw_line_width(x, scr_golfball_y(), x + lengthdir_x(vel, dir), scr_golfball_y() + lengthdir_y(vel, dir), 3);
	}
	
	pal_swap_player_palette(spr, img, 1, 1);
	draw_sprite_ext(spr, img, x, scr_golfball_y(), 1, 1, angle, c_white, 1);
	
	draw_sprite_ext(spr_skinchoicehand, 0, mouse_x, mouse_y, -1, 1, 0, c_white, 1);
	
	return true;
}
