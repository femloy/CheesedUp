/*
	actually just a generic background effect handler.
	runs all the time, regardless of panic.
*/

// setup
function scr_panicbg_generic()
{
	//if live_call() return live_result;
	
	// finds start and end layers
	var lay_last = noone, d = undefined;
	var backs = room_get_bg_layers();
	
	for(var i = 0, n = array_length(backs); i < n; ++i)
	{
		var lay = backs[i].layer_id;
		var dep = layer_get_depth(lay);
		
		if dep > 0 && backs[i].bg_sprite != bg_etbbrick && layer_get_visible(lay)
		{
			layer_script_begin(lay, scr_panicbg_start);
			layer_script_end(lay, scr_panicbg_end);
			
			if d == undefined or dep < d
			{
				d = dep;
				lay_last = lay;
			}
		}
	}
	
	if lay_last != noone
		layer_script_end(lay_last, scr_panicbg_draw);
}
function scr_panicbg_init()
{
	//if live_call() return live_result;
	
	if room != rank_room && room != timesuproom
		scr_panicbg_generic();
}

// draw
global.panicbg_surface = noone;
function scr_panicbg_start()
{
	//if live_call() return live_result;
	
	if event_type == ev_draw && event_number == 0
	{
		// set up surface
		if PANIC && global.leveltosave != "sucrose" && global.panicbg && !safe_get(obj_pause, "pause")
		{
			if !surface_exists(global.panicbg_surface)
				global.panicbg_surface = surface_create(SCREEN_WIDTH, SCREEN_HEIGHT);
			else if surface_get_width(global.panicbg_surface) != SCREEN_WIDTH
			or surface_get_height(global.panicbg_surface) != SCREEN_HEIGHT
				surface_resize(global.panicbg_surface, SCREEN_WIDTH, SCREEN_HEIGHT);
			
			surface_set_target(global.panicbg_surface);
		}
		else if surface_exists(global.panicbg_surface)
			surface_free(global.panicbg_surface);
		
		if instance_exists(obj_wartimer)
			warbg_start();
	}
}

function scr_panicbg_draw()
{
	//if live_call() return live_result;
	
	var panic = PANIC && global.panicbg && global.leveltosave != "sucrose";
	if event_type == ev_draw && event_number == 0 && !safe_get(obj_pause, "pause")
	{
		// chunk bg
		with obj_backgroundreplace
			event_user(0);
		
		if instance_exists(obj_wartimer)
			warbg_end();
		
		// grinch bg
		if string_starts_with(room_get_name(room), "grinch_") && room != grinch_10
		{
			shader_set(shd_wind);
			var uTime = shader_get_uniform(shd_wind, "Time");
			shader_set_uniform_f(uTime, scr_current_time() / 1000);
			
			var xx = CAMX * 0.25, yy = CAMY * 0.25;
			if panic
			{
				xx -= CAMX;
				yy -= CAMY;
			}
			
			draw_sprite_tiled(bg_grinch_santa, 0, xx, yy);
			shader_reset();
		}
		
		// panicbg shader
		if panic
		{
			surface_reset_target();
			
			shader_set(shd_panicbg);
			var panic_id = shader_get_uniform(shd_panicbg, "panic");
			shader_set_uniform_f(panic_id, clamp(global.wave / global.maxwave, -0.5, 1));
			var time_id = shader_get_uniform(shd_panicbg, "time");
			shader_set_uniform_f(time_id, (scr_current_time() / 1000) % (pi * 6));
			
			reset_blendmode();
			draw_surface(global.panicbg_surface, CAMX, CAMY);
			gpu_set_blendmode(bm_normal);
			
			if !global.goodmode
				shader_reset();
		}
	}
}
function scr_panicbg_end()
{
	//if live_call() return live_result;
	
	if event_type == ev_draw && event_number == 0
	&& PANIC && global.leveltosave != "sucrose" && global.panicbg && !safe_get(obj_pause, "pause")
		surface_reset_target();
	
	if instance_exists(obj_wartimer)
		warbg_end();
}
