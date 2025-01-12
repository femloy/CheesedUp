live_auto_call;

// prep
open_menu();

image_alpha = 0;
img = 0;

menu = 0;
state = 0;
fadealpha = 0;

anim_t = 0;
outback = animcurve_get_channel(curve_menu, "outback");
incubic = animcurve_get_channel(curve_menu, "incubic");
surface = -1;
clip_surface = -1;

skip_buffer = 5; // presing C again
sel = 0;

depth = -500;
image_speed = 0.35;
scr_init_input();
stickpressed = false;
con = 0;
t = 0;
buffer = 2;
sequence_layer = -1;
sequence = -1;
move_buffer = -1;
scrolltarget = 0;

width = 960 / 2.5;
height = 540 / 2.5;

select = function(sel)
{
	var sel_prev = self.sel;
	
	if sel >= array_length(options_array)
		sel = -1;
	if sel < -1
		sel = array_length(options_array) - 1;
	
	self.sel = sel;
	sound_play(sfx_step);
	
	bgprev = bgcolor;
	bgmix = 0;
	
	if sel == -1
	{
		surface_free(global.modsurf);
		if layer_exists(sequence_layer)
			layer_destroy(sequence_layer);
	}
	else if sel_prev == -1
		refresh_sequence();
	else if tv_state != 1
	{
		layer_sequence_pause(sequence);
		
		tv_img = 0;
		tv_state = 1;
	}
}

options_array = [];
global.modsurf = noone;

// simuplayer
reset_simuplayer = function()
{
	particles = [
	
	];
	simuplayer = {
		x: 960 / 2.5 / 2, y: 540 / 2.5 / 1.5, state: states.normal, hsp: 0, vsp: 0, sprite: spr_player_idle, image: 0, xscale: 1, timer: 0, move: 0, changed: false, angle: 0
	}
}
draw_simuplayer = function()
{
	var p = simuplayer;
	if p.y < -50
	{
		draw_sprite(spr_noiseicon, 0, p.x, 25);
		exit;
	}
	var width = 960 / 2.5;
	
	var xo = p.x - lengthdir_x(28, p.angle - 90);
	var yo = p.y;
	
	if xo < 50
		draw_sprite_ext(p.sprite, p.image, xo + width, yo, p.xscale, 1, p.angle, c_white, 1);
	if xo > width - 50
		draw_sprite_ext(p.sprite, p.image, xo - width, yo, p.xscale, 1, p.angle, c_white, 1);
	
	draw_sprite_ext(p.sprite, p.image, xo, yo, p.xscale, 1, p.angle, c_white, 1);
}
function draw_particles()
{
	for(var i = 0; i < array_length(particles); i++)
	{
		var p = particles[i];
		if p.img >= sprite_get_number(p.sprite) - 1
		{
			array_delete(particles, i, 1);
			i--;
			continue;
		}
		p.img += p.imgspeed;
		p.x += p.hsp;
		p.y += p.vsp;
		draw_sprite(p.sprite, p.img, p.x, p.y);
	}
}
function add_particle(sprite, imgspeed, x, y, hsp = 0, vsp = 0)
{
	var c = {sprite: sprite, imgspeed: imgspeed, img: 0, x: x, y: y, hsp: hsp, vsp: vsp};
	array_push(particles, c);
	return c;
}
reset_simuplayer();

xo = 0;
yo = 0;
alpha = 1;
scroll = 0;

active_modifiers = ds_list_create();
modif_shake = 0;

tv_state = 0;
tv_img = 0;

refresh_options = function()
{
	refresh_sequence();
}

refresh_sequence = function()
{
	simuplayer.state = states.titlescreen;
	simuplayer.changed = true;
	simuplayer.angle = 0;
	particles = [];
	
	if layer_exists(sequence_layer)
		layer_destroy(sequence_layer);
	
	if sel >= 0 
	{
		var opt = options_array[sel];
		if is_array(opt.drawfunc) && array_length(opt.drawfunc) > 0
		{
			sequence_layer = layer_create(-1, "sequence_layer");
			
			var seq;
			if array_length(opt.drawfunc) > 1
				seq = opt.drawfunc[opt.value % array_length(opt.drawfunc)];
			else
				seq = opt.drawfunc[0];
			sequence = layer_sequence_create(sequence_layer, 0, 0, seq);
		
			layer_script_begin(sequence_layer, function()
			{
				if event_type == ev_draw && event_number == ev_draw_normal
				{
					if !surface_exists(global.modsurf)
						global.modsurf = surface_create(width, height);
				
					surface_set_target(global.modsurf);
					draw_clear_alpha(c_black, 0.5);
					
					pal_swap_set(spr_noisepalette, 1, false);
				}
			});
			layer_script_end(sequence_layer, function()
			{
				if event_type == ev_draw && event_number == ev_draw_normal
				{
					surface_reset_target();
					pal_swap_reset();
				}
			});
		}
	}
}

var boss = false;
with obj_bossdoor
{
	if place_meeting(x, y, obj_player)
		boss = true;
}

#region MODIFIERS

function add_modifier(variable, color = #c09068, drawfunc = noone, local = string_lower(variable))
{
	if object_index != obj_levelsettings
	{
		if global.processing_mod != noone
			show_message($"{global.processing_mod.name}: Don't use \"add_modifier\" outside of modifier/menu.gml!");
		exit;
	}
	var struct =
	{
		value: MOD[$ variable],
		vari: variable,
		name: lstr("mod_title_" + local),
		desc: lstr("mod_desc_" + local),
		opts: [["off", false], ["on", true]],
		drawfunc: drawfunc,
		icon: get_modifier_icon(variable),
		color: color,
	};
	if struct.value
		ds_list_add(active_modifiers, struct.icon);
	array_push(options_array, struct);
	return struct;
}

options_array = [];

//add_modifier("Encore", MOD.Encore, "Remixes the level to make it harder.");

add_modifier("GreenDemon", #60d048, function(val)
{
	static sprite = spr_playerN_idle;
	static image = 0;
	
	var xx = width / 2 - 50, yy = height / 2;
	xx += cos(current_time / 100) * 20;
	yy -= sin(current_time / 100) * 20;
	
	if !val
	{
		if sprite != spr_playerN_idlemask
		{
			sprite = spr_playerN_idlemask;
			image = 28;
		}
	}
	else if sprite != spr_playerN_bossdeath2 && sprite != spr_playerN_bossdeath1
	{
		sprite = spr_playerN_bossdeath1;
		image = 0;
	}
	
	image += 0.35;
	switch sprite
	{
		case spr_playerN_idlemask:
			if image >= 34
				image -= 3;
			break;
		case spr_playerN_bossdeath1:
			if image >= 4
			{
				sprite = spr_playerN_bossdeath2;
				image = 0;
			}
			break;
		case spr_playerN_bossdeath2:
			if image > 15
				image = 15;
			break;
	}
	
	draw_sprite(spr_oneup, 0, xx, yy);
	draw_sprite_ext(sprite, image, width / 2 + 50, height - 80, -1, 1, 0, c_white, 1);
	
	if current_time % 5 == 0
		add_particle(spr_keyparticles, 0.35, xx + random_range(-25, 25), yy + random_range(-25, 25));
	
	draw_particles();
});

cosmic_surf = noone;
add_modifier("CosmicClones", #9850f8, function(val)
{
	var layers = [
		[spr_cosmicclone_layer1, 0.1],
		[spr_cosmicclone_layer2, 0.2],
		[spr_cosmicclone_layer3, 0.3],
		[spr_cosmicclone_layer4, 0.4],
	];
	
	var bowel_movement = current_time / 20;
	while array_length(layers)
	{
		var this = array_shift(layers);
		draw_sprite_stretched_ext(this[0], global.time * 0.1, (-bowel_movement * this[1]) % width, 0, width * 2, height, c_ltgray, 1);
	}
	
	var surf_size = 200;
	if !surface_exists(cosmic_surf)
		cosmic_surf = surface_create(surf_size, surf_size);
	
	surface_set_target(cosmic_surf);
	draw_clear_alpha(c_black, 0);
	
	var color1 = shader_get_uniform(shd_mach3effect, "color1");
	var color2 = shader_get_uniform(shd_mach3effect, "color2");
	
	shader_set(shd_mach3effect);
	shader_set_uniform_f(color1, 1, 1, 1);
	shader_set_uniform_f(color2, 0, 0, 0);
	draw_sprite_ext(spr_noise_vulnerable2, -1, 100, 100, 2, 2, 0, c_white, 1);
	
	surface_reset_target();
	shader_reset();
	
	var x_pos = width / 2 - (surf_size / 2);
	var y_pos = height / 2 - (surf_size / 2) - 25;
	
	draw_set_mask_surface(x_pos, y_pos, cosmic_surf);
	
	var layers = [
		[spr_cosmicclone_layer1, 0.1],
		[spr_cosmicclone_layer2, 0.2],
		[spr_cosmicclone_layer3, 0.3],
		[spr_cosmicclone_layer4, 0.4],
	];
	
	var bowel_movement = current_time / 8;
	while array_length(layers)
	{
		var this = array_shift(layers);
		draw_sprite_stretched(this[0], global.time * 0.1, (-bowel_movement * this[1]) % width, 0, width * 2, height);
	}
	
	draw_clear_mask();
});

if DEATH_MODE
{
	var deathmode_allow = 
	[ 
		"entryway", // Sugary
		"entrance", "medieval", //"ruin", "dungeon", // W1
		//"badland", "graveyard", "saloon", "farm", // W2
		//"plage", "space", "minigolf", "forest", // W3
		//"freezer", "street", "industrial", "sewer", // W4
		//"chateau", "kidsparty", //"war", // W5
		"etb", "midway", // Extra
	];
	if array_contains(deathmode_allow, level, 0, infinity)// or DEBUG
		add_modifier("DeathMode", , [seq_deathmode_on]);
}

if (level == "medieval" or level == "ruin" or level == "dungeon")
&& DEBUG
	add_modifier("OldLevels", #086800, [seq_oldlevels_on]);

/*
if !boss && level != "tutorial" && global.experimental
	add_modifier("NoToppings", 2, #C88048, [seq_notoppings_on]);
if !boss && level != "tutorial"
	add_modifier("Pacifist", 3, #f8e080, [seq_pacifist_on]);
*/

add_modifier("HardMode", #b83830, function(val)
{
	var xx = (width / 2) + cos(current_time / 500) * (width * .2);
	var yy = (height / 2) + sin(current_time / 300) * 15;
	
	draw_sprite_ext(spr_pizzamancer_idle, -1,
		xx, yy, 
		1, 1, 0, c_white, 0.5);
	draw_sprite_ext(spr_heatmeter4, 1, width / 2 + random_range(-1, 1), height / 2 - 32 + random_range(-1, 1), 1, 1, 0, c_white, 1);
});
add_modifier("Mirror", #30a8f8, function(val)
{
	static xscale = .9;
	xscale = val ? -.9 : .9;
	
	draw_sprite_ext(spr_mirrored_level, 0, width / 2, 0, xscale, .9, 0, c_white, 1);
	
	var xx = 95;
	if val
		xx = width - xx;
	
	draw_sprite_ext(val ? spr_playerN_doiseintro3 : spr_playerN_idle, -1, xx, 102, xscale, .9, 0, c_white, 1);
});

/*
if !boss && level != "grinch" && level != "dragonlair" && level != "snickchallenge" && level != "tutorial" && level != "secretworld"
{
	var opt = add_modifier("Lap Hell", "Lap3", "A challenge awaits you on the third lap!", [seq_lap3_off, seq_lap3_on, seq_lap3_on]);
	opt.opts = [
		["OFF", false],
		["ON", true],
		["HARD", 2] // No parrying pizzaface, restart the whole level if failed
	]
}
*/

if level != "trickytreat"
add_modifier("JohnGhost", #786898, function(val)
{
	/*if val
	{*/
		add_particle(spr_flamecloud, 0.5, width / 2 + 70, height - 80, random_range(-15, -20), 0);
		draw_particles();
		
		draw_sprite(spr_playerN_hurtwalk, global.time * .5, width / 2 + 90 + random_range(-3, 3), height - 80 + random_range(-1, 1));
		draw_sprite(spr_speedlines, -1, width / 2 + 90, height - 80);
		draw_sprite_ext(spr_ghostjohn, -1, width / 2 - 50 + cos(current_time / 200) * 10, height - 110 + sin(current_time / 200) * 5, 1, 1, 0, c_white, 0.75);
	/*}
	else
	{
		draw_sprite(spr_johnresurrected_pillar1, 0, width / 2 + 50, height / 2 - 5);
		draw_sprite(spr_playerN_doiseintro3, -1, width / 2 - 100, height - 80);
	}*/
});

circle_size = 250;
add_modifier("Spotlight", #283040, function(val)
{
	// draw circle first to crop out
	shader_reset();
	
	draw_clear(c_black);
	circle_size = lerp(circle_size, val ? 60 : 250, 0.25);
	
	gpu_set_blendmode(bm_subtract);
	draw_set_alpha(0.5);
	draw_circle(width/2 + random_range(-1, 1), height/2 + random_range(-1, 1), circle_size, false);
	draw_circle(width/2 + random_range(-1, 1), height/2 + random_range(-1, 1), circle_size + 20, false);
	gpu_set_blendmode(bm_normal);
	
	draw_set_alpha(1);
	
	// player
	var p = simuplayer;
	pal_swap_set(spr_noisepalette, 1);
	draw_sprite(spr_playerN_move, p.image, width / 2, height / 2);
	pal_swap_reset();
});

/*
var l = level_get_info(level);
if is_instanceof(l, LevelInfo) && global.experimental
{
	add_modifier("FromTheTop", #786898, function(val)
	{
		draw_sprite_ext(val ? spr_hungrypillar : spr_exitgate, 0, 100, 110, 0.5, 0.5, 0, c_white, 1);
		draw_sprite_ext(val ? spr_exitgate : spr_hungrypillar, 0, width - 100, 110, val ? .5 : -0.5, 0.5, 0, c_white, 1);
		
		draw_sprite_ext(spr_palettearrow, 0, width / 2 + sin(current_time / 200) * 10, height / 2 - 25, 1, 1, val ? 90 : -90, c_white, 1);
		draw_sprite_ext(spr_palettearrow, 0, width / 2 + sin(current_time / 200) * -10, height / 2 + 25, 1, 1, val ? -90 : 90, c_white, 1);
	});
}
*/
	
add_modifier("GravityJump", #8038f0, function(val)
{
	static vsp = 0;
	
	var p = simuplayer;
	if p.changed
	{
		p.state = states.actor;
		p.sprite = spr_playerN_idle;
		p.image = 0;
		p.changed = false;
	}
	
	var target_y = 80;
	if !val
		target_y = height - target_y;
	
	p.vsp = 0;
	p.image += 0.35;
	
	if (val && p.y > target_y) or (!val && p.y < target_y)
	{
		p.y += vsp;
		vsp += val ? -0.5 : 0.5;
		
		p.sprite = spr_playerN_fall;
	}
	else
	{
		p.y = target_y;
		vsp = 0;
		
		if p.sprite != spr_playerN_land && p.sprite != spr_playerN_idle
		{
			if !val
				add_particle(spr_landcloud, 0.35, p.x, p.y);
			p.sprite = spr_playerN_land;
			p.image = 0;
			
			sound_play_centered(sfx_playerstep);
		}
	}
	if p.sprite == spr_playerN_land && p.image >= sprite_get_number(p.sprite) - 1
		p.sprite = spr_playerN_idle;
	
	p.angle = Approach(p. angle, val ? 180 : 0, 15);
	
	draw_simuplayer();
	draw_particles();
});

add_modifier("NoiseWorld", #f8e080, function(val)
{
	static stickers = [];
	static time = 0;
	
	if --time <= 0
	{
		time = room_speed / 2;
		sound_play("event:/sfx/playerN/titlecard");
		
		array_push(stickers,
		{
			x: 50,
			y: random_range(-height / 3, height / 3),
			image: irandom(sprite_get_number(spr_titlecard_noise)),
			scale: 2,
			target_scale: random_range(0.5, 1)
		});
	}
	
	for(var i = 0; i < array_length(stickers); i++)
	{
		with stickers[i]
		{
			x -= 3;
			draw_sprite_ext(spr_titlecard_noise, image, other.width / 2 + x, other.height / 2 + y, target_scale * scale, target_scale * scale, 0, c_white, 1);
			scale = Approach(scale, 1, 0.25);
			
			if x <= -500
			{
				array_delete(stickers, i, 1);
				i--;
			}
		}
	}
});

//add_modifier("PizzaMulti", #E08858);

/*
if level != "trickytreat" && global.experimental
{
	add_modifier("DoubleTrouble", #f8e080, function(val)
	{
		static noise_x = 0;
		static doise_x = 0;
	
		if noise_x == 0
		{
			noise_x = width / 2;
			doise_x = width / 2;
		}
	
		noise_x = lerp(noise_x, val ? width / 2 + 50 : width / 2, 0.5);
		doise_x = lerp(doise_x, val ? width / 2 - 50 : width / 2, 0.5);
	
		if abs(noise_x - doise_x) > 10
		{
			pal_swap_set(spr_noiseboss_palette, 1, false);
			draw_sprite_ext(spr_playerN_idle, -1, doise_x, height / 2, 1, 1, 0, c_white, 1);
		}
	
		pal_swap_set(spr_noiseboss_palette, 2, false);
		draw_sprite_ext(spr_playerN_idle, -1, noise_x, height / 2, -1, 1, 0, c_white, 1);
	
		pal_swap_reset();
	});
}

if level != "trickytreat" && global.experimental
	add_modifier("Hydra", #d08838);
*/

// MODDED
scr_modding_hook("modifier/menu");

// Level specific
if level == "grinch"
{
	add_modifier("EasyMode", #f878b0, function(val)
	{
		draw_sprite_ext(spr_grinch_ball, val ? 0 : -1, width / 2, height / 2, 2, 2, 0, c_white, 1);
		if val
		{
			draw_sprite_ext(spr_nocosmetic, 0, width / 2, height / 2 + 5, 2, 2, 0, 0, .25);
			draw_sprite_ext(spr_nocosmetic, 0, width / 2, height / 2, 2, 2, 0, c_white, 1);
		}
	}, "grincheasy");
}
if level == "golf"
{
	add_modifier("EasyMode", #f878b0, , "golfeasy");
}
if level == "snickchallenge"
{
	add_modifier("OldLevels", #086800, [seq_oldlevels_on]);
	add_modifier("EasyMode", #f878b0, , "snickeasy");
}
/*
if level == "exit"
{
	add_modifier("CTOPLaps", 6, #f8c000, function(val)
	{
		draw_sprite(spr_lappable, !val, 0, 0);
	});
}
*/
if level == "secretworld"
{
	add_modifier("Ordered", #d868a0);
	//add_modifier("SecretInclude", 22, #d868a0);
	
	//if DEBUG
	//	add_modifier("FromTheTop", 0, , , "panic");
}

refresh_options();

#endregion

bgcolor = #786898;
bgprev = #786898;
bgmix = 0;

song = "custom";
switch level
{
	case "entrance": case "medieval": case "ruin": case "dungeon":
	case "badland": case "graveyard": case "farm": case "saloon":
	case "plage": case "forest": case "minigolf": case "space":
	case "street": case "industrial": case "sewer": case "freezer":
	case "chateau": case "kidsparty": case "war": case "secretworld":
	case "dragonlair": case "mansion": case "strongcold": case "sky":
	case "snickchallenge": case "grinch":
		song = level;
		break;
	case "entryway": case "steamy": case "molasses": case "sucrose": case "mines":
		if SUGARY_SPIRE song = level;
		break;
	case "aprilmansion": case "oldmansion":
		song = "mansion";
		break;
	case "oldfreezer":
		song = "freezer";
		break;
	case "ancient": case "etb":
		song = "ruin";
		break;
	case "beach":
		song = "plage";
		break;
	case "desert":
		song = "badland";
		break;
	case "hiddenlair":
		song = "dragonlair";
		break;
}
if room == trickytreat_1
	song = "graveyard";

song = fmod_event_create_instance(concat("event:/modded/waiting/", song));
if global.jukebox == noone
{
	with obj_player
	{
		if place_meeting(x, y, obj_startgate) or room == editor_entrance
			fmod_event_instance_play(other.song);
	}
}

// skip replays
has_replays = false;
