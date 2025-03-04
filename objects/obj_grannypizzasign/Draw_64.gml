live_auto_call;

if !global.option_hud
	exit;
if text_state == states.titlescreen && text_y <= -(text_sprite_height * text_yscale)
	exit;

draw_sprite(spr_tutorialbubble_rope, 0, 64 + text_wave_x, text_y + text_wave_y);
draw_sprite(spr_tutorialbubble_rope, 0, (SCREEN_WIDTH - 64) + text_wave_x, text_y + text_wave_y);

var xx = 32 + text_wave_x;
var yy = text_y + text_wave_y;

var extra_room = room == tower_extra or room == tower_basement;
if tip != noone
{
	if text_state == states.fall or text_state == states.normal
		tip_y = Approach(tip_y, 0, text_vsp / 4);
	else
		tip_y = Approach(tip_y, -64, 3);
	
	draw_set_font(lfnt("creditsfont"));
	var wd = sprite_get_width(spr_tutorialbubble) * text_xscale;
	var ht = sprite_get_width(spr_tutorialbubble) * text_yscale;
	scr_draw_text_arr(32 + text_wave_x + wd - tip[2] - 16, yy + ht + 8 + tip_y, tip[0]);
}

tex_x -= 0.5;
scr_draw_granny_texture(xx, yy, text_xscale, text_yscale, tex_x, tex_x);
draw_sprite_ext(spr_tutorialbubble, 1, xx, yy, text_xscale, text_yscale, 0, c_white, 1);
xx += level_xpad;

var y1 = 0;
for (var i = scroll; i < min(array_length(levelarray), scroll + 5); i++)
{
	var b = levelarray[i];
	y1 = yy + 37;
	xx = round(xx);
	if instance_exists(obj_cyop_loader) && sprite_exists(b.icon)
		draw_sprite(b.icon, 0, xx, y1);
	else
		draw_sprite(extra_room ? spr_list6 : spr_list5, b.icon, xx, y1);
	y1 += 47;
	
	if b.rank
	{
		var n = 0;
		switch b.gotrank
		{
			case "p": n = 6; break;
			case "s": n = 5; break;
			case "a": n = 4; break;
			case "b": n = 3; break;
			case "c": n = 2; break;
			case "d": n = 1; break;
		}
		
		// time attack
		var t = 0;
		switch b.timedrank
		{
			case "p": t = 6; break;
			case "s": t = 5; break;
			case "a": t = 4; break;
			case "b": t = 3; break;
			case "c": t = 2; break;
			case "d": t = 1; break;
		}
		
		var w = sprite_get_width(spr_list4) + 8;
		var x2 = xx;
		
		if t != 0
			x2 -= w / 2;
		draw_sprite(spr_list4, n, x2, y1);
		
		if t != 0
		{
			x2 += w;
			draw_sprite(spr_list8, t, x2, y1);
		}
		
		y1 += 29;
	}
	
	if b.toppins
	{
		var w = sprite_get_width(spr_list1);
		var x2 = (array_length(b.toppinarr) * w) / 2;
		x2 *= -1;
		x2 += w / 2;
		for (var j = 0; j < array_length(b.toppinarr); j++)
		{
			draw_sprite(extra_room ? spr_list7 : spr_list1, b.toppinarr[j] ? 0 : 1, xx + x2, y1);
			x2 += w;
		}
		y1 += 29;
	}
	
	if b.secrets
	{
		var secret_count = scr_secretcount(b.level);
		
		w = sprite_get_width(spr_list2);
		x2 = (secret_count * w) / 2;
		x2 *= -1;
		x2 += w / 2;
		
		for (j = 0; j < secret_count; j++)
		{
			draw_sprite(spr_list2, ((j + 1) <= b.secretcount) ? 0 : 1, xx + x2, y1);
			x2 += w;
		}
		y1 += 29;
	}
	
	if b.treasure
		draw_sprite(spr_list3, b.gottreasure ? 0 : 1, xx, y1);
	
	xx += level_xpad;
}
