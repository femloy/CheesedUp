live_auto_call;

// prep
depth = -600;
image_speed = 0.35;
scr_init_input();
stickpressed = false;
con = 0;
t = 0;
buffer = 2;
sequence_layer = -1;
sequence = -1;
move_buffer = -1;
xo = 0;
yo = 0;
alpha = 1;
scroll = 0;
control_mouse = false;
state = 0;
state_trans = 0;
section_scroll = [0, 0];
menu_xo = 0;
character = obj_pause.pause ? obj_pause.character : obj_player1.character;
preview_width = 960 / 2.5; // 384
preview_height = 540 / 2.5; // 216
incubic = animcurve_get_channel(curve_menu, "incubic");
options_bg = 5;
back_extra_width = 0;
back_hide_y = 0;

#region preview window

reset_simuplayer = function()
{
	particles = [
	
	];
	simuplayer = {
		x: preview_width / 2, y: preview_height / 1.5, state: states.normal, hsp: 0, vsp: 0, sprite: spr_player_idle, image: 0, xscale: 1, timer: 0, move: 0, changed: false, angle: 0
	}
};
draw_simuplayer = function(loop = true)
{
	var p = simuplayer;
	if p.y < -50
	{
		draw_sprite(spr_peppinoicon, 0, p.x, 25);
		exit;
	}
	
	var xo = p.x - lengthdir_x(28, p.angle - 90);
	var yo = p.y;
	
	if loop
	{
		if xo < 50
			draw_sprite_ext(p.sprite, p.image, xo + preview_width, yo, p.xscale, 1, p.angle, c_white, 1);
		if xo > preview_width - 50
			draw_sprite_ext(p.sprite, p.image, xo - preview_width, yo, p.xscale, 1, p.angle, c_white, 1);
	}
	
	draw_sprite_ext(p.sprite, p.image, xo, yo, p.xscale, 1, p.angle, c_white, 1);
};
draw_particles = function()
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
		draw_sprite(p.sprite, p.img, p.x, p.y);
	}
};
add_particle = function(sprite, imgspeed, x, y)
{
	array_push(particles, {sprite: sprite, imgspeed: imgspeed, img: 0, x: x, y: y});
};
reset_simuplayer();

refresh_sequence = function()
{
	if layer_exists(sequence_layer)
		layer_destroy(sequence_layer);
	
	var section = submenu != noone ? submenus[? submenu] : sections_array[sel];
	if section.sel < 0
		exit;
	
	var opt = section.options_array[section.sel];
	if opt.type == modconfig.preset
		exit;
	
	var func = opt.drawfunc;
	if is_array(func)
		func = opt.drawfunc[opt.value];
	
	if sequence_exists(func)
	{
		sequence_layer = layer_create(-1, "sequence_layer");
		sequence = layer_sequence_create(sequence_layer, 0, 0, func);
		
		layer_script_begin(sequence_layer, function()
		{
			if event_type == ev_draw && event_number == ev_draw_normal
			{
				if !surface_exists(global.modsurf)
					global.modsurf = surface_create(preview_width, preview_height);
				
				surface_set_target(global.modsurf);
				draw_clear_alpha(c_black, 0);
				
				gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
				shader_set(global.Pal_Shader);
				pal_swap_set(spr_peppalette, 1, false);
			}
		});
		layer_script_end(sequence_layer, function()
		{
			if event_type == ev_draw && event_number == ev_draw_normal
			{
				pal_swap_reset();
				surface_reset_target();
			}
		});
	}
};

#endregion
#region ModSection

sections_array = [];
function ModSection(name, icon = 0, array = obj_modconfig.sections_array) constructor
{
	super = obj_modconfig;
	if array != noone
		array_push(array, self);
	
	simuplayer = super.simuplayer;
	refresh_sequence = super.refresh_sequence;
	add_particle = super.add_particle;
	draw_particles = super.draw_particles;
	draw_simuplayer = super.draw_simuplayer;
	width = super.preview_width;
	height = super.preview_height;
	
	options_array = [];
	sel = -1;
	options_pos = [];
	self.name = lstr($"mod_section_{name}");
	self.icon = icon;
	icon_alpha = 0;
	icon_offset = [0, 0];
	
	select = function(_sel)
	{
		sel = _sel;
		if sel != -1
			sound_play(sfx_step);
		
		//if struct_exists(self, "machsnd")
		//	sound_stop(machsnd, true);
		
		simuplayer.state = states.titlescreen;
		simuplayer.changed = true;
		simuplayer.angle = 0;
		
		refresh_sequence();
	}
	refresh_options = function()
	{
		var yy = 0;
		
		options_pos = [];
		for(var i = 0; i < array_length(options_array); i++)
		{
			var opt = options_array[i];
			switch opt.type
			{
				case modconfig.option:
					var value = opt.vari_target[$ opt.vari];
					for(var j = 0; j < array_length(opt.opts); j++)
					{
						if opt.opts[j][1] == value
							opt.value = j;
					}
					break;
			
				case modconfig.slider:
					var value = opt.vari_target[$ opt.vari] ?? 0;
					opt.value = (value - opt.range[0]) / (opt.range[1] - opt.range[0]);
					break;
			}
			if !(opt.type != modconfig.section && opt.type != modconfig.padding && opt.hidden)
			{
				if opt.type == modconfig.section
				{
					yy += 30;
					yy += 40;
				}
				else
					yy += 20;
			}
			options_pos[i] = yy;
		}
	}
	dispose = function()
	{
		
	}
	
	enum modconfig
	{
		option,
		section,
		button,
		modifier,
		slider,
		preset,
		padding
	}
	
	add_option = function(variable, drawfunc = noone, multi_desc = false)
	{
		var struct = {
			type: modconfig.option,
			value: 0,
			vari: variable,
			name: lstr("mod_title_" + variable),
			desc: multi_desc ? "" : lstr("mod_desc_" + variable),
			opts: [["off", false], ["on", true]],
			drawfunc: drawfunc,
			condition: noone,
			hidden: false,
			multi_desc: multi_desc,
			apply: function()
			{
				var value = opts[self.value][1];
				vari_target[$ vari] = value;
				return value;
			},
			allow_preset: true,
			vari_target: global
		}
		array_push(options_array, struct);
		return struct;
	}
	add_button = function(local, func = noone, drawfunc = noone)
	{
		var struct = {
			type: modconfig.button,
			name: lstr("mod_title_" + local),
			desc: lstr("mod_desc_" + local),
			func: func,
			drawfunc: drawfunc,
			condition: noone,
			hidden: false,
			small: true
		}
		array_push(options_array, struct);
		return struct;
	}
	add_slider = function(variable, range = [0, 1], drawfunc = noone)
	{
		var struct = {
			type: modconfig.slider,
			value: 0,
			vari: variable,
			name: lstr("mod_title_" + variable),
			desc: lstr("mod_desc_" + variable),
			range: range,
			drawfunc: drawfunc,
			condition: noone,
			hidden: false,
			apply: function()
			{
				var value = (range[0] + (range[1] - range[0]) * self.value);
				vari_target[$ vari] = value;
				return value;
			},
			vari_target: global
		}
		array_push(options_array, struct);
		return struct;
	}
	add_section = function(local)
	{
		var struct = {
			type: modconfig.section,
			name: lstr("mod_section_" + local)
		};
		array_push(options_array, struct);
		return struct;
	}
	add_preset = function(preset)
	{
		var struct = {
			type: modconfig.preset,
			preset: preset,
			name: preset.preset_name,
			desc: preset.preset_desc,
			condition: noone,
			hidden: false,
			typing: false,
			custom: false
		}
		array_push(options_array, struct);
		return struct;
	}
	add_padding = function()
	{
		var struct = {
			type: modconfig.padding
		}
		array_push(options_array, struct);
		return struct;
	}
}

#endregion

total_array = function()
{
	var a = [];
	array_copy(a, 0, sections_array, 0, array_length(sections_array));
	array_copy(a, array_length(a) - 1, submenus_array, 0, array_length(submenus_array));
	return a;
}

find_option = function(name)
{
	var a = total_array();
	for(var i = 0, n = array_length(a); i < n; ++i)
	{
		var sect = a[i];
		for(var j = 0, m = array_length(sect.options_array); j < m; j++)
		{
			var opt = sect.options_array[j];
			if (opt.type == modconfig.option or opt.type == modconfig.slider)
			&& opt.vari == name
				return opt;
		}
	}
}

sel = 0;
global.modsurf = noone;

// options
with new ModSection("gameplay", 0)
{
	icon_offset[0] = -10;
	
	#region REMIX

	var opt = add_option("gameplay", function(val)
	{
		static tv_bg = {surf: noone, sprite: spr_gate_entranceBG, parallax: [0.65, 0.75, 0.85], x: 0, y: 68};
		static color1 = undefined, color2 = undefined;
		
		if color1 == undefined or color2 == undefined
		{
			color1 = shader_get_uniform(shd_mach3effect, "color1");
			color2 = shader_get_uniform(shd_mach3effect, "color2");
		}
		
		if val == 1
		{
			// move it
			var movespeed = -0.25;
		
			tv_bg.x += movespeed;
			if !surface_exists(tv_bg.surf)
				tv_bg.surf = surface_create(278, 268);
			
			// draw it
			surface_set_target(tv_bg.surf);
			
			for(var i = 0; i < sprite_get_number(tv_bg.sprite); i++)
				draw_sprite_tiled(tv_bg.sprite, i, 278 / 2 + tv_bg.x * max(lerp(-1, 1, tv_bg.parallax[i]), 0), 268);
		
			gpu_set_blendmode(bm_subtract);
			draw_sprite(spr_tv_clip, 1, 278 / 2, 268 - tv_bg.y);
			gpu_set_blendmode(bm_normal);
			
			surface_reset_target();
		
			draw_surface_ext(tv_bg.surf, 110 - 278 / 2, 70 - 268 + tv_bg.y, 1, 1, 0, c_white, 1);
			shader_reset();
		}
		else
			draw_sprite_ext(spr_tv_bgfinal, 1, 110, 70, 1, 1, 0, c_white, 1);
	
		shader_set(global.Pal_Shader);
		pal_swap_set(spr_peppalette, 1, 0);
		draw_sprite_ext(spr_tv_idle, super.image_index, 110, 70, 1, 1, 0, c_white, 1);
		shader_reset();
	
		if val == 1
		{
			shader_set(shd_mach3effect);
			gpu_set_blendmode(bm_normal);
		
			var b = global.mach_color1;
			shader_set_uniform_f(color1, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
			b = merge_colour(b, c_black, 0.9);
			shader_set_uniform_f(color2, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
		
			draw_sprite(spr_player_mach, 0, 240, 150);
			draw_sprite(spr_player_mach, 2, 340, 150);
		
			b = global.mach_color2;
			shader_set_uniform_f(color1, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
			b = merge_colour(b, c_black, 0.9);
			shader_set_uniform_f(color2, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
		
			draw_sprite(spr_player_mach, 1, 290, 150);
			shader_reset();
		}
		else
		{
			var mach_color1 = make_colour_rgb(96, 208, 72);
			var mach_color2 = make_colour_rgb(248, 0, 0);
		
			draw_sprite_ext(spr_player_mach, 0, 240, 150, 1, 1, 0, mach_color1, 1);
			draw_sprite_ext(spr_player_mach, 2, 340, 150, 1, 1, 0, mach_color1, 1);
			draw_sprite_ext(spr_player_mach, 1, 290, 150, 1, 1, 0, mach_color2, 1);
		}
	});

	#endregion
	#region GAMEPLAY
	
	var opt = add_option("iteration", function(val)
	{
		if val == IT.FINAL
			draw_sprite_ext(spr_player_longjumpend, super.image_index, width / 2, height / 2, 2, 2, 0, c_white, 1);
		if val == IT.APRIL
			draw_sprite_ext(spr_player_mach2jump, super.image_index, width / 2, height / 2, 2, 2, 0, c_white, 1);
		if val == IT.BNF
			draw_sprite_ext(spr_player_suplexgrabjump, super.image_index, width / 2 - 15, height / 2, 2, 2, 0, c_white, 1);
	});
	opt.opts = [
		//["old", IT.BNF],
		["april", IT.APRIL],
		["final", IT.FINAL],
	]

	#endregion
	#region EXPERIMENTAL

	var opt = add_option("experimental", function(val)
	{
		draw_sprite_ext(spr_experimental, 0, 0, 0, 1, 1, 0, val ? c_white : c_dkgray, 1);
		draw_set_colour(c_white);
		if !val
		{
			tdp_draw_set_font(lang_get_font("font_small"));
			tdp_draw_set_align(fa_center, fa_middle);
			tdp_draw_text(width / 2, height / 1.2, lstr("mod_disabled")); // Experimental's off!
			tdp_text_commit(0, 0, width, height);
		}
	});
	opt.allow_preset = false;

	#endregion
	#region ATTACK STYLE

	var opt = add_option("attackstyle", [seq_attackstyle_grab, seq_attackstyle_kungfu, seq_attackstyle_shoulderbash, seq_attackstyle_lunge]);
	opt.opts = [
		["grab", 0],
		["kungfu", 1],
		["shoulderbash", 2],
		["lunge", 3],
	];
	opt.hidden = other.character == "V";

	#endregion
	#region SHOOT STYLE

	var opt = add_option("shootstyle", function(val)
	{
		static bullets = 3;
		
		var p = simuplayer;
		if p.state == states.chainsawbump && bullets == 0
			p.changed = true;
		
		if p.state == states.titlescreen
		{
			p.xscale = 1;
			p.state = states.normal;
			p.sprite = spr_player_idle;
			p.move = 0;
			p.hsp = 0;
			bullets = 3;
			p.timer = 0;
		}
		else if p.x != 100 && p.state != states.punch
			p.x = Approach(p.x, 100, 10);
		else
		{
			if p.changed
			{
				p.changed = false;
				p.state = states.titlescreen;
			}
		
			p.timer++;
			if p.timer > 20
			{
				p.timer = 0;
				if val == 1 && floor(bullets) > 0 && frac(bullets) == 0
				{
					sound_play_centered(sfx_pistolshot);
					p.state = states.pistol;
					p.sprite = spr_player_pistolshot;
					p.image = 0;
					bullets--;
				}
				if val == 2
				{
					p.hsp = p.xscale * 6;
					p.timer = -50;
					sound_play_centered(sfx_breakdance);
					p.state = states.punch;
					p.sprite = spr_player_breakdancestart;
					p.image = 0;
				}
			}
		
			if val == 1 && p.state != states.pistol
			{
				if bullets == 0
					p.timer = -80;
				bullets = Approach(bullets, 3, 0.05);
			}
		}
		
		draw_simuplayer();
		
		if val == 1
		{
			for(var i = 0; i < floor(bullets); i++)
				draw_sprite(spr_peppinobullet_collectible, super.image_index, 136 - 46 * i, -32);
		}
	});
	opt.opts = [
		["none", 0],
		["pistol", 1],
		["breakdance", 2]
	];
	opt.hidden = other.character == "V";

	#endregion
	#region DOUBLE GRAB

	var opt = add_option("doublegrab", function(val)
	{
		static bullets = 3;
		
		var p = simuplayer;
		if p.state == states.titlescreen
			bullets = 3;
		
		if p.sprite == spr_player_breakdanceuppercut && p.state == states.titlescreen
		{
			p.state = states.panicjump;
			p.move = 0;
			p.timer = -100;
		}
		else if p.changed
		{
			if p.state == states.titlescreen
				p.state = states.normal;
			if p.state == states.normal
			{
				if p.x > 75 && p.x + p.hsp > 75
					p.move = -1;
				else if p.x <= 75 && p.x + p.hsp <= 75
					p.move = 1;
				else
				{
					bullets = 3;
					p.x = 75;
					p.hsp = 0;
					p.move = 0;
					p.xscale = 1;
					p.timer = 10;
					p.changed = false;
				}
			}
		}
		else
		{
			if p.state == states.titlescreen
			{
				p.state = states.normal;
				p.sprite = spr_player_idle;
				p.x = 75;
				p.xscale = 1;
			}
		
			p.timer++;
			if p.timer >= 30 && val != 0 && (val != 3 or floor(bullets) > 0)
			{
				if p.state == states.handstandjump
				{
					p.timer = -30;
					if val == 1
					{
						sound_play_centered(sfx_dive);
						p.sprite = spr_player_attackdash;
						p.image = 0;
					}
					if val == 2
					{
						p.sprite = spr_player_faceplant;
						p.state = states.faceplant;
						p.hsp = 8;
						p.image = 0;
					}
					if val == 3
					{
						p.sprite = spr_player_chainsawdash;
						p.state = states.chainsawbump;
						p.hsp = 11;
						p.image = 0;
						
						if --bullets == 0
							p.changed = true;
					}
				}
				else
				{
					p.timer = 10;
					//sound_play_centered(sfx_suplexdash);
				
					p.state = states.handstandjump;
					p.sprite = spr_player_suplexdash;
					p.image = 0;
					p.move = p.xscale;
					p.hsp = 4 * p.move;
				}
			}
		}
	
		if val == 3
		{
			for(var i = 0; i < floor(bullets); i++)
				draw_sprite(spr_fuelHUD, super.image_index, 136 - 46 * i, 46);
		}
	
		draw_simuplayer();
	});
	opt.opts = [
		["none", 0],
		["chainsaw", 3],
		["shoulderbash", 1],
		["faceplant", 2]
	];
	opt.hidden = other.character == "V";

	#endregion
	
	#region VIGI SHOOT
		
	var opt = add_option("vigishoot", function(val)
	{
		static sprite = spr_playerV_airrevolverend;
		static img = 0;
		static timer = 0;
			
		var number = sprite_get_number(sprite);
		img = (img + 0.35) % sprite_get_number(sprite);
		draw_sprite(sprite, img, width / 2, height / 2 - 15);
			
		timer++;
		if val == vigishoot.vanilla
		{
			if sprite == spr_playerV_airrevolverstart
				sprite = spr_playerV_airrevolverend;
				
			// OFF
			if timer < 50
			{
				if img >= number - 1
				{
					if sprite == spr_playerV_airrevolverend
					{
						sound_play_centered("event:/sfx/enemies/killingblow");
						sprite = spr_playerV_airrevolver;
						img = 0;
					}
					else if sprite == spr_playerV_airrevolver
					{
						sprite = spr_playerV_airrevolverend;
						img = 0;
					}
				}
			}
			else
			{
				if sprite == spr_playerV_airrevolver && img >= number - 1
					sprite = spr_playerV_airrevolverend;
					
				if timer >= 100
					timer = 0;
			}
		}
		else
		{
			// ON
			if timer < 50
			{
				if img >= number - 4
				{
					sound_play_centered("event:/sfx/enemies/killingblow");
					sprite = spr_playerV_airrevolver;
					img = 0;
				}
			}
			else
			{
				if img >= number - 1
					sprite = spr_playerV_airrevolverstart;
					
				if timer >= 100
					timer = 0;
			}
		}
	});
	opt.opts = [
		["off", vigishoot.vanilla],
		["on", vigishoot.pto],
	];
	opt.hidden = other.character != "V";
		
	#endregion
	
	#region BUFFED UPPERCUT

	var opt = add_option("uppercut", function(val)
	{
		var p = simuplayer;
		if p.state == states.titlescreen
		{
			p.timer = 0;
			p.state = states.normal;
		}
		p.move = 1;
	
		p.timer++;
		if p.timer >= 20
		{
			p.timer = -50;
			seq_afterimages_uppersnd();
		
			p.state = states.panicjump;
			p.sprite = spr_player_breakdanceuppercut;
			if val != 1
				p.hsp = 2;
			p.vsp = -12;
			p.image = 0;
		}
	
		draw_simuplayer();
	});

	#endregion
	#region HITSTUN

	var opt = add_option("hitstun", [seq_hitstun_off, seq_hitstun_early, seq_hitstun_on]);
	opt.opts = [
		["off", 0],
		["old", 2],
		["on", 1]
	];

	#endregion
	#region POUND JUMP

	var opt = add_option("poundjump", [seq_groundpoundjump_off, seq_groundpoundjump_on]);

	#endregion
	#region HEAT METER

	var opt = add_option("heatmeter", function(val)
	{
		var xx = 960 / 2.5 / 2, yy = 540 / 2.5 / 2;
	
		if val
		{
			draw_sprite(spr_heatmeter, 0, xx, yy);
			draw_sprite(spr_pizzascore, 0, xx, yy);
		}
		else
			draw_sprite(spr_pizzascore, 0, xx, yy);
	});

	#endregion
	#region HOLIDAY OVERRIDE

	var opt = add_option("holidayoverride", function(val)
	{
		gpu_set_blendmode(bm_normal);
		
		var xx = width / 2, yy = height / 2;
		if val == -1
			yy -= 20;
		
		switch val == -1 ? global.holiday : val
		{
			case holiday.none:
				draw_sprite(spr_PTG, 0, xx, yy + 50);
				break;
			case holiday.halloween:
				draw_sprite(spr_PTGhalloween, 0, xx + random_range(-2, 2), yy + 75 + random_range(-1, 1) - abs(sin(current_time / 1) * 50));
				break;
			case holiday.loy_birthday:
				var yo = Wave(-5, 5, 2, 0);
				draw_sprite(spr_balloon, super.image_index, xx, yy - 50 + yo);
				draw_sprite(spr_PTG, 0, xx, yy + 50 + yo);
				
				draw_sprite(spr_balloon, super.image_index, xx - 140, yy - 20);
				draw_sprite(spr_balloon, super.image_index, xx - 80, yy + 60);
				draw_sprite(spr_balloon, super.image_index, xx + 120, yy + 20);
				
				var col = #ff99ff;
				
				draw_set_alpha(0.2);
				draw_rectangle_color(0, 0, width, height, col, col, col, col, false);
				draw_set_alpha(1);
				break;
		}
		
		if val == -1
		{
			reset_blendmode();
			
			draw_set_alpha(0.5);
			draw_rectangle_color(0, 0, width, height, 0, 0, 0, 0, false);
			draw_set_alpha(1);
			
			tdp_draw_set_font(lang_get_font("font_small"));
			tdp_draw_set_align(fa_center, fa_middle);
			tdp_draw_text(width / 2, height / 1.2, lstr("mod_disabled"));
			tdp_text_commit(0, 0, width, height);
		}
		return false;
	});
	opt.opts = [
		["off", -1],
		["normal", holiday.none],
		["halloween", holiday.halloween],
		["birthday", holiday.loy_birthday],
	]
	opt.condition = function()
	{
		return [room == Mainmenu, lstr("mod_condition_holidayoverride")]; // Go back to the main menu to change this!
	}
	opt.allow_preset = false;

	#endregion
	#region SPEEDRUNNER'S BANQUET
	
	var opt = add_option("banquet", function(val)
	{
		if val
		{
			draw_sprite_ext(spr_player_mach4, super.image_index, width * 0.25, height * 0.25, -1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_player_secondjump2, super.image_index, width * 0.25, height * 0.65, -1, 1, 0, c_white, 1);
			
			var slap_key = tdp_get_icon(tdp_input_get("player_slap").actions[0]);
			var cx = width / 2 - 12, cy = height * 0.7 - 12;
			draw_sprite(slap_key.sprite_index, slap_key.image_index, cx, cy);
			
			if slap_key.str != ""
			{
				draw_set_align(1, 1);
				draw_set_font(lang_get_font("tutorialfont"));
				draw_text_color_new(cx + 16, cy + 18, slap_key.str, c_black, c_black, c_black, c_black, 1);
				draw_set_align();
			}
			
			draw_sprite_ext(spr_palettearrow, 0, width / 2, height * 0.3, 1, 1, 90, c_white, 1);
		}
		else
		{
			draw_sprite_ext(spr_palettearrow, 0, width / 2, height / 2, 1, 1, 90, c_white, 1);
			draw_sprite_ext(spr_player_mach4, super.image_index, width * 0.25, height / 2, -1, 1, 0, c_white, 1);
		}
		draw_sprite_ext(spr_player_climbwall, super.image_index, width * 0.75, height / 2, -1, 1, 0, c_white, 1);
	});
	
	#endregion
	
	#region LAPPING

	lap = 2;
	
	var opt = add_button("lapping", function()
	{
		with super
			switch_submenu("lap");
	},
	function()
	{
		static explosion_img = 0;
		static lapshake = 0;
		
		if lap == -1
		{
			if explosion_img < sprite_get_number(spr_bombexplosion)
			{
				draw_sprite(spr_bombexplosion, explosion_img, width / 2, height / 2);
				explosion_img += 0.4;
			}
		}
		else
		{
			lapshake = Approach(lapshake, 0, 0.35);
			if ++simuplayer.timer >= 30
			{
				simuplayer.timer = 0;
				if lap >= 999
				{
					lap = -1;
					explosion_img = 0;
					sound_play_centered(sfx_explosion);
					exit;
				}
				else
				{
					lap++;
					lapshake = 3;
				}
			}
	
			var xx = width / 2, yy = height / 2;
			yy -= 152 / 2;
	
			lang_draw_sprite(spr_lap2, 1, xx, yy);
	
			var lap_text = string(lap);
			var wd = sprite_get_width(spr_lapfontbig) * string_length(lap_text);
	
			shader_reset();
	
			// numbers!
			gpu_set_alphatestenable(true);
	
			for(var i = 1; i <= string_length(lap_text); i++)
			{
				var lx = xx - 8 + 39 * i - ((wd - 64) / 3) + random_range(-lapshake, lapshake);
				var ly = yy + 8 + random_range(-lapshake, lapshake);
				var letter = ord(string_char_at(lap_text, i)) - ord("0");
		
				gpu_set_blendmode_ext(bm_dest_color, bm_zero);
				draw_set_flash(#88A8C8);
				draw_sprite(spr_lapfontbig, letter, lx, ly + 6);
				draw_reset_flash();
			
				gpu_set_blendmode(bm_normal);
				draw_sprite(spr_lapfontbig, letter, lx, ly);
			}
	
			// the thingy
			gpu_set_blendmode(bm_normal);
			lang_draw_sprite(spr_lap2, 2, xx - ((wd - 64) / 3), yy);
			gpu_set_blendmode_ext(bm_dest_color, bm_zero);
			lang_draw_sprite(spr_lap2, 3, xx - ((wd - 64) / 3), yy);
			gpu_set_blendmode(bm_normal);
	
			gpu_set_alphatestenable(false);
		}
	});
	opt.condition = function()
	{
		if global.in_afom
			return [false, lstr("mod_condition_lapping2")];
		return [global.leveltorestart == noone, lstr("mod_condition_lapping")];
	}
	opt.small = false;

	#endregion
	
	refresh_options();
}

with new ModSection("online", 4)
{
	icon_offset[0] = 20;
	
	var player_preview = function()
	{
		var opacity = options_array[1].value;
		var name_opacity = options_array[2].value;
		var streamer_mode = options_array[3].value;
		
		draw_set_font(global.font_small);
		draw_set_align(fa_center);
		draw_set_color(c_white);
		draw_sprite_ext(spr_player_idle, simuplayer.image, width / 2, height / 2, 2, 2, 0, c_white, opacity);
		draw_text_transformed_color(width / 2, height / 2 - 80, streamer_mode ? "Player pnmFFtZtbIUY6MB_" : "COOLSKELETON95", 2, 2, 0, c_white, c_white, c_white, c_white, opacity * name_opacity);
		
		return false;
	}
	
	add_section("online"); // 0
	add_slider("online_player_opacity", , player_preview); // 1
	add_slider("online_name_opacity", , player_preview); // 2
	add_option("online_streamer_mode", player_preview); // 3
	
	add_section("online_chat");
	add_option("online_raw_chat", function(val)
	{
		draw_set_font(global.font_small);
		draw_set_align(fa_center, fa_middle);
		draw_set_color(!val ? #ff7777 : c_white);
		
		var streamer_mode = options_array[3].value;
		var name = streamer_mode ? "Player ReYN9P7uoetLSNfF" : "COOLSKELETON95";
		draw_text_special(width / 2, height / 2, !val ? "Hello!" : "<shake><#ff7777>Hello!", { shake: !val ? 1 : 0 });
	});
	
	refresh_options();
}

with new ModSection("input", 1)
{
	icon_offset[0] = 10;
	
	#region 
	
	#region SWAP GRAB

	add_option("swapgrab", function(val)
	{
		static grab_pos = 280, kungfu_pos = 100;
		
		var slap_key = tdp_get_icon(tdp_input_get("player_slap").actions[0]);
		var chainsaw_key = tdp_get_icon(tdp_input_get("player_chainsaw").actions[0]);
		
		var cx = 80, cy = 50;
		draw_sprite(slap_key.sprite_index, slap_key.image_index, cx, cy);
		draw_set_align(1, 1);
		draw_set_font(lang_get_font("tutorialfont"));
		if slap_key.str != ""
			draw_text_color_new(cx + 16, cy + 18, slap_key.str, c_black, c_black, c_black, c_black, 1);
	
		var cx = 260, cy = 50;
		draw_sprite(chainsaw_key.sprite_index, chainsaw_key.image_index, cx, cy);
		if chainsaw_key.str != ""
			draw_text_color_new(cx + 16, cy + 18, chr(global.key_chainsaw), c_black, c_black, c_black, c_black, 1);
		draw_set_align();
		
		if simuplayer.state == states.titlescreen
		{
			simuplayer.state = states.actor;
			grab_pos = val ? 100 : 280;
			kungfu_pos = val ? 280 : 100;
		}
		else
		{
			grab_pos = lerp(grab_pos, val ? 100 : 280, 0.35);
			kungfu_pos = lerp(kungfu_pos, val ? 280 : 100, 0.35);
		}
		
		if simuplayer.state == states.titlescreen or simuplayer.image >= sprite_get_number(simuplayer.sprite)
		{
			simuplayer.sprite = choose(spr_player_kungfu1, spr_player_kungfu2, spr_player_kungfu3);
			simuplayer.image = 0;
		}
		simuplayer.image += 0.35;
		
		draw_sprite(spr_player_suplexdash, super.image_index, grab_pos, 130);
		draw_sprite(simuplayer.sprite, simuplayer.image, kungfu_pos, 130);
	});

	#endregion
	#region SHOOT BUTTON

	var opt = add_option("shootbutton", function(val)
	{
		static grab_pos = 0, shotgun_pos = 0, pistol_pos = 0;
		var grab_target_pos = 0, shotgun_target_pos = 0, pistol_target_pos = 0;
		
		var slap_key = tdp_get_icon(tdp_input_get("player_slap").actions[0]);
		var shoot_key = tdp_get_icon(tdp_input_get("player_shoot").actions[0]);
		
		shader_set(global.Pal_Shader);
		pal_swap_set(spr_peppalette, 1, false);
	
		draw_set_font(lang_get_font("tutorialfont"));
		if val == 0
		{
			var cx = 180, cy = 50;
			draw_sprite(slap_key.sprite_index, slap_key.image_index, cx, cy);
			draw_set_align(1, 1);
			draw_text_color_new(cx + 16, cy + 18, slap_key.str, c_black, c_black, c_black, c_black, 1);
			draw_set_align();
			
			shotgun_target_pos = 200 + 100;
			grab_target_pos = 200 - 100;
			pistol_target_pos = 200;
		}
		else if val == 1
		{
			var cx = 80, cy = 50;
			draw_sprite(slap_key.sprite_index, slap_key.image_index, cx, cy);
			draw_set_align(1, 1);
			draw_text_color_new(cx + 16, cy + 18, slap_key.str, c_black, c_black, c_black, c_black, 1);
			draw_set_align();
			
			grab_target_pos = cx;
			
			var cx = width - 120, cy = 50;
			draw_sprite(shoot_key.sprite_index, shoot_key.image_index, cx, cy);
			draw_set_align(1, 1);
			draw_text_color_new(cx + 16, cy + 18, shoot_key.str, c_black, c_black, c_black, c_black, 1);
			draw_set_align();
			
			pistol_target_pos = cx - 25;
			shotgun_target_pos = cx + 50;
		}
		else if val == 2
		{
			var cx = 80, cy = 50;
			draw_sprite(slap_key.sprite_index, slap_key.image_index, cx, cy);
			draw_set_align(1, 1);
			draw_text_color_new(cx + 16, cy + 18, slap_key.str, c_black, c_black, c_black, c_black, 1);
			draw_set_align();
			
			grab_target_pos = cx - 20;
			pistol_target_pos = cx + 50;
			
			var cx = width - 120, cy = 50;
			draw_sprite(shoot_key.sprite_index, shoot_key.image_index, cx, cy);
			draw_set_align(1, 1);
			draw_text_color_new(cx + 16, cy + 18, shoot_key.str, c_black, c_black, c_black, c_black, 1);
			draw_set_align();
			
			shotgun_target_pos = cx + 20;
		}
		
		if simuplayer.state == states.titlescreen
		{
			simuplayer.state = states.normal;
			shotgun_pos = shotgun_target_pos;
			grab_pos = grab_target_pos;
			pistol_pos = pistol_target_pos;
		}
		else
		{
			shotgun_pos = lerp(shotgun_pos, shotgun_target_pos, 0.35);
			grab_pos = lerp(grab_pos, grab_target_pos, 0.35);
			pistol_pos = lerp(pistol_pos, pistol_target_pos, 0.35);
		}
		
		draw_sprite(spr_shotgun_idle, simuplayer.image, shotgun_pos, 130);
		draw_sprite(spr_player_suplexdash, simuplayer.image, grab_pos, 130);
		draw_sprite(spr_player_pistolidle, simuplayer.image, pistol_pos, 130);
	
		shader_reset();
	});
	opt.opts = [
		["off", false],
		["on", true],
		["shotgunonly", 2]
	]

	#endregion
	#region INPUT DISPLAY

	var opt = add_button("inputdisplay", function()
	{
		with super
			switch_submenu("inputdisplay");
	},
	function()
	{
		var xx = width / 2, yy = height / 2;
		with obj_inputdisplay
		{
			scr_init_input();
			draw_inputdisplay(xx - maxx / 2, yy - maxy / 2);
		}
	});
	opt.small = false;
	opt.allow_preset = false;

	#endregion
	
	refresh_options();
}

with new ModSection("visual", 2)
{
	#region RICH PRESENCE
	
	var opt = add_option("richpresence", function(val)
	{
		var wd = 960 / 2.5;
		var ht = 540 / 2.5;
	
		draw_clear($E66054);
		gpu_set_blendmode(bm_normal);
		
		if val
		{
			draw_set_font(lfnt("tvbubblefont"));
			draw_set_align();
			draw_text(8 + 16, 8 + 16, lstr("mod_drpc1"));
			
			draw_sprite_ext(spr_discord_big_icon, 0, 8 + 16 + 2, 8 + 64 + 2, 1, 1, 0, c_black, 0.25);
			draw_sprite_ext(spr_discord_big_icon, 0, 8 + 16, 8 + 64, 1, 1, 0, c_white, 1);
			
			draw_set_font(lang_get_font("font_small"));
			draw_text(8 + 146, 8 + 100, concat("Pizza Tower Together\n", lstr("mod_drpc3")));
		}
		else
		{
			draw_set_font(lfnt("comicsans"));
			draw_set_align(fa_center);
			draw_text_transformed(wd / 2, ht / 2 - 20, lstr("mod_drpc2"), 2, 2, 0);
		}
	});
	opt.allow_preset = false;
	
	#endregion
	#region PANIC BG

	if !global.performance
	{
		var opt = add_option("panicbg", function(val)
		{
			if val
			{
				shader_set(shd_panicbg);
		
				shader_set_uniform_f(shader_get_uniform(shd_panicbg, "panic"), 1);
				shader_set_uniform_f(shader_get_uniform(shd_panicbg, "time"), current_time / 1000);
		
				draw_sprite_tiled_ext(bg_desertescape, super.image_index, 0, 0, 0.4, 0.4, c_white, 1);
		
				shader_reset();
			}
			else
				draw_sprite_ext(bg_desertescape, super.image_index, 0, 0, 0.4, 0.4, 0, c_white, 1);
		});
		opt.opts = [
			["off", false],
			["on", true],
			["onblur", 2]
		]
	}

	#endregion
	#region SMOOTH CAM

	add_slider("smoothcam", [0, 0.75], function(val)
	{
		static smoothcamx = 960 / 5;
		
		var p = simuplayer;
		if p.state == states.titlescreen
		{
			p.state = states.normal;
			p.sprite = spr_player_idle;
			p.x = 960 / 5;
			p.xscale = 1;
		}
	
		if ((p.xscale == 1 && p.x < 960 / 5 + 120)
		or (p.xscale == -1 && p.x > 960 / 5 - 120))
		&& p.timer == 0
		{
			p.move = p.xscale;
			p.timer = 0;
		}
		else
		{
			if p.timer == 0
			{
				p.move = 0;
				p.xscale *= -1;
			}
			p.timer++;
		
			if p.timer >= 50
				p.timer = 0;
		}
	
		smoothcamx = lerp(p.x, smoothcamx, val * 1.25);
		draw_set_colour(c_white);
		draw_set_alpha(1);
		//draw_rectangle(smoothcamx - 960 / 10, p.y - 540 / 10, smoothcamx + 960 / 10, p.y + 540 / 10, true);
	
		draw_sprite_ext(spr_micnoise2, super.image_index, smoothcamx, p.y + Wave(-90, -80, 1, 0), p.xscale, 1, 0, c_white, 1);
	
		draw_simuplayer();
	});

	#endregion
	#region HUD

	var opt = add_option("hud", function(val)
	{
		var xx = width / 2;
		var yy = height / 2;
		
		if val == hudstyles.final
		{
			draw_sprite_ext(spr_tv_bgfinal, 1, xx, yy, 1, 1, 0, c_white, 1);
			draw_sprite(spr_tv_idle, super.image_index, xx, yy);
		}
		if val == hudstyles.old
		{
			draw_sprite(spr_pepinoHUD, super.image_index, xx, yy - 8);
			draw_sprite(spr_speedbar, 0, xx, yy + 32);
		}
		if val == hudstyles.april
		{
			draw_sprite_ext(spr_tv_aprilbg, 0, xx, yy, 1, 1, 0, c_white, 1);
			draw_sprite(spr_tv_idle_NEW, super.image_index, xx, yy);
		}
		if val == hudstyles.minimal
		{
			yy -= 10;
			var pad = 20;
			
			draw_set_font(global.minimal_number);
			draw_set_align(fa_center);
			draw_text(xx, round(yy - pad), "1230");
			
			var wd = sprite_get_width(spr_combobar_minimal), ht = sprite_get_height(spr_combobar_minimal);
			draw_set_mask(xx - wd / 2, yy - ht / 2 + pad, spr_combobar_minimal, 1);
			draw_sprite_tiled(spr_combofill_minimal, 0, -current_time / 100, yy - ht / 2 + pad);
			draw_reset_clip();
			
			draw_sprite(spr_combobar_minimal, 0, xx - wd / 2, round(yy - ht / 2 + pad));
			draw_sprite(spr_combocursor_minimal, 0, xx + wd / 2 - 12, round(yy - ht / 2 + 3 + pad));
			
			pal_swap_set(spr_numpalette_minimal, 3);
			draw_text(xx, round(yy - ht / 2 + pad + 2), "30");
			pal_swap_reset();
		}
	});
	opt.opts = [
		["old", hudstyles.old],
		["april", hudstyles.april],
		["minimal", hudstyles.minimal],
		["final", hudstyles.final],
	]

	#endregion
	#region TV COLOR
	
	if !ds_map_exists(global.Pal_Map, spr_tv_palette)
		pal_swap_index_palette(spr_tv_palette);
	var opt = add_option("tvcolor", function(val)
	{
		var xx = width / 2, yy = height / 2;
		var hud = global.hud;
		
		if hud == hudstyles.final
		{
			draw_sprite_ext(spr_tv_bgfinal, 1, xx, yy, 1, 1, 0, c_white, 1);
			draw_sprite(spr_tv_idle, super.image_index, xx, yy);
		}
		if hud == hudstyles.april
		{
			draw_sprite_ext(spr_tv_aprilbg, 0, xx, yy, 1, 1, 0, c_white, 1);
			draw_sprite(spr_tv_idle_NEW, super.image_index, xx, yy);
		}
		
		var c = val == tvcolors.normal ? 0 : val;
		pal_swap_set(spr_tv_palette, c);
		
		if hud == hudstyles.final
			draw_sprite(spr_tv_empty, 0, xx, yy);
		if hud == hudstyles.old
			draw_sprite(spr_tvdefault, 0, xx, yy);
		if hud == hudstyles.april
			draw_sprite(spr_tv_empty, 0, xx, yy);
		if hud == hudstyles.minimal
		{
			draw_set_font(lfnt("font_small"));
			draw_set_align(fa_center, fa_middle);
			var c = (val == tvcolors.normal ? c_white : pal_swap_get_pal_color(spr_tv_palette, val, 0));
			draw_set_color(merge_color(c, c_white, 0.5));
			tdp_draw_text(xx, yy, "(Incompatible with Minimal HUD)");
			tdp_text_commit(0, 0, width, height);
		}
		
		pal_swap_reset();
	});
	opt.opts = [
		["normal", tvcolors.normal],
		["purple", tvcolors.purple],
		["yellow", tvcolors.yellow],
		["brown", tvcolors.brown],
		["red", tvcolors.red],
		["green", tvcolors.green],
		["orange", tvcolors.orange],
		["pink", tvcolors.pink],
		["blue", tvcolors.blue],
		["metal", tvcolors.metal],
		["gutter", tvcolors.gutter],
	]
	
	#endregion
	#region CUSTOMIZE
	
	var opt = add_button("hudcustomize", function()
	{
		super.visible = false;
		instance_create_depth(0, 0, super.depth - 1, obj_hudcustomizer);
	},
	function()
	{
		static timer = 0;
		timer += 0.03;
		
		var xx = width / 2 + cos(current_time / 500) * 50;
		var yy = height / 2 + sin(current_time / 500) * 50;
		
		switch floor(timer)
		{
			default:
				timer = 0;
			
			case 0:
				draw_sprite(spr_tv_empty, 0, xx, yy);
				break;
			
			case 1:
				draw_sprite(spr_fuelHUD, 0, xx, yy);
				break;
			
			case 2:
				draw_sprite(spr_heatmeter, current_time / 50, xx, yy);
				break;
			
			case 3:
				draw_sprite(spr_pizzascore, current_time / 50, xx, yy);
				break;
			
			case 4:
				draw_sprite(spr_combobar_minimal, 0, xx, yy);
				break;
			
			case 5:
				draw_sprite(spr_pepinoHUD, current_time / 50, xx, yy);
				break;
		}
	});
	opt.allow_preset = false;
	
	#endregion
	#region BLOCKS

	var opt = add_option("blockstyle", function(val)
	{
		if val == 0
		{
			draw_sprite(spr_towerblock, 0, 960 / 5 - 32 - 80, 540 / 5 - 32);
			draw_sprite(spr_towerblocksmall, 0, 960 / 5 - 16, 540 / 5 - 16);
			draw_sprite(spr_metaltowerblock, 0, 960 / 5 - 32 + 80, 540 / 5 - 32);
		}
		if val == 1
		{
			draw_sprite(spr_bigdestroy, super.image_index, 960 / 5 - 32 - 80, 540 / 5 - 32);
			draw_sprite(spr_destroyable, super.image_index, 960 / 5 - 16, 540 / 5 - 16);
			draw_sprite(spr_metalb, super.image_index, 960 / 5 - 32 + 80, 540 / 5 - 32);
		}
		if val == 2
		{
			draw_sprite(spr_bigdestroy_old, 0, 960 / 5 - 32 - 80, 540 / 5 - 32);
			draw_sprite(spr_destroyable_old, 0, 960 / 5 - 16, 540 / 5 - 16);
			draw_sprite(spr_metaltowerblock, 0, 960 / 5 - 32 + 80, 540 / 5 - 32);
		}
	}, true);
	opt.opts = [
		["old", 2],
		["september", 1],
		["final", 0],
	]

	#endregion
	#region ROOM NAMES

	var opt = add_option("roomnames", function(val)
	{
		static rname_y = -50;
		if val
			rname_y = Approach(rname_y, 32, 5);
		else
			rname_y = Approach(rname_y, -50, 1);
		
		gpu_set_blendmode(bm_normal);
		
		var xi = width / 2, yy = rname_y;
		draw_sprite_tiled(bg_secret, super.image_index, current_time / 100, current_time / 100);
		draw_sprite(spr_roomnamebg, 0, xi, yy);
		
		draw_set_font(lang_get_font("smallfont"));
		
		var yo = 8 - 3;
		if draw_font_is_ttf()
			yo += 8;
		
		draw_set_align(fa_center, fa_middle);
		draw_set_color(c_white);
		
		tdp_draw_text_ext(xi, yy + yo, lstr("mod_ballsack"), 14, 300); // BALLSACK CITY
		tdp_text_commit(0, 0, width, height);
		
		draw_set_align();
	});

	#endregion
	#region SLOPE ROTATION

	var opt = add_option("sloperot", function(val)
	{
		var slopex = 132;
		draw_sprite_ext(spr_slope, 0, slopex, 94 + 32, 2, 2, 0, c_white, 1);
		draw_sprite_ext(spr_slope, 0, slopex + 32 * 4, 94 + 32, -2, 2, 0, c_white, 1);
	
		var p = simuplayer;
		if p.state == states.titlescreen
		{
			p.x = 50;
			p.state = states.actor;
			p.vsp = 0;
			p.sprite = spr_player_move;
			p.xscale = 1;
		}
	
		p.image += p.hsp / 10;
		if p.x > slopex + 32 * 4
		{
			p.angle = lerp(p.angle, 0, 0.5);
			p.y = 144;
			p.hsp = Approach(p.hsp, 5, 0.2);
		}
		else if p.x > slopex + 32 * 2
		{
			var slop = slopex + 32 * 2;
		
			p.angle = lerp(p.angle, -35, 0.3);
			p.y = lerp(144, 144 - 64, 1 - clamp((p.x - slop) / (32 * 2), 0, 1));
			p.hsp = 3;
		}
		else if p.x > slopex
		{
			p.angle = lerp(p.angle, 35, 0.5);
			p.y = lerp(144, 144 - 64, clamp((p.x - slopex) / (32 * 2), 0, 1));
			p.hsp = 3;
		}
		else
		{
			p.angle = lerp(p.angle, 0, 0.5);
			p.y = 144;
			p.hsp = 5;
		}
		if val == 0
			p.angle = 0;
	
		draw_simuplayer();
	});

	#endregion
	#region AFTERIMAGES

	var opt = add_option("afterimage", [seq_afterimages_eggplant, seq_afterimages_final]);
	opt.opts = [
		["eggplant", 1],
		["final", 0],
	]

	#endregion
	if SUGARY_SPIRE
	{
		#region SUGARY OVERRIDES
	
		var opt = add_option("sugaryoverride", function(val)
		{
			var wd = 960 / 2.5, ht = 540 / 2.5;
	
			/*
			var seconds = (60 * 10) - ((current_time / 1000) % (60 * 10));
			var minutes = floor(seconds / 60);
			seconds = floor(seconds % 60);
			*/
	
			if val
			{
				draw_sprite(spr_escapecollect_ss, super.image_index, 80, 50);
				draw_sprite(spr_escapecollectbig_ss, super.image_index, 250, 50 - 16);
		
				draw_sprite(spr_bartimer_normalBack, super.image_index, wd / 2, ht - 50);
				draw_sprite(spr_bartimer_normalFront, super.image_index, wd / 2, ht - 50);
		
				/*
				draw_set_align(1, 1);
				draw_set_font(lang_get_font("sugarypromptfont"));
				draw_text(wd / 2 - 11, ht - 50 - 20, concat(minutes, ":", seconds < 10 ? "0" : "", seconds));
				*/
			}
			else
			{
				draw_sprite(spr_escapecollect, super.image_index, 80, 50);
				draw_sprite(spr_escapecollectbig, super.image_index, 250, 50 - 16);
		
				var _barpos = 100;
		
				var timer_x = wd / 2 - sprite_get_width(spr_timer_bar) / 2 - 30, timer_y = ht - 70;
		
				var clip_x = timer_x + 3;
				var clip_y = timer_y + 5;
		
				draw_set_bounds(clip_x, clip_y, clip_x + _barpos, clip_y + 30, true);
				draw_sprite_tiled(spr_timer_barfill, 0, clip_x + -current_time / 200, clip_y);
				draw_reset_clip();
		
				draw_sprite(spr_timer_bar, super.image_index, timer_x, timer_y);
				draw_sprite(spr_timer_johnface, super.image_index, timer_x + 13 + _barpos, timer_y + 20);
				draw_sprite(spr_timer_pizzaface1, super.image_index, timer_x + 320, timer_y + 10);
			}
		});

		#endregion
	}
	#region ENEMY SPIN

	/*
	var opt = add_option("enemyrot", function(val)
	{
		var xx = 960 / 2.5 / 2, yy = 540 / 2.5 / 2;
	
		if ++simuplayer.timer >= 10
		{
			simuplayer.timer = 0;
			add_particle(spr_cloudeffect, 0.5, xx + random_range(-50, 50), yy + random_range(-50, 50));
		}
	
		draw_sprite_ext(spr_slimedead, 0, xx, yy, 1, 1, -current_time / 2 * val, c_white, 1);
		draw_particles();
	});
	*/

	#endregion
	#region SHOW FPS

	showfps = 60;
	showfps_t = 60;

	var opt = add_option("showfps", function(val)
	{
		if showfps_t > 0
			showfps_t--;
		else
		{
			showfps = irandom_range(10, 60);
			showfps_t = 60;
		}
	
		simuplayer.image += 0.35 * (showfps / 60);
		simuplayer.state = states.actor;
	
		if val
		{
			draw_set_font(lang_get_font("font_small"));
			draw_set_colour(showfps < 30 ? (showfps < 15 ? c_red : c_yellow) : c_white);
			draw_set_align(fa_right);
			draw_text_transformed(960 / 2.5 - 20, 540 / 2.5 - 50, string(showfps), 2, 2, 0);
			draw_set_align();
		}
	
		shader_set(global.Pal_Shader);
		pal_swap_set(spr_peppalette, 1, false);
		draw_sprite_ext(spr_player_move, simuplayer.image, 960 / 2.5 / 4, 100, 2, 2, 0, c_white, 1);
		pal_swap_reset();
	});
	opt.allow_preset = false;

	#endregion
	#region COLORBLIND

	/*
	var opt = add_option("Colorblind Mode", "colorblind_type", "Applies a fullscreen shader that hopefully helps colorblindness.", function(val)
	{
		global.colorblind_type = val;
		draw_sprite_ext(spr_mirrored_level, 0, -258, -292, 0.9, 0.9, 0, c_white, 1);
	});
	opt.opts = [
		["NONE", -1],
		["PROTANOPIA", 0],
		["DEUTERANOPIA", 1],
		["TRITANOPIA", 2]
	]
	*/

	#endregion
	#region SECRET STYLE

	var opt = add_option("secrettiles", function(val)
	{
		static distance = 0;
		static alpha = 0;
	
		var p = simuplayer;
		if p.state == states.titlescreen
		{
			p.state = states.normal;
			p.timer = 0;
		}
		if ++p.timer >= 200
			p.timer = 0;
	
		distance = lerp(distance, (p.timer < 120) * 100, 0.15);
		alpha = Approach(alpha, (p.timer < 120) ? 0 : 1, 0.1);
	
		draw_sprite(spr_secretwall, val, -200, -100);
	
		shader_set(shd_secrettile);
		var u_bounds = shader_get_uniform(shd_secrettile, "u_secret_tile_bounds");
		var u_alpha = shader_get_uniform(shd_secrettile, "u_secret_tile_alpha");
		var u_remix = shader_get_uniform(shd_secrettile, "u_remix_flag");
		var u_alphafix = shader_get_uniform(shd_secrettile, "u_alphafix");
	
		shader_set_uniform_f(u_bounds, 373 - 200, 0, 960 / 2.5, 540 / 2.5);
		shader_set_uniform_f(u_alpha, 1 - alpha);
		shader_set_uniform_f(u_remix, val == 1);
		shader_set_uniform_f(u_alphafix, 0);
	
		if val == 1
		{
			var clip_distance = shader_get_uniform(shd_secrettile, "u_secret_tile_clip_distance");
			var clip_position = shader_get_uniform(shd_secrettile, "u_secret_tile_clip_position");
			var fade_size = shader_get_uniform(shd_secrettile, "u_secret_tile_fade_size");
			var fade_intensity = shader_get_uniform(shd_secrettile, "u_secret_tile_fade_intensity");

			shader_set_uniform_f(clip_distance, distance);
			shader_set_uniform_f(clip_position, Wave(960 / 5, 960 / 5 + 100, 2, 0), 540 / 5);
			shader_set_uniform_f(fade_size, global.secrettile_fade_size);
			shader_set_uniform_f(fade_intensity, global.secrettile_fade_intensity);
		}
		draw_sprite(spr_secretwall, !val, -200, -100);
		shader_reset();
	}, true);
	opt.opts = [
		["normal", 0],
		["spotlight", 1]
	]

	#endregion
	
	#region PERFORMANCE

	/*
	var opt = add_option("performance", function(val)
	{
	
	});
	*/

	#endregion
	
	refresh_options();
}

mode = 0; // 0 - normal, 1 - making preset
preset_options = ds_list_create();

with new ModSection("presets", 5)
{
	make_presets = function()
	{
		options_array = [];
		
		with add_preset(new ModPreset(lstr("mod_preset_default"), lstr("mod_preset_default_desc"))).preset
			preset_default();
	
		with add_preset(new ModPreset(lstr("mod_preset_vanilla"), lstr("mod_preset_vanilla_desc"))).preset
		{
			preset_default();
		
			gameplay = false; // REMIX
			uppercut = false; // buffed uppercut
			self.vigishoot = vigishoot.vanilla;
			panicbg = false;
			lap3checkpoint = false;
			self.chasekind = chasekind.none;
		}
	
		with add_preset(new ModPreset(lstr("mod_preset_loy"), lstr("mod_preset_loy_desc"))).preset
		{
			preset_default();
		
			attackstyle = attackstyles.kungfu;
			shootstyle = shootstyles.breakdance;
			doublegrab = doublestyles.faceplant;
			shootbutton = 2;
			panicbg = false;
			self.afterimage = 1;
			lapmode = lapmodes.laphell;
			parrypizzaface = true;
			lap3checkpoint = true;
			self.chasekind = chasekind.blocks;
		}
	
		with add_preset(new ModPreset(lstr("mod_preset_jayleno"), lstr("mod_preset_jayleno_desc"))).preset
		{
			iteration = IT.APRIL;
			uppercut = false;
			poundjump = true;
			attackstyle = attackstyles.shoulderbash;
			shootstyle = shootstyles.pistol;
			doublegrab = doublestyles.chainsaw;
			heatmeter = true;
			self.afterimage = 0;
			hud = hudstyles.old;
			blockstyle = blockstyles.old;
			lapmode = lapmodes.april;
			parrypizzaface = false;
		}
		
		if !directory_exists("presets")
		{
			directory_create("presets");
			
			var file = file_text_open_write(game_save_id + "presets/readme.txt");
			file_text_write_string(file, "No subfolders, silly.");
			file_text_close(file);
		}
		else
		{
			var file = file_find_first(game_save_id + "presets/*.json", fa_none);
			while file != ""
			{
				var buffer = buffer_load(game_save_id + "presets/" + file);
				var content = buffer_read(buffer, buffer_text);
				buffer_delete(buffer);
				
				try
				{
					var json = json_parse(content, undefined, undefined);
					
					var preset = new ModPreset(json.name, json.desc);
					preset.preset_copy_struct(json.options);
					
					with add_preset(preset)
					{
						custom = true;
						filename = "presets/" + file;
					}
				}
				catch (e)
				{
					audio_play_sound(sfx_pephurt, 0, false, global.option_master_volume * global.option_sfx_volume);
					show_message(concat(embed_value_string(lstr("mod_preset_failed"), [file]), "\n\n", e));
				}
				
				file = file_find_next();
			}
		}
		
		if super.mode == 2
		{
			sel = array_length(options_array);
			keyboard_string = "";
			
			with add_preset(new ModPreset("", lstr("mod_preset_new_desc")))
				typing = true;
		}
		
		add_padding();
	
		var opt = add_button("newpreset", function()
		{
			if super.mode == 0
			{
				ds_list_clear(super.preset_options);
				super.mode = 1;
			}
			else
			{
				if ds_list_size(super.preset_options) == 0
					super.mode = 0;
				else
				{
					super.mode = 2;
					make_presets();
				}
			}
		});
		
		var opt = add_button("deletepreset", function()
		{
			super.mode = 3;
		});
		opt.allow_preset = false;
		
		var opt = add_button("openpreset", function()
		{
			launch_external($"explorer.exe \"{game_save_id}presets\\\"");
		});
		opt.allow_preset = false;
	
		refresh_options();
	}
	make_presets();
}

scr_menu_getinput();
if key_attack
{
	with new ModSection("secret", 3)
	{
		var opt = add_option("goonmode");
		
		refresh_options();
	}
}

switch_submenu = function(menu)
{
	submenu = menu;
	alpha = -1;
	submenu_t = 0;
	
	submenus[? menu].sel = 0;
	refresh_sequence();
}

submenu = noone;
submenus = ds_map_create();
submenus_array = [];
submenu_t = 0;
submenu_title_pos = [0, 0];

var lap_submenu = new ModSection("lap", 0, submenus_array);
with lap_submenu
{
	lap = 2;
	
	var infinite_preview = function()
	{
		static player_array = undefined;
		static shake = 0;
		
		var p = simuplayer;
		if p.changed or player_array == undefined
		{
			lap = 2;
			
			player_array = [];
			repeat 5
			{
				array_push(player_array, {
					timer: 0,
					spd: random_range(0.03, 0.07),
					sprite: choose(spr_player_mach4, spr_player_crazyrun, spr_player_hurtwalk, spr_player_backslide, spr_player_breakdance),
					vsp: 0,
					yo: 0
				});
			}
			
			p.changed = false;
			p.timer = 0;
			p.state = 0;
		}
		
		for(var i = 0; i < array_length(player_array); i++)
		{
			var this = player_array[i];
			
			this.timer = Approach(this.timer, 1, this.spd);
			
			var xx = lerp(width + 50, width / 2 - 100, this.timer);
			var yy = height / 2 + 50;
			
			draw_sprite_ext(spr_chargeeffect, current_time / 50, xx, yy + this.yo, -1, 1, 0, c_white, 1);
			draw_sprite_ext(this.sprite, current_time / 50 + i, xx, yy + this.yo, -1, 1, 0, c_white, 1);
			
			with this
			{
				if yo >= 0
				{
					vsp = 0;
					yo = 0;
				}
				if yo == 0 && irandom(50) == 0
					vsp = -11;
				if vsp < 0 && irandom(20) == 0
					vsp = 0;
				yo += vsp;
				vsp += 0.5;
			}
			
			if this.timer >= 1
			{
				this.yo = 0;
				this.timer = 0;
				p.state = 1;
				super.image_index = 0;
				lap++;
				shake = 4;
			}
		}
		shake = Approach(shake, 0, 0.5);
		
		var lap_x = width / 2 - 142;
		var lap_y = height / 2;
		
		draw_sprite(p.state == 1 ? spr_pizzaportalend : spr_pizzaportal, super.image_index, lap_x, lap_y);
		if p.state == 0
			lang_draw_sprite(spr_lap2warning, 1, lap_x, lap_y + Wave(-5, 5, 0.5, 5));
		
		// lap test
		var lap_text = string(lap);
		var wd = 39 * string_length(lap_text);
		
		for(var i = 1; i <= string_length(lap_text); i++)
		{
			var lx = width - 8 + (39 * i) - wd - 64;
			var ly = 8;
			var letter = ord(string_char_at(lap_text, i)) - ord("0");
			draw_sprite(spr_lapfontbig, letter, lx + random_range(-shake, shake), ly + random_range(-shake, shake));
		}
		lang_draw_sprite(spr_lap2, 2, width - wd - 64, 0);
	}
	var gerome_preview = function()
	{
		static drop_array = undefined;
		static gerome_x = -50;
		
		var p = simuplayer;
		if p.changed or drop_array == undefined
		{
			p.changed = false;
			p.timer = 0;
			
			drop_array = [];
			repeat 10
				array_push(drop_array, {i: choose(0, 1), x: irandom_range(50, width - 50), y: -50, image: 0});
		}
		
		draw_sprite(spr_treasureeffect, current_time / 50, width / 2 + 70, 62 - 35);
		draw_sprite(spr_player_gottreasure, current_time / 50, width / 2 + 70, 62);
		draw_sprite(spr_treasure1, 0, width / 2 + 70 - 18, 62 - 35);
		draw_sprite(spr_treasurepillar, 0, width / 2 + 74, 108);
		
		var yy = height / 2 + 50;
		for(var i = 0; i < array_length(drop_array); i++)
		{
			var this = drop_array[i];
			
			this.y = Approach(this.y, yy + 30, 10);
			if this.y == yy + 30
				this.image = Approach(this.image, 4, 0.35);
			
			draw_sprite(this.i ? spr_goop2 : spr_goop, this.image, this.x, this.y);
		}
		
		p.timer = Approach(p.timer, 1, 0.05);
		if p.timer >= 1
		{
			p.timer = 0;
			array_shift(drop_array);
			array_push(drop_array, {i: choose(0, 1), x: irandom_range(50, width - 50), y: -50, image: 0});
		}
		
		gerome_x = Approach(gerome_x, drop_array[0].x, 20);
		draw_sprite(spr_gerome_idle1, super.image_index, gerome_x, yy);
	}
	
	var opt = add_option("lapmode", [seq_lapmode_normal, seq_lapmode_laphell, infinite_preview, gerome_preview], true);
	opt.opts = [
		["normal", lapmodes.normal],
		["laphell", lapmodes.laphell],
		["infinite", lapmodes.infinite],
		["gerome", lapmodes.april],
	];
	
	var opt = add_option("parrypizzaface", function(val)
	{
		static taunt_image = 0;
		static taunt_effect = -1;
		static state = 0;
		static pizzaface = undefined;
		
		var p = simuplayer;
		if p.changed or pizzaface == undefined
		{
			p.changed = false;
			p.state = states.actor;
			p.timer = 0;
			p.x = width / 2;
			p.hsp = 0;
			p.move = 0;
			p.xscale = 1;
			
			state = 0;
			taunt_effect = -1;
			pizzaface = {
				visible: false,
				x: 0,
				y: 0,
				hsp: 0,
				vsp: 0
			}
		}
		
		if taunt_effect != -1
		{
			draw_sprite_ext(spr_taunteffect, taunt_effect, width / 2, p.y, 1, 1, 0, c_white, 1);
			
			taunt_effect += 0.35;
			if taunt_effect >= sprite_get_number(spr_taunteffect)
				taunt_effect = -1;
		}
		
		if pizzaface.visible
		{
			draw_sprite_ext(spr_pizzahead_intro1, current_time / 50, pizzaface.x, pizzaface.y, 1, 1, 0, c_white, 1);
			pizzaface.x += pizzaface.hsp;
			pizzaface.y += pizzaface.vsp;
			pizzaface.vsp += 0.5;
		}
		
		switch state
		{
			case 0:
			case 1:
				p.timer = Approach(p.timer, 1, 0.04);
				
				var px = lerp(width + 100, width / 2 + 50, p.timer);
				var py = lerp(0, height / 2 + 20, p.timer);
				draw_sprite(spr_pizzaface, current_time / 50, px, py);
				
				if p.timer >= 0.8 && state == 0
				{
					//sound_play_centered(sfx_taunt);
					state = 1;
					taunt_image = irandom(sprite_get_number(spr_player_taunt));
					taunt_effect = 0;
				}
				draw_sprite(state == 1 ? spr_player_taunt : spr_player_idle, state == 1 ? taunt_image : current_time / 50, p.x, p.y);
				
				if p.timer >= 1
				{
					//sound_play_centered(sfx_groundpound);
					if val
					{
						//sound_play_centered(sfx_parry);
						state = 3;
						
						p.state = states.actor;
						p.sprite = choose(spr_player_parry1, spr_player_parry2, spr_player_parry3);
						p.image = 0;
						p.hsp = -8;
						
						pizzaface.visible = true;
						pizzaface.x = px;
						pizzaface.y = py;
						pizzaface.vsp = random_range(-10, -18);
						pizzaface.hsp = random_range(10, 18);
					}
					else
					{
						p.timer = 0;
						state = 2;
						taunt_effect = -1;
					}
				}
				break;
			
			case 2:
				p.timer += 0.35;
				if p.timer >= sprite_get_number(spr_player_timesup)
				{
					p.changed = true;
					break;
				}
				
				draw_set_color(c_black);
				draw_set_alpha(0.5);
				draw_rectangle(0, 0, width, height, false);
				draw_set_alpha(1);
				
				draw_sprite(spr_player_timesup, p.timer, p.x, p.y);
				break;
			
			case 3:
				draw_simuplayer();
				
				if p.state == states.actor
				{
					p.image += 0.35;
					if p.image >= sprite_get_number(p.sprite)
						p.state = states.normal;
					p.hsp = Approach(p.hsp, 0, 0.5);
				}
				else if p.timer++ >= 30
				{
					p.move = 1;
					if p.x >= width / 2
						p.changed = true;
				}
				break;
		}
	});
	
	var opt = add_option("lap3checkpoint", [seq_lap3checkpoint_off, seq_lap3checkpoint_on]);
	opt.condition = function()
	{
		return [global.lapmode == lapmodes.laphell, lstr("mod_condition_lap3checkpoint")];
	}
	
	var opt = add_option("chasekind", [seq_levelchanges_none, seq_levelchanges_lapblocks, seq_levelchanges_slowdown], true);
	opt.opts = [
		["none", chasekind.none],
		["levelchanges", chasekind.blocks],
		["slowdown", chasekind.slowdown],
	];
	opt.condition = function()
	{
		return [global.lapmode == lapmodes.laphell, lstr("mod_condition_lap3checkpoint")];
	}
	
	refresh_options();
};
ds_map_set(submenus, "lap", lap_submenu);

var inputdisplay_submenu = new ModSection("inputdisplay", 0, submenus_array);
with inputdisplay_submenu
{
	var input = function()
	{
		var xx = width / 2, yy = height / 2;
		with obj_inputdisplay
		{
			scr_init_input();
			draw_inputdisplay(xx - maxx / 2, yy - maxy / 2);
		}
	};
	
	var opt = add_option("inputdisplay", input);
	
	var opt = add_slider("keyalpha", , input);
	opt.vari_target = obj_inputdisplay;
	
	refresh_options();
}
ds_map_set(submenus, "inputdisplay", inputdisplay_submenu);
