image_speed = 0.5;
toppinvisible = true;

toppin[0] = 0;
toppin[1] = 0;
toppin[2] = 0;
toppin[3] = 0;
toppin[4] = 0;
createmoney[0] = false;
createmoney[1] = false;
createmoney[2] = false;
createmoney[3] = false;
createmoney[4] = false;

var yy = room_height + 121;
x = room_width / 2;
y = room_height / 2;

toppin_y[0] = yy + 150;
toppin_y[1] = yy;
toppin_y[2] = yy;
toppin_y[3] = yy;
toppin_y[4] = yy;
toppin_yscale[0] = 1;
toppin_yscale[1] = 1;
toppin_yscale[2] = 1;
toppin_yscale[3] = 1;
toppin_yscale[4] = 1;

scorewins = -4;
scorewins_show = false;
scorepos_x = 0;
scorepos_y = 0;
var timer = scr_get_timer_string(global.level_minutes, global.level_seconds);

if global.timeattack
{
	var seconds = global.tatime / 60;
	var minutes = floor(seconds / 60);
	var timer = scr_get_timer_string(minutes, seconds % 60);
	
	var seconds = floor(global.tasrank / 60);
	var minutes = floor(seconds / 60);
	seconds = seconds % 60;
	var timer_dev = concat(minutes < 10 ? "0" : "", minutes, ":", seconds < 10 ? "0" : "", seconds);
	
	text = [
		[false, concat(lstr("rank_time"), timer)],
		[false, concat(lstr("rank_devtime"), timer_dev)]
	];
}
else if !global.swapmode
{
	text = [
		[false, concat(lang_get_value("rank_highscore"), global.collect)],
		[false, concat(lang_get_value("rank_time"), timer)],
		[false, concat(lang_get_value("rank_damage"), global.player_damage)],
		[false, concat(lang_get_value("rank_combo"), global.highest_combo)]
	];
	if global.laps > 1
		array_push(text, [false, "LAPS: " + string(global.laps + 1)]);
}
else
{
	text = [
		[false, concat(lang_get_value("rank_highscore"), global.collect)],
		[false, concat(lang_get_value("rank_highscore_p1"), global.collect_player[0])],
		[false, concat(lang_get_value("rank_highscore_p2"), global.collect_player[1])],
		[false, concat(lang_get_value("rank_damage_p1"), global.swap_damage[0])],
		[false, concat(lang_get_value("rank_damage_p2"), global.swap_damage[1])],
		[false, concat(lang_get_value("rank_time"), timer)],
		[false, concat(lang_get_value("rank_combo"), global.highest_combo)]
	];
	if global.swapmode
	{
		if global.collect_player[0] >= global.collect_player[1]
			scorewins = "N";
		else
			scorewins = "P";
		draw_set_font(lang_get_font("bigfont"));
		var w1 = string_width(text[1][1]);
		var w2 = string_width(text[2][1]);
		var h = string_height(text[0][1]);
		scorepos_y = 48 + h + (h / 2) + 10;
		scorepos_x = 48 + (w1 > w2 ? w1 : w2) + 78;
	}
}

text_pos = 0;
toppin_index = 0;
toppin_state = states.jump;
toppin_buffer = 0;
brown = false;
brownfade = 0;
alarm[2] = 400;

if SUGARY_SPIRE
{
	var sugary_char = check_sugarychar();
	if sugary_char
	{
		alarm[2] = room_speed * 2;
		if global.rank == "p" or obj_endlevelfade.sugary
			alarm[2] = room_speed * 2.5;
		if global.rank == "d" or global.rank == "f"
			alarm[2] = room_speed * 4.2;
	}
}
if BO_NOISE
{
	if obj_player.character == "BN" && (global.rank == "d" or global.rank == "c" or global.rank == "b")
		alarm[2] = room_speed * 2;
}
depth = -8;

// figure out rank sprite
var char = obj_player1.character;
if char == "P" && obj_player1.character == "N"
	char = "N";
else if char == "P"
	char = "";

do
{
	var rank_spr = asset_get_index("spr_rank" + char + string_upper(global.rank));
	if sprite_exists(rank_spr)
		sprite_index = rank_spr;
	else if char != ""
		char = "";
	else
		break;
}
until sprite_exists(rank_spr);

// remix colors
var black_c = shader_get_uniform(shd_rank, "black");
var brown_c = shader_get_uniform(shd_rank, "brown");

shader_set(shd_rank);
shader_set_uniform_f(black_c, 80/255, 0, 0);
shader_set_uniform_f(brown_c, 216/255, 144/255, 96/255);

if REMIX
{
	var c = 255;
	switch global.rank
	{
		case "d":
		case "f":
			shader_set_uniform_f(black_c, 33/c, 38/c, 48/c);
			shader_set_uniform_f(brown_c, 74/c, 92/c, 116/c);
			break;
		case "c":
			shader_set_uniform_f(black_c, 0, 80/c, 0);
			shader_set_uniform_f(brown_c, 72/c, 184/c, 72/c);
			break;
		case "b":
			shader_set_uniform_f(black_c, 16/c, 112/c, 208/c);
			shader_set_uniform_f(brown_c, 184/c, 216/c, 248/c);
			break;
		case "a":
			shader_set_uniform_f(black_c, 96/c, 0, 0);
			shader_set_uniform_f(brown_c, 248/c, 168/c, 128/c);
			break;
		case "s":
			shader_set_uniform_f(black_c, 152/c, 40/c, 0);
			shader_set_uniform_f(brown_c, 248/c, 168/c, 48/c);
			break;
		case "p":
			if SUGARY_SPIRE && sugary_char
			{
				shader_set_uniform_f(black_c, 134/c, 40/c, 66/c);
				shader_set_uniform_f(brown_c, 188/c, 108/c, 143/c);
			}
			else
			{
				shader_set_uniform_f(black_c, 80/c, 0, 184/c);
				shader_set_uniform_f(brown_c, 152/c, 80/c, 248/c);
			}
			break;
	}
}
shader_reset();

// sugary spire
if SUGARY_SPIRE
{
	sugary = obj_endlevelfade.sugary;
	if sugary && obj_player1.character != "SP"
		alarm[2] += room_speed * 2.25;

	sugaryrank = -1;
	if sugary
		sugaryrank = fmod_event_create_instance("event:/modded/sugary/rankloop");

	cardimg = 0;
	event = 0;
	accel = 0;
	clipy = 809;

	colors = array_create_ext(string_length(string(global.collect)), function()
	{
		return choose(0, 1, 2, 3, 4, 5, 6);
	});

	setcolors = function(r, g, b, r2, g2, b2)
	{
		realcol = 
		{
			r: r,
			g: g,
			b: b,
			r2: r2,
			g2: g2,
			b2: b2
		};
	};
	setcolors(0, 0, 0, 0, 0, 0);

	afterimagesetup = function()
	{
		shader_set(shd_mach3effect);
		var colorblend1 = shader_get_uniform(shd_mach3effect, "color1");
		shader_set_uniform_f(colorblend1, realcol.r / 255, realcol.g / 255, realcol.b / 255);
		var colorblend2 = shader_get_uniform(shd_mach3effect, "color2");
		shader_set_uniform_f(colorblend2, realcol.r2 / 255, realcol.g2 / 255, realcol.b2 / 255);
	};
}

// wait for button
do_wait = !(SUGARY_SPIRE && sugary) && (global.timeattack or global.sandbox);
continue_state = 0;
