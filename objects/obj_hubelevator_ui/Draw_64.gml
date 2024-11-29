live_auto_call;

with elevator
{
	if state == 1 or state == 3
	{
		var curve = animcurve_channel_evaluate(state == 1 ? outback : incubic, anim_t);
	
		//var dis = CAMX - ((x + sprite_width / 2) - CAMW / 2);
		var dir = -1;
	
		var xx = x + sprite_width / 2 + (150 * dir) - CAMX, yy = y + 10 - CAMY;
		draw_sprite_ext(spr_elevatorpanel_back, 0, xx, yy, 1, curve, 0, c_white, 1);
	
		// not made for less than 3 floors
		for(var i = 0, n = array_length(hub_array); i < n; i++)
		{
			var this = hub_array[i];
			var this_x = xx, this_y = yy;
		
			var y_pos = floor(i / 2) / floor((n - 1) / 2);
			if i != n - 1 or i % 2 == 1
				this_x += lerp(28, 20, y_pos) * (i % 2 == 1 ? 1 : -1);
			this_y += lerp(-50, 75, y_pos) * curve;
		
			draw_sprite(spr_elevatorpanel_button, this.button_index, round(this_x), round(this_y));
			if room == this.target_room
				draw_sprite_ext(spr_elevatorpanel_button, sprite_get_number(spr_elevatorpanel_button) - 1, round(this_x), round(this_y), 1, 1, 0, c_white, abs(sin(current_time / 500)) / 2);
			if sel == i
				draw_sprite(spr_elevatorpanel_button, sprite_get_number(spr_elevatorpanel_button) - 2, round(this_x), round(this_y));
		}
	}
}
