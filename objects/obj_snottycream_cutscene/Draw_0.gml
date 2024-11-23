live_auto_call;

if con == 7
{
	var xx = room_width / 2, yy = room_height / 2;
	draw_sprite(spr_greenandvigimakeamends, 0, xx + random_range(-shake, shake), yy + random_range(-shake, shake));
	
	var snotx = random_range(-shake * 2, shake * 2), snoty = random_range(-shake * 2, shake * 2);
	draw_sprite(spr_greenandvigimakeamends, 1, xx + snotx, yy + snoty);
	draw_sprite(spr_greenandvigimakeamends, 2, xx + random_range(-shake * 2, shake * 2), yy + random_range(-shake * 2, shake * 2));
	draw_sprite(spr_greenandvigimakeamends, 3, xx + snotx, yy + snoty);
}

draw_set_colour(c_white);
draw_set_alpha(fade);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);
