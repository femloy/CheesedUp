live_auto_call;

if state != 0
{
	draw_set_color(c_white);
	draw_rectangle(0, 0, room_width, room_height, false);
	
	var xx = room_width / 2, yy = room_height / 2;
	draw_set_font(global.smallnumber_fnt);
	draw_set_align(fa_left);
	
	var str = string(global.pizzacoin - global.pizzacoin_earned);
	xx -= floor(string_width(str) / 2);
	
	draw_text(xx + 24, yy - 16, global.pizzacoin - global.pizzacoin_earned);
	
	draw_sprite(spr_pizzacoin, -1, xx - 16, yy - 16);
}

draw_set_color(c_white);
draw_set_alpha(fade);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);
