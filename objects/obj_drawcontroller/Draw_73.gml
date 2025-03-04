live_auto_call;

with obj_player
{
	if state == states.backbreaker && (sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3 || sprite_index == spr_supertaunt4)
		draw_superslam_enemy();
}
if room == Mainmenu || room == Longintro || room == Realtitlescreen
{
	use_dark = false;
	kidsparty_lightning = false;
	dark_lightning = false;
}
if kidsparty_lightning || dark_lightning
{
	var cw = camera_get_view_width(view_camera[0]) + 32;
	var ch = camera_get_view_height(view_camera[0]) + 32;
	if !surface_exists(surf)
		surf = surface_create(cw, ch);
	var tsw = sprite_get_width(spr_patrol_lightgradient);
	var tsh = sprite_get_height(spr_patrol_lightgradient);
	if !surface_exists(patrolcone_tex)
	{
		patrolcone_tex = surface_create(tsw, tsh);
		var s = surface_create(tsw, tsh);
		draw_set_color(c_white);
		surface_set_target(s);
		draw_clear_alpha(0, 0);
		draw_rectangle_color(0, 0, tsw, tsh, 0, 0, 0, 0, false);
		var p = get_triangle_points(0, tsh / 2, 0, 300, 24);
		gpu_set_blendmode(bm_subtract);
		draw_triangle_color(0, tsh / 2, p[0], p[1], p[2], p[3], c_white, c_white, c_white, false);
		surface_reset_target();
		surface_set_target(patrolcone_tex);
		gpu_set_blendmode(bm_normal);
		draw_clear_alpha(0, 0);
		draw_sprite(spr_patrol_lightgradient, 0, 0, tsh / 2);
		gpu_set_blendmode(bm_subtract);
		draw_surface(s, 0, 0);
		surface_reset_target();
		surface_free(s);
		gpu_set_blendmode(bm_normal);
	}
	if kidsparty_lightning && !surface_exists(surf2)
		surf2 = surface_create(cw, ch);
	var surf_x = camera_get_view_x(view_camera[0]);
	var surf_y = camera_get_view_y(view_camera[0]);
	if kidsparty_lightning
	{
		if surface_exists(surf)
		{
			surface_set_target(surf);
			draw_clear_alpha(0, 0);
			draw_set_color(c_black);
			draw_set_alpha(1);
			draw_rectangle(0, 0, cw, ch, false);
			gpu_set_blendmode(bm_subtract);
			draw_set_color(c_white);
			with obj_patrolcone
			{
				if instance_exists(baddieID) && baddieID.state == states.walk
				{
					var points = get_triangle_points(x, y, image_angle, len, size);
					var c = c_white;
					draw_triangle_color(x - surf_x, y - surf_y, points[0] - surf_x, points[1] - surf_y, points[2] - surf_x, points[3] - surf_y, c, c, c, false);
				}
			}
			gpu_set_blendmode(bm_normal);
			draw_set_alpha(1);
			surface_reset_target();
		}
		
		if surface_exists(surf2)
		{
			surface_set_target(surf2);
			draw_clear_alpha(0, 0);
			draw_set_color(c_black);
			draw_set_alpha(1);
			draw_rectangle(0, 0, cw, ch, false);
			gpu_set_blendmode(bm_subtract);
			draw_set_color(c_white);
			with obj_patrolcone
			{
				if instance_exists(baddieID) && baddieID.state == states.walk
				{
					c = c_white;
					draw_surface_ext(other.patrolcone_tex, x - surf_x, y - surf_y - (tsh / 2), (image_angle > 90) ? -1 : 1, 1, 0, c, 1);
				}
			}
			gpu_set_blendmode(bm_normal);
			draw_surface(surf, 0, 0);
			gpu_set_blendmode(1);
			draw_set_alpha(0.3);
			with obj_patrolcone
			{
				if instance_exists(baddieID) && baddieID.state == states.walk
				{
					if collision || (instance_exists(baddieID) && baddieID.alarm[5] != -1)
					{
						c = 255;
						draw_surface_ext(other.patrolcone_tex, x - surf_x, y - surf_y - (tsh / 2), (image_angle > 90) ? -1 : 1, 1, 0, c, 1);
					}
				}
			}
			surface_reset_target();
			gpu_set_blendmode(bm_normal);
			draw_set_alpha(bg_alpha);
			draw_surface(surf2, surf_x, surf_y);
			draw_set_alpha(1);
		}
	}
	else if dark_lightning
	{
		if surface_exists(surf)
		{
			surface_set_target(surf);
			draw_clear_alpha(0, 0);
			draw_set_color(c_black);
			draw_set_alpha(0.8);
			draw_rectangle(0, 0, cw, ch, false);
			gpu_set_blendmode(bm_subtract);
			draw_set_color(c_white);
			with obj_player
			{
				if state == states.gotoplayer
					continue;
				
				var spot_size = 128;
				if room == tower_basement
					spot_size = 200;
				
				draw_set_alpha(other.circle_alpha_out);
				draw_circle(x - surf_x + smoothx + irandom_range(-1, 1), y - surf_y + irandom_range(-1, 1), spot_size + 50, false);
				
				draw_set_alpha(other.circle_alpha_in);
				draw_circle(x - surf_x + smoothx + irandom_range(-1, 1), y - surf_y + irandom_range(-1, 1), spot_size, false);
			}
			with obj_chateaulight
			{
				draw_set_alpha(circle_alpha_out);
				draw_circle(x - surf_x + irandom_range(-1, 1), (y - surf_y) + irandom_range(-1, 1), circle_size_out, false);
				draw_set_alpha(circle_alpha_in);
				draw_circle(x - surf_x + irandom_range(-1, 1), (y - surf_y) + irandom_range(-1, 1), circle_size_in, false);
			}
			gpu_set_blendmode(bm_normal);
			draw_set_alpha(1);
			surface_reset_target();
			draw_surface(surf, surf_x, surf_y);
		}
	}
}
if MOD.Spotlight && room != timesuproom
{
	if !surface_exists(surf)
		surf = surface_create(SCREEN_WIDTH, SCREEN_HEIGHT);
	surface_set_target(surf);
	
	draw_clear(c_black);
	gpu_set_blendmode(bm_subtract);
	
	var draw_spotlight = function(who = obj_player, size = 100, xo = 0, yo = 0, iter = 2)
	{
		var camx = camera_get_view_x(view_camera[0]);
		var camy = camera_get_view_y(view_camera[0]) - (IT_camera_yoffset() * global.combotime / 60);
		
		with who
		{
			/*
			var size_real = size;
			for(var i = 0; i < iter; i++)
			{
				if i > 0
					size_real += 20 / (i / 3);
				
				draw_set_alpha(1 / (i + 1));
				draw_circle(x + xo - camx + random_range(-1, 1), y + yo - camy + random_range(-1, 1), size_real, false);
			}
			*/
			
			var xx = x + xo - camx;
			draw_set_alpha(1);
			draw_circle(xx + random_range(-1, 1), y + yo - camy + random_range(-1, 1), size, false);
			draw_set_alpha(0.35);
			draw_circle(xx + random_range(-1, 1), y + yo - camy + random_range(-1, 1), size + 30, false);
		}
	}
	if instance_exists(obj_endlevelfade) or room == rank_room
		spotlight_size = Approach(spotlight_size, 960, 10);
	else
		spotlight_size = lerp(spotlight_size, lerp(50, 300, global.combotime / 60), 0.2);
	
	if !(instance_exists(obj_technicaldifficulty) && obj_player1.state == states.actor)
		draw_spotlight(obj_player1, spotlight_size, obj_player1.smoothx);
	
	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);
	draw_set_colour(c_white);
	
	surface_reset_target();
	draw_surface(surf, CAMX, CAMY);
}
