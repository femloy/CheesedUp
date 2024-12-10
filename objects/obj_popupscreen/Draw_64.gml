live_auto_call;

if pause && sprite_exists(screensprite)
{
	draw_sprite(screensprite, 0, 0, 0);
	if sprite_exists(screensprite2) && REMIX
		draw_sprite_ext(screensprite2, 0, 0, 0, 1, 1, 0, c_white, bg_alpha);
}

// stacked popups
with obj_popupscreen
{
	if self.id != other.id && other.depth > depth
	{
		if other.state == 1 or other.state == 0
		{
			other.t = 0;
			other.state = 0;
		}
		exit;
	}
}

ensure_surface(0, 960, 540);
surface_set_target(surfaces[0]);
draw_clear_alpha(c_black, 0);

// The usual pto roundrect
var size = animcurve_channel_evaluate(state == 0 ? anim_outback : anim_incubic, t);
draw_set_colour(c_black);

var rect_xpad = 64 * size;
var rect_ypad = 48 * size;
var rect_width = (960 / 2) * (1 - size);
var rect_height = (540 / 2) * (1 - size);
var rect_outline_size = 5;
var rect_radius = 16;

draw_set_alpha(0.95);
draw_roundrect_ext(rect_xpad + rect_width, rect_ypad + rect_height,
	960 - rect_xpad - rect_width, 540 - rect_ypad - rect_height,
	rect_radius, rect_radius, false
);

gpu_set_blendmode(bm_subtract);
draw_set_alpha(0.1);
draw_roundrect_ext(
	rect_xpad + rect_width + rect_outline_size, rect_ypad + rect_height + rect_outline_size,
	960 - rect_xpad - rect_width - rect_outline_size, 540 - rect_ypad - rect_height - rect_outline_size,
	rect_radius, rect_radius, false
);

gpu_set_blendmode(bm_normal);
draw_set_alpha(1);

// Draw it
surface_reset_target();
var xx = (SCREEN_WIDTH - 960) / 2;
var yy = (SCREEN_HEIGHT - 540) / 2;
draw_surface(surfaces[0], xx, yy);

// Box content
if t >= 1
{
	switch type
	{
		case 0:
			// Reconnecting
			if !instance_exists(obj_netclient)
				break;
		
			draw_set_align(fa_center);
		
			draw_set_colour(c_white);
			draw_set_font(lang_get_font("creditsfont"));
		
			var time = 1 - (obj_netclient.alarm[1] / (obj_netclient.heart_delay * room_speed));
			draw_text(xx + 960 / 2, yy + 100, concat("Reconnecting", string_copy("...", 1, floor((time + 0.1) * 3))));
			
			draw_set_font(lfnt("font_small"));
			draw_text(xx + 960 / 2, yy + 220, "PTT lost connection to the servers.\nPlease wait while the connection is re-established.");
			if global.leveltosave != noone
				draw_text_color(xx + 960 / 2, yy + 220, "\n\nYou will be kicked out of the current level.", #ff3333, #ff3333, #ff3333, #ff3333, 1);
			
			if pto_button(xx + 960 / 2 - 100, yy + 380, 200, , true, , , "Log out") == 2
			{
				sound_play("event:/modded/sfx/diagcancel");
				state = 2;
				
				on_close = function()
				{
					instance_destroy(obj_netclient);
					with obj_pause
					{
						hub = false;
						instance_destroy(obj_cyop_loader);
						
						event_perform(ev_alarm, 3);
						pause = false;
						fadein = false;
					}
				}
			}
			break;
		case 1:
			if !instance_exists(obj_netclient)
				break;
		
			draw_set_align(fa_center);
		
			draw_set_colour(c_white);
			draw_set_font(lang_get_font("creditsfont"));
		
			var time = 1 - (obj_netclient.alarm[1] / (obj_netclient.heart_delay * room_speed));
			draw_text(xx + 960 / 2, yy + 100, concat("Logging In", string_copy("...", 1, floor((time + 0.1) * 3))));
			
			draw_set_font(lfnt("font_small"));
			draw_text(xx + 960 / 2, yy + 220, "Please log in using the Discord link opened in your browser.");
				
			if pto_button(xx + 960 / 2 - 250, yy + 380, 200, , true, , , "Cancel") == 2
			{
				sound_play("event:/modded/sfx/diagcancel");
				state = 2;
				
				on_close = function()
				{
					instance_destroy(obj_netclient);
					with obj_pause
					{
						hub = false;
						instance_destroy(obj_cyop_loader);
						
						event_perform(ev_alarm, 3);
						pause = false;
						fadein = false;
					}
				}
			}
			
			if pto_button(xx + 960 / 2 + 50, yy + 380, 200, , true, , , "Retry") == 2
			{
				sound_play("event:/modded/sfx/diagcancel");
				net_url_open(obj_netclient.verify_url);
			}
			break;
	}
	if callback_buffer > 0
		callback_buffer--;
}
