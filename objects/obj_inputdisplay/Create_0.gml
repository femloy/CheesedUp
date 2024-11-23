version = 2;

defaultkeys = function()
{
	inputkeys = [
		{x : 0, y : 0, key : "Z", keyw : 1, keyh : 1}, 
		{x : 1, y : 0, key : "UP", keyw : 1, keyh : 1}, 
		{x : 2, y : 0, key : "X", keyw : 1, keyh : 1}, 
		{x : 0, y : 1, key : "LEFT", keyw : 1, keyh : 1}, 
		{x : 1, y : 1, key : "DOWN", keyw : 1, keyh : 1}, 
		{x : 2, y : 1, key : "RIGHT", keyw : 1, keyh : 1}, 
		{x : 0, y : 2, key : "SHIFT", keyw : 2, keyh : 1}, 
		{x : 2, y : 2, key : "C", keyw : 1, keyh : 1}, 
		{x : 3, y : 2, key : "A", keyw : 1.5, keyh : 1}, 
		{x : 3, y : 1, key : "V", keyw : 1.5, keyh : 1}
	];
	
	keysep = 4;
	keysize = 42;
	keyalpha = 0.6;
	
	pos[0] = keysep;
	pos[1] = (SCREEN_HEIGHT - keysize * 3) - keysep * 3;
	
	pressedcol = merge_colour(c_blue, c_aqua, 0.75);
	resizekeys();
}
savekeys = function()
{
	file = file_text_open_write(game_save_id + "inputdisplay");
	
	file_text_write_real(file, version); // version
	file_text_writeln(file);
	file_text_write_real(file, pos[0]);
	file_text_writeln(file);
	file_text_write_real(file, pos[1]);
	file_text_writeln(file);
	file_text_write_real(file, keysep);
	file_text_writeln(file);
	file_text_write_real(file, keysize);
	file_text_writeln(file);
	file_text_write_real(file, keyalpha);
	file_text_writeln(file);
	file_text_write_real(file, pressedcol);
	file_text_writeln(file);
	file_text_write_string(file, json_stringify(inputkeys));
	
	file_text_close(file);
	
	with obj_savesystem
	{
		showicon = true;
		icon_alpha = 2;
	}
}
loadkeys = function()
{
	var reset = false;
	file = file_text_open_read(game_save_id + "inputdisplay");
	
	var v = file_text_read_real(file);
	if v != version
	{
		trace("Inputdisplay version mismatch - v: ", v, " version: ", version);
		reset = true;
	}
	else try
	{
		file_text_readln(file);
		pos[0] = file_text_read_real(file);
		file_text_readln(file);
		pos[1] = file_text_read_real(file);
		file_text_readln(file);
		keysep = file_text_read_real(file);
		file_text_readln(file);
		keysize = file_text_read_real(file);
		file_text_readln(file);
		keyalpha = file_text_read_real(file);
		file_text_readln(file);
		pressedcol = file_text_read_real(file);
		file_text_readln(file);
		inputkeys = json_parse(file_text_read_string(file));
	}
	catch (e)
	{
		trace(e);
		reset = true;
	}
	if !is_array(inputkeys)
	{
		trace($"inputkeys is not array - {inputkeys}");
		reset = true;
	}
	
	if reset
	{
		show_message("The input display settings have been reset.");
		
		defaultkeys();
		savekeys();
	}
	resizekeys();
	
	file_text_close(file);
}
resizekeys = function()
{
	if surface_exists(surf)
		surface_free(surf);
	
	maxx = 0;
	maxy = 0;
	
	for(var i = 0, n = array_length(inputkeys); i < n; ++i)
	{
		var k = inputkeys[i];
		
		var ughx = (k.x + k.keyw) * keysize + (k.x + k.keyw - 1) * keysep;
		var ughy = (k.y + k.keyh) * keysize + (k.y + k.keyh - 1) * keysep;
		
		maxx = max(maxx, ughx);
		maxy = max(maxy, ughy);
	}
	
	maxx++;
	maxy++;
}
draw_inputdisplay_key = function(xx, yy, keycode, width, height = width)
{
	var drawer = keycode, pressed = false, xo = 0, yo = 0;
	switch keycode
	{
		default: pressed = keyboard_check(scr_keyfromname(keycode)); break;
		
		case "SHIFT": 
			drawer = 6; 
			pressed = key_attack;
			xo = -1;
			yo = -5;
			break;
		
		case "Z": 
			drawer = 4; 
			pressed = key_jump2;
			yo = -6;
			xo = -1;
			break;
		case "X": 
			drawer = 5;
			pressed = key_slap;
			xo = -6;
			yo = -6;
			break;
		case "C": 
			drawer = 7; 
			pressed = key_taunt;
			xo = -2;
			break;
		case "A": 
			drawer = 8; 
			pressed = key_shoot;
			yo = -6;
			break;
		case "V": 
			drawer = 9; 
			pressed = key_chainsaw; 
			yo = -5;
			break;
		
		case "UP": 
			drawer = 0;
			pressed = key_up;
			xo = -2;
			yo = 2;
			break;
		case "DOWN": 
			drawer = 1; 
			pressed = key_down;
			xo = -2;
			yo = -2;
			break;
		case "LEFT": 
			drawer = 3; 
			pressed = -key_left; 
			xo = 2;
			yo = -2;
			break;
		case "RIGHT": 
			drawer = 2;
			pressed = key_right;
			xo = -2;
			yo = -2;
			break;
	}
	
	// square
	draw_set_colour(pressed ? pressedcol : c_ltgray);
	draw_roundrect(xx, yy, xx + width - 1, yy + height - 1, false);
	
	draw_set_colour(c_black);
	draw_roundrect(xx, yy, xx + width - 1, yy + height - 1, true);
	
	// text
	if is_string(drawer)
	{
		draw_set_colour(c_white);
		draw_set_font(lang_get_font("bigfont"));
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		
		var siz = 1;
		var _stringwidth = string_width(drawer);
		
		siz = (width - 16) / _stringwidth;
		if siz > 1
			siz = max(floor(siz / 2), 1);
	
		if siz != 1
			draw_text_transformed(floor(xx + width / 2), floor(yy + height / 2), drawer, siz, siz, 0);
		else
			draw_text(floor(xx + width / 2), floor(yy + height / 2), drawer);
	
		draw_set_valign(fa_top);
	}
	else
	{
		siz = (width - 16) / 32;
		if siz > 1
			siz = max(floor(siz / 2), 1);
		draw_sprite_ext(spr_controlicons, drawer, xo + floor(xx + width / 2), yo + floor(yy + height / 2), siz, siz, 0, c_white, 1);
		gpu_set_blendmode(bm_normal);
		
	}
}
draw_inputdisplay = function(xdraw, ydraw)
{
	for(var i = 0, n = array_length(inputkeys); i < n; ++i)
	{
		var k = inputkeys[i];
		var xx = k.x * keysize + k.x * keysep;
		var yy = k.y * keysize + k.y * keysep;
		draw_inputdisplay_key(xdraw + xx, ydraw + yy, k.key, k.keyw * keysize + (k.keyw - 1) * keysep, k.keyh * keysize + (k.keyh - 1) * keysep);
	}
}

clicktimer = 0;
drag = false;
dragoffset = [0, 0];

depth = -10000;

surf = -1;
inputkeys = [];
pos = [0, 0];

if !file_exists(game_save_id + "inputdisplay")
{
	defaultkeys();
	savekeys();
}
else
{
	loadkeys();
	
	if pos[0] < 0 or pos[1] < 0 or !is_array(inputkeys) or array_length(inputkeys) == 0
	{
		trace("Inputdisplay failed loading");
		
		defaultkeys();
		savekeys();
	}
}
