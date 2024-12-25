live_auto_call;

if global.hud == HUD_STYLES.minimal
	exit;
if global.timeattack
	exit;

if SUGARY_SPIRE && SUGARY
{
	var xx = SCREEN_WIDTH / 2 + 32, yy = timer_y - 50;
	
	var _tmr_spr = addseconds > 0 ? spr_sucrosetimer_gain : spr_sucrosetimer;
	draw_sprite(_tmr_spr, 1, xx, yy);
	draw_sprite(spr_sucrosetimer_lap4, 0, xx, yy);
	
	// text
	var minsx = xx - 90;
	var secx = xx - 10;
	var minsy = yy - 15;
	
	var _minutes = minutes, _seconds = seconds;
	
	if _minutes < 10
		_minutes = concat("0", _minutes);
	if _seconds < 10
		_seconds = concat("0", _seconds);
	
	_seconds = string(_seconds);
	_minutes = string(_minutes);
	
	var alpha = random_range(0.35, 0.78);
	draw_sprite_ext(spr_sucrosetimer_font, ord(string_char_at(_minutes, 1)) - ord("0"), minsx, minsy, 1, 1, 0, c_blue, alpha);
	draw_sprite_ext(spr_sucrosetimer_font, ord(string_char_at(_minutes, 2)) - ord("0"), minsx + 28, minsy, 1, 1, 0, c_blue, alpha);
			
	draw_sprite_ext(spr_sucrosetimer_font, ord(string_char_at(_seconds, 1)) - ord("0"), secx, minsy, 1, 1, 0, c_blue, alpha);
	draw_sprite_ext(spr_sucrosetimer_font, ord(string_char_at(_seconds, 2)) - ord("0"), secx + 28, minsy, 1, 1, 0, c_blue, alpha);
}
else
{
	if (addseconds <= 0)
		draw_set_font(global.wartimerfont1);
	else
		draw_set_font(global.wartimerfont2);
	
	var xx = SCREEN_WIDTH / 2;
	var yy = timer_y;
	if (obj_player.y > (room_height - 139))
		draw_set_alpha(0.3);
	else
		draw_set_alpha(1);
	
	var b = false;
	if (minutes <= 0 && seconds <= 10)
		b = true;
	
	if (!b || addseconds > 0)
		draw_sprite(spr_wartimer, (addseconds > 0) ? 1 : 0, xx, yy);
	else
		draw_sprite(spr_wartimer_panic, timer_index, xx, yy);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	
	var t = string(minutes);
	if (string_length(t) < 2)
		t = concat("0", minutes);
	var q = string(floor(seconds));
	if (string_length(q) < 2)
		q = concat("0", floor(seconds));
	
	var x2 = xx - 65;
	var y2 = yy - 57;
	for (var i = 0; i < string_length(t); i++)
		draw_text(x2 + (i * 43), y2, string_char_at(t, i + 1));
	
	x2 = xx + 51;
	for (i = 0; i < string_length(q); i++)
		draw_text(x2 + (i * 43), y2, string_char_at(q, i + 1));

	draw_set_alpha(1);
}

// lap display
if global.lap && !global.panic
{
	lap_y = Approach(lap_y, SCREEN_HEIGHT - 56, 1);
	lapflag_index += 0.35
	
	if SUGARY_SPIRE && SUGARY
		draw_lapflag(xx - 170 + 50, lap_y, lapflag_index, true);
	else
		draw_lapflag(xx - 170, lap_y, lapflag_index);
}
