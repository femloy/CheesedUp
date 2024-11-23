live_auto_call;

menus[menu_sel].drawer();

draw_set_font(lfnt("bigfont"));
draw_set_color(c_white);
draw_set_align(fa_left, fa_middle);

var opts = menus[menu_sel].options;
for(var i = 0; i < array_length(opts); i++)
{
	var this = opts[i];
	switch this.type
	{
		case 0:
			var x1 = this.x - this.rect_size[0] / 2, y1 = this.y - this.rect_size[1] / 2;
			var x2 = this.x + this.rect_size[0] / 2, y2 = this.y + this.rect_size[1] / 2;
			
			draw_set_alpha(abs(sin(current_time / 300)) * 0.35);
			draw_rectangle(x1, y1, x2, y2, false);
			draw_set_alpha(1);
			
			if sel == i
				target_cursor = [x1, y1, x2, y2];
			break;
		
		case 1:
			if this.auto
			{
				this.x = SCREEN_WIDTH / 2;
				this.y = SCREEN_HEIGHT / 2;
			}
			
			var xpad = 250;
			
			var col = sel == i ? c_white : c_gray;
			tdp_draw_text_color(this.x - xpad, this.y, this.text, col, col, col, col, 1);
			
			var w = 200;
			var value = this.value_func();
			
			var xx = this.x + xpad - 220, yy = this.y - 14;
			draw_sprite_ext(spr_slider, 0, xx, yy, 1, 1, 0, col, 1);
			draw_sprite_ext(spr_slidericon2, 0, xx + w * value, yy, 1, 1, 0, col, 1);
			
			if sel == i
				target_cursor = [SCREEN_WIDTH / 2 - xpad - 4, this.y - string_height(this.text) / 2 + 4, SCREEN_WIDTH / 2 + xpad + 4, this.y + string_height(this.text) / 2 + 4];
			break;
	}
}
tdp_text_commit();

if sel == -1
{
	draw_set_alpha(0.35);
	draw_rectangle_color(0, 0, SCREEN_WIDTH, 92, 0, 0, 0, 0, 0);
	draw_set_alpha(1);
	
	draw_set_font(lfnt("creditsfont"));
	draw_set_align(fa_center);
	
	var center = SCREEN_WIDTH / 2;
	for(var i = 0, n = array_length(menus); i < n; i++)
	{
		var sep = n * 50;
		var col = menu_sel == i ? c_white : c_gray;
		
		var xx = n <= 1 ? center : lerp(center - sep, center + sep, i / (n - 1));
		var yy = 20;
		var str = menus[i].name;
		tdp_draw_text_color(xx, yy, str, col, col, col, col, 1);
		
		if menu_sel == i
			target_cursor = [xx - string_width(str) / 2 - 4, yy + 4, xx + string_width(str) / 2 + 4, yy + string_height(str) + 4];
	}
	tdp_text_commit();
}

current_cursor[0] = lerp(old_cursor[0], target_cursor[0], cursor_time);
current_cursor[1] = lerp(old_cursor[1], target_cursor[1], cursor_time);
current_cursor[2] = lerp(old_cursor[2], target_cursor[2], cursor_time);
current_cursor[3] = lerp(old_cursor[3], target_cursor[3], cursor_time);
cursor_time = Approach(cursor_time, 1, 0.2);

draw_rectangle(current_cursor[0], current_cursor[1], current_cursor[2], current_cursor[3], true);
