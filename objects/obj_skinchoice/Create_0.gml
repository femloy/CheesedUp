live_auto_call;
event_inherited();

// animation
init = false;
charshift = [0, 0, 0];
player_surface = surface_create(256, 256);
shown_tip = false;

custom_enable = false;
custom_palette = array_create(64, 1);

// selection
show_unlock = false;
noisetype = noisetype.base;
sel =
{
	pal: 1,
	char: 0,
	mix: 0,
	side: 0,
	page: 0,
	mixpage: 0
};
sel_p2 =
{
	pal: 1,
	char: 0,
	mix: 0
};
flashpal = [-1, 0];
swapmode = false;

characters = [];
scr_characters(true);

// set in user event 0
palettes = [];
mixables = [];
unlockables = [];
custom_palettes = global.custom_palettes;

if !global.sandbox
{
	array_push(unlockables, "unfunny", "money", "sage", "blood", "tv", "dark", "shitty", "golden", "garish", "mooney",
		"funny", "itchy", "pizza", "stripes", "goldemanne", "bones", "pp", "war", "john",
		"candy", "bloodstained", "bat", "pumpkin", "fur", "flesh");
	
	array_push(unlockables, "boise", "roise", "poise", "reverse", "critic", "outlaw", "antidoise", "flesheater", "super", "porcupine", "feminine", "realdoise", "forest",
		"racer", "comedian", "banana", "noiseTV", "madman", "bubbly", "welldone", "grannykisses", "towerguy");
}
array_push(unlockables, "mario", "grinch");

// palette struct
function DresserPalette() constructor
{
	entry = noone;
	palette = 0;
	texture = noone;
	name = "PALETTE";
	description = "(No Description)";
	color = c_black;
	mix_color = c_black;
	mix_prefix = "";
	unlock_desc = lstr("dresser_sandbox");
	mixable = false;
	
	set_entry = function(entry)
	{
		unlock_desc = lstr(concat("dresser_", entry));
		
		if array_get_index(obj_skinchoice.unlockables, entry, 0, infinity) == -1
			return self;
		
		ini_open_from_string(obj_savesystem.ini_str_options);
		if !ini_read_real("Palettes", entry, false)
		{
			var pals = obj_skinchoice.palettes;
			for(var i = 0; i < array_length(pals); i++)
			{
				if pals[i] == self
				{
					array_delete(obj_skinchoice.palettes, i, 1);
					ini_close();
					break;
				}
			}
			
			var pals = obj_skinchoice.mixables;
			for(var i = 0; i < array_length(pals); i++)
			{
				if pals[i].entry == entry
				{
					array_delete(obj_skinchoice.mixables, i, 1);
					ini_close();
					break;
				}
			}
		}
		ini_close();
		
		return self;
	}
	set_prefix = function(prefix = undefined)
	{
		if prefix == undefined
			prefix = lstr(mix_prefix);
		if string_pos("-", prefix) != string_length(prefix)
			prefix = prefix + " ";
		
		array_push(obj_skinchoice.mixables, {
			palette: palette,
			prefix: prefix,
			name: name,
			color: mix_color,
			entry: entry
		});
		return self;
	}
	set_palette = function(palette)
	{
		self.palette = palette;
		return self;
	}
}

function add_palette(palette, lang_entry = undefined)
{
	if lang_entry == undefined
	{
		if is_handle(palette)
			lang_entry = string_replace(sprite_get_name(palette), "spr_", "");
		else
		{
			var character = characters[sel.char].char;
			if character == "G"
				character = "P";
			lang_entry = concat("dresser_", character, palette);
		}
	}
	
	var st = new DresserPalette();
	with st
	{
		if is_handle(palette)
		{
			self.palette = 12;
			self.texture = palette;
			self.mixable = true;
		}
		else
			self.palette = palette;
		
		self.name = lstr(lang_entry);
		self.description = lstr(concat(lang_entry, "D"));
		self.color = pal_swap_get_pal_color(other.characters[other.sel.char].spr_palette, self.palette, other.characters[other.sel.char].color_index);
		self.mix_color = pal_swap_get_pal_color(other.characters[other.sel.char].spr_palette, self.palette, other.characters[other.sel.char].mixing_color);
		self.mix_prefix = concat(lang_entry, "_mix");
	}
	
	array_push(palettes, st);
	return st;
}
self.add_palette = add_palette;

function add_custom_palette(name = "CUSTOM PALETTE", description = "", color_array = array_create(64, 1))
{
	var st =
	{
		name: name,
		description: description,
		color_array: color_array
	};
	array_push(custom_palettes, st);
	array_push(global.custom_palettes, st);
}
self.add_custom_palette = add_custom_palette;

// automatically select character
if instance_exists(obj_player1)
{
	var pchar = obj_player1.character;
	if pchar == "P"
	{
		if obj_player1.isgustavo
			pchar = "G";
	}
	
	for(var i = 0, n = array_length(characters); i < n; ++i)
	{
		if pchar == characters[i].char
			sel.char = i;
	}
	noisetype = obj_player1.noisetype;
}

// DO THE FUNNY
event_user(0);

// functions
select = function()
{
	var custom = sel.side == 2;
	if custom && sel.pal >= array_length(custom_palettes)
		var pal = noone;
	else
		var pal = custom ? custom_palettes[sel.pal] : palettes[sel.pal];
	
	if pal == noone && submenu != 1
		exit;
	
	with obj_player1
	{
		var prevchar = character, prevpal = paletteselect;
		var prevtex = global.palettetexture, prevnoise = noisetype;
		var prevcolors = global.Base_Pattern_Color;
		
		// apply it
		character = other.characters[other.sel.char].char;
		noisetype = other.noisetype;
		
		if state == states.ratmount
			state = states.normal;
		isgustavo = false;
		
		if check_char("G")
		{
			ratmount_movespeed = 8;
			gustavodash = 0;
			isgustavo = true;
			state = states.ratmount;
			sprite_index = spr_ratmount_idle;
			brick = true;
		}
		scr_characterspr();
		
		/*custom_palette = custom;
		if !custom*/
		
		{
			if other.sel.mix > 0
				paletteselect = other.mixables[other.sel.mix].palette;
			else
				paletteselect = other.palettes[other.sel.pal].palette;
			global.palettetexture = other.palettes[other.sel.pal].texture;
		}
		
		/*else
		{
			global.palettetexture = noone;
			custom_palette_array = other.submenu == 1 ? other.custom_palette : pal.color_array;
		}*/
		
		player_paletteselect[player_paletteindex] = paletteselect;
		player_patterntexture[player_paletteindex] = global.palettetexture;
		
		if global.swapmode
			global.swap_characters[global.swap_index] = character;
		
		// refresh character dependent stuff
		if character != prevchar
		{
			with obj_tutorialbook
			{
				if is_callable(refresh_func)
				{
					refresh_func();
					event_perform(ev_other, ev_room_start);
				}
			}
			instance_destroy(obj_stick);
			with obj_stick_forsale
				first = false;
			with obj_startgate
			{
				if room == tower_3
				{
					if sprite_index == spr_gate_noise && other.character == "N"
					{
						msg = lstr("boss_doise");
						sprite_index = spr_gate_doise;
						bgsprite = spr_gate_doiseBG;
					}
					if sprite_index == spr_gate_doise && other.character != "N"
					{
						msg = lstr("boss_noise");
						sprite_index = spr_gate_noise;
						bgsprite = spr_gate_noiseBG;
					}
				}
				if room == tower_2
				{
					if sprite_index == spr_gate_vigilante && other.character == "V"
					{
						msg = lstr("boss_snotty");
						sprite_index = spr_gate_snotty;
						bgsprite = spr_gate_snottyBG;
					}
					if sprite_index == spr_gate_snotty && other.character != "V"
					{
						msg = lstr("boss_vigilante");
						sprite_index = spr_gate_vigilante;
						bgsprite = spr_gate_vigilanteBG;
					}
				}
			}
			with obj_costumednoise
			{
				if sprite_index == spr_costumednoise && other.character == "N"
				{
					y += 50;
					sprite_index = spr_playerN_animatronic;
					image_xscale = 1;
					create_particle(x, y, part.genericpoofeffect);
				}
				if sprite_index == spr_playerN_animatronic && other.character != "N"
				{
					create_particle(x, y, part.genericpoofeffect);
					y -= 50;
					sprite_index = spr_costumednoise;
				}
			}
		}
		
		// if nothing changed, don't save
		if !(!custom && character == prevchar && paletteselect == prevpal && global.palettetexture == prevtex && noisetype == prevnoise)
		{
			// setup animation
			with instance_create(x, y, obj_genericpoofeffect)
				depth = -10;
			if character != prevchar
			{
				instance_create(x, y, obj_parryeffect);
				sound_play_3d(sfx_collecttoppin, x, y);
				sound_play_3d(sfx_killenemy, x, y);
				xscale = 1;
				visible = false;
			}
			else
				sound_play_3d("event:/sfx/misc/clotheswitch", x, y);
			
			with instance_create(x, y, obj_sausageman_dead)
			{
				hsp = irandom_range(2, 5) * choose(-1, 1);
				vsp = -irandom_range(6, 11);
				usepalette = true;
				
				switch prevchar
				{
					case "P": case "G":
						spr_palette = spr_peppalette;
						sprite_index = spr_palettedresserdebris;
						break;
					case "SP":
						spr_palette = spr_pizzypalette;
						sprite_index = spr_palettedresserdebris;
						break;
					case "N":
						spr_palette = spr_noisepalette;
						sprite_index = spr_palettedresserdebrisN;
						break;
					case "V":
						spr_palette = spr_vigipalette;
						sprite_index = spr_palettedresserdebrisV;
						break;
					case "S":
						spr_palette = spr_snickpalette;
						sprite_index = spr_palettedresserdebrisS;
						break;
					case "M":
						spr_palette = -1;
						sprite_index = spr_palettedresserdebrisM;
						break;
					default:
						sprite_index = -1;
						break;
				}
				
				if other.character != prevchar
				{
					switch prevchar
					{
						case "P": sprite_index = spr_player_dead; break;
						case "N": sprite_index = spr_playerN_hurt; break;
						case "V": sprite_index = spr_playerV_dead; break;
						case "G": sprite_index = spr_player_ratmounthurt; break;
						case "S": sprite_index = spr_snick_stunned; break;
						case "M": sprite_index = spr_pepperman_hurtplayer; break;
						case "SP": sprite_index = spr_playerSP_hurt; break;
						case "SN": sprite_index = spr_pizzano_hurt; break;
					}
				}
				
				paletteselect = prevpal;
				oldpalettetexture = prevtex;
				pattern_color = prevcolors;
			}
			
			// save
			if character != "D"
			{
				var pat = global.palettetexture;
				if !sprite_exists(pat)
					pat = "none";
				else
					pat = sprite_get_name(pat);
			
				ini_open_from_string(obj_savesystem.ini_str);
				ini_write_string("Game", "character", character);
				ini_write_real("Game", "palette", paletteselect);
				ini_write_string("Game", "palettetexture", pat);
				obj_savesystem.ini_str = ini_close();
				gamesave_async_save();
			}
		}
		else
			sound_play(sfx_back);
	}
	anim_con = 2;
}
postdraw = function(curve)
{
	if anim_con == 2 && !obj_player1.visible
	{
		handx = lerp(handx, SCREEN_WIDTH / 2, 0.15);
		handy = lerp(handy, -50, 0.15);
		var curve2 = animcurve_channel_evaluate(jumpcurve, 1 - anim_t);
		
		var custom = sel.side == 2;
		if submenu == 1
			var pal = noone;
		else
			var pal = custom ? custom_palettes[sel.pal] : palettes[sel.pal];
		
		var charx = SCREEN_WIDTH / 2 + sideoffset + charshift[0] * 75, chary = SCREEN_HEIGHT / 2 - 32 + charshift[1] * 75, scale = clamp(lerp(1, 2, curve), 1, 2);
		
		charx = lerp(charx, obj_player1.x - camera_get_view_x(view_camera[0]), 1 - anim_t);
		chary = lerp(chary, obj_player1.y - camera_get_view_y(view_camera[0]), curve2);
		
		shader_set(global.Pal_Shader);
		
		if custom
		{
			pal_swap_set(characters[sel.char].spr_palette, 0, false);
			cuspal_set(pal == noone ? custom_palette : pal.color_array);
		}
		else
		{
			if pal.texture != noone
				pattern_set(characters[sel.char].pattern_color_array, characters[sel.char].spr_idle, -1, scale, scale, pal.texture);
			pal_swap_set(characters[sel.char].spr_palette, sel.mix > 0 ? mixables[sel.mix].palette : pal.palette, false);
		}
		
		draw_sprite_ext(characters[sel.char].spr_idle, image_index, charx, chary, scale, scale, 0, c_white, 1);
		cuspal_reset();
		pattern_reset();
		pal_swap_reset();
	}
}

draw_skin_palette = function(_x, _y, _color, _alpha)
{
	if _color == undefined
		_color = c_white;
	
	vertex_build_quad(vertex_buffer, 
		// Where to draw the sprite on screen
		_x, _y, sprite_get_width(spr_skinchoicepalette), sprite_get_height(spr_skinchoicepalette),
		_color, _alpha,
		//where to get the texture on the sheet
		uv_info.left, uv_info.top, (uv_info.right - uv_info.left), (uv_info.bottom - uv_info.top)
	);
}

player_draw = function(charx, chary, sel_char, pal, sel_mix)
{
	var wd = 256, ht = 256;
	var xx = wd / 2, yy = ht / 2;
	
	if !surface_exists(player_surface)
		player_surface = surface_create(wd, ht);
	
	surface_set_target(player_surface);
	draw_clear_alpha(c_white, 0);
	
	if anim_con != 2 or obj_player1.visible
	{
		// special skins
		if characters[sel_char].char == "N"
		{
			if check_skin(SKIN.n_chungus, "N", pal.palette)
			{
				characters[sel_char].spr_idle = spr_playerN_chungus;
				if noisetype == noisetype.pogo
				{
					draw_set_font(lang_get_font("font_small"));
					draw_set_align(fa_center);
					draw_set_colour(c_white);
						
					draw_text(charx, chary - 68, "Pogo");
				}
			}
			else
			{
				switch noisetype
				{
					case noisetype.base: characters[sel_char].spr_idle = spr_playerN_idle; break;
					case noisetype.pogo: characters[sel_char].spr_idle = spr_playerN_pogofallmach; break;
				}
			}
		}
		if characters[sel_char].char == "P"
		{
			characters[sel_char].spr_idle = spr_player_idle;
			if check_skin(SKIN.p_peter, "P", pal.palette)
				characters[sel_char].spr_idle = spr_player_petah;
		}
		
		if check_skin(SKIN.cosmic, undefined, undefined, pal.texture)
			draw_cosmic_clone(characters[sel_char].spr_idle, image_index, xx, yy, 1, 1, 0, c_white, 1);
		else if pal != noone or submenu == 1
		{
			shader_set(global.Pal_Shader);
			if pal.texture != noone
				pattern_set(characters[sel_char].pattern_color_array, characters[sel_char].spr_idle, image_index, 1, 1, pal.texture);
			pal_swap_set(characters[sel_char].spr_palette, sel_mix > 0 ? mixables[sel_mix].palette : pal.palette, false);
			
			draw_sprite(characters[sel_char].spr_idle, image_index, xx, yy);
			
			pattern_reset();
			pal_swap_reset();
		}
		else
			draw_sprite_ext(characters[sel_char].spr_idle, 0, xx, yy, 1, 1, 0, c_black, 1);
	}
	surface_reset_target();
	toggle_alphafix(false);
	
	if curve < 1
		draw_set_spotlight(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, (SCREEN_WIDTH / (960 / 560)) * curve);
	draw_surface_ext(player_surface, charx - 256, chary - 256, 2, 2, 0, c_white, curve * charshift[2]);
}

draw = function(curve)
{
	#region Animation
	
	var curve2 = anim_t;
	if anim_con != 0
	{
		curve = 1; // actual animated curve
		curve2 = 1; // the timer
	}
	
	switch sel.side
	{
		case 0:
			sideoffset = lerp(sideoffset, swapmode ? 150 : 0, 0.25);
			break;
		case 1:
			sideoffset = lerp(sideoffset, -280, 0.25);
			break;
		case 2:
			sideoffset = lerp(sideoffset, 280, 0.25);
			break;
	}
	pageoffset = lerp(pageoffset, 0, 0.25);
	
	#endregion
	#region Character
	
	var charx = SCREEN_WIDTH / 2 + sideoffset + charshift[0] * 75, chary = SCREEN_HEIGHT / 2 - 32 + charshift[1] * 75;
	var pal = palettes[sel.pal];
	player_draw(charx, chary, sel.char, pal, sel.mix);
	
	if swapmode
	{
		player_draw(charx - sideoffset * 2, chary, sel.char, pal, sel.mix);
	}
	
	#endregion
	
	if submenu == 0
	{
		#region Text
		
		if pal == noone
		{
			var name = "", desc = "";
			if custom
			{
				name = lstr("dresser_new_title");
				desc = lstr("dresser_new_desc");
			}
		}
		else
		{
			var name = string_upper(pal.name), desc = show_unlock ? pal.unlock_desc : pal.description;
			if sel.mix > 0
			{
				var prefix = mixables[sel.mix].prefix;
				if string_starts_with(prefix, "-") // POSTFIX
					name = string_upper(pal.name + string_replace(prefix, "-", ""));
				else				
					name = string_upper(prefix + pal.name);
				desc = concat(mixables[sel.mix].name, " + ", pal.name);
			}
		}
	
		tdp_draw_set_font(lang_get_font("bigfont"));
		tdp_draw_set_align(fa_left, fa_top);
		
		var info = font_get_offset();
		var xx = (SCREEN_WIDTH / 2) - string_width(name) / 2;
		
		for(var i = 1; i <= string_length(name); i++)
		{
			var char = string_char_at(name, i);
		
			var yy = (SCREEN_HEIGHT / 2) + 130;
			if curve2 != 1 // letters jump up
				yy = lerp(SCREEN_HEIGHT, yy, min(animcurve_channel_evaluate(outback, curve2 + ((i % 3) * 0.075))));
			
			var d = (i % 2 == 0) ? -1 : 1;
			var _dir = floor(Wave(-1, 1, 0.1, 0));
			yy += _dir * d;
			
			tdp_draw_text(floor(xx) - info.x, floor(yy) - info.y, char);
			xx += string_width(char);
		}
		
		tdp_draw_set_halign(fa_center);
		draw_set_alpha(curve);
		tdp_draw_set_font(lang_get_font("font_small"));
		tdp_draw_text_ext(SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2) + 170, desc, 16, 600);
		draw_set_alpha(1);
		
		#endregion
		#region Palettes
	
		var palettecurve = (sideoffset + pageoffset) / -280;
		switch sel.side
		{
			case 0:
				if skin_tip > 0
				{
					skin_tip -= 0.025;
					draw_sprite_ext(spr_palettearrow, 0, SCREEN_WIDTH / 2 + Wave(180, 190, 1, 0), SCREEN_HEIGHT / 2, 1, 1, -90, c_white, skin_tip);
					//if DEBUG // 2.0
					//	draw_sprite_ext(spr_palettearrow, 0, SCREEN_WIDTH / 2 - Wave(180, 190, 1, 0), SCREEN_HEIGHT / 2, 1, 1, 90, c_white, skin_tip);
					
					tdp_draw_set_font(lang_get_font("smallfont"));
					tdp_draw_set_align(fa_center);
					draw_set_alpha(skin_tip);
					
					var info = font_get_offset();
					tdp_draw_text(SCREEN_WIDTH / 2 + Wave(180, 190, 1, 0) - info.x, SCREEN_HEIGHT / 2 + 20 - info.y, lstr("dresser_palettes"));
					
					tdp_draw_set_align();
				}
				break;
		
			case 1:
				skin_tip = 0;
				
				var xx = lerp(280 / 3, 0, palettecurve), yy = 0;
				var whole_x = screen_center_x(408), whole_y = screen_center_y(70);
				var array = !mixing ? palettes : mixables;
				
				draw_set_alpha(palettecurve);
				
				var max_column = 13;
				var max_total = max_column * 7; // 13 columns 7 rows
				var page_offset = max_total * (!mixing ? sel.page : sel.mixpage);
				var pal_size = 36;
				var length = min(array_length(array) - page_offset, max_total);
				
				if length < array_length(array) - page_offset
					draw_sprite_ext(spr_palettearrow, 0, whole_x + xx + (pal_size * max_column) + Wave(36, 42, 1, 0), whole_y + yy + (pal_size * 7) / 2, 1, 1, -90, c_white, 1);
				if (!mixing ? sel.page : sel.mixpage) > 0
					draw_sprite_ext(spr_palettearrow, 0, whole_x + xx - Wave(36, 42, 1, 0), whole_y + yy + (pal_size * 7) / 2, 1, 1, 90, c_white, 1);
				
				/*
				if curve < 1
				{
					var alphafix_pos = shader_get_uniform(shader_current(), "u_circle_alphafix");
					shader_set_uniform_f(alphafix_pos, 1);
				}
				*/
				
				for(var i = page_offset, n = array_length(array); i < n; ++i)
				{
					if i - page_offset >= max_total
						break;
					
					var xdraw = xx + ((i - page_offset) % max_column) * pal_size;
					var ydraw = yy + floor((i - page_offset) / max_column) * pal_size;
					
					// move hand, and shake current selection
					var sel_this = ((!mixing && sel.pal == i) or (mixing && sel.mix == i));
					if sel_this && anim_con != 2
					{
						handx = lerp(handx, 8 + whole_x + xdraw, 0.35);
						handy = lerp(handy, whole_y + ydraw, 0.35);
				
						xdraw += random_range(-0.7, 0.7);
						ydraw += random_range(-0.7, 0.7);
					}
					
					// special skins
					var special_icon = -1;
					if check_skin(SKIN.p_peter, characters[sel.char].char, array[i].palette)
						special_icon = 0;
					
					// draw it
					if flashpal[0] != i
					{
						reset_blendmode();
						draw_sprite_ext(spr_skinchoicepalette, 0, 2 + whole_x + xdraw, 2 + whole_y + ydraw, 1, 1, 0, c_black, 0.25 * draw_get_alpha());
						gpu_set_blendmode(bm_normal);
					}
					
					if flashpal[0] == i // flashing palette
					{
						draw_set_flash();
						draw_sprite_ext(spr_skinchoicepalette, 0, whole_x + xdraw, whole_y + ydraw, 1, 1, 0, c_white, draw_get_alpha());
						draw_reset_flash();
					}
					else if special_icon >= 0 // special palettes
						draw_sprite_ext(spr_skinchoicecustom, special_icon, whole_x + xdraw, whole_y + ydraw, 1, 1, 0, c_white, draw_get_alpha());
					else if mixing or array[i].texture == noone // palettes
						draw_sprite_ext(spr_skinchoicepalette, 0, whole_x + xdraw, whole_y + ydraw, 1, 1, 0, array[i].color, draw_get_alpha());
					else // patterns
					{
						draw_sprite_stretched(array[i].texture, current_time / 120, whole_x + xdraw + 1, whole_y + ydraw + 1, 30, 30);
						draw_sprite(spr_skinchoicepalette, 1, whole_x + xdraw, whole_y + ydraw);
					}
					
					if sel_this
						draw_sprite(spr_skinchoicepalette, 2, whole_x + xdraw, whole_y + ydraw);
				}
				toggle_alphafix(false);
				break;
			
			case 2:
				/*
				skin_tip = 0;
				var xx = lerp(-280 / 3, 0, -palettecurve), yy = 0;
				
				vertex_begin(vertex_buffer, vertex_format);
				draw_set_alpha(palettecurve);
				
				for(var i = 0, n = array_length(custom_palettes); i < n + 1; ++i)
				{
					var xdraw = xx + (i % 13) * 36, ydraw = yy + floor(i / 13) * 36;
					
					// move hand, and shake current selection
					if sel.pal == i && anim_con != 2
					{
						handx = lerp(handx, 8 + 80 + xdraw, 0.35);
						handy = lerp(handy, 70 + ydraw, 0.35);
						
						xdraw += random_range(-0.7, 0.7);
						ydraw += random_range(-0.7, 0.7);
					}
					
					if flashpal[0] == i // flashing palette
					{
						draw_set_flash();
						draw_sprite_ext(spr_skinchoicepalette, 0, 80 + xdraw, 70 + ydraw, 1, 1, 0, c_white, 1);
						draw_reset_flash();
					}
					else if i == array_length(custom_palettes)
					{
						draw_sprite_ext(spr_skinchoicepalette, 0, 2 + 80 + xdraw, 2 + 70 + ydraw, 1, 1, 0, c_black, 0.25);
						draw_sprite_ext(spr_skinchoicepalette, 1, 80 + xdraw, 70 + ydraw, 1, 1, 0, c_white, 1);
						
						draw_set_font(lang_get_font("captionfont"));
						draw_set_align(fa_center, fa_middle);
						draw_set_colour(c_white);
						draw_set_alpha(1);
						draw_text_outline(80 + xdraw + 15, 70 + ydraw + 15, "+", c_black, 2);
					}
					else
					{
						var this = custom_palettes[i];
						var col = make_colour_rgb(this.color_array[characters[sel.char].color_index * 4] * 255, this.color_array[characters[sel.char].color_index * 4 + 1] * 255, this.color_array[characters[sel.char].color_index * 4 + 2] * 255);
						var alpha = this.color_array[characters[sel.char].color_index * 4 + 3];
						
						draw_sprite_ext(spr_skinchoicepalette, 0, 2 + 80 + xdraw, 2 + 70 + ydraw, 1, 1, 0, c_black, 0.25);
						draw_sprite_ext(spr_skinchoicepalette, 0, 80 + xdraw, 70 + ydraw, 1, 1, 0, col, alpha);
					}
				}
				break;
				*/
		}
		
		#endregion
	}
	else if submenu == 1
	{
		var color_count = characters[sel.char].color_count;
		if color_count == noone
			color_count = sprite_get_height(characters[sel.char].spr_palette);
		
		var xx = 132, yy = 64;
		for(var i = 0; i < color_count; i++)
		{
			var xdraw = xx, ydraw = yy;
			if point_in_rectangle(mouse_x_gui, mouse_y_gui, xx, yy, xx + 32, yy + 32) && mouse_check_button_pressed(mb_left)
				sel.pal = i;
			
			if sel.pal == i
			{
				handx = lerp(handx, xdraw - 8, 0.35);
				handy = lerp(handy, ydraw + 16, 0.35);
				
				xdraw += random_range(-0.7, 0.7);
				ydraw += random_range(-0.7, 0.7);
			}
			
			var r = custom_palette[i * 4] * 255, g = custom_palette[i * 4 + 1] * 255, b = custom_palette[i * 4 + 2] * 255, a = custom_palette[i * 4 + 3] * 255;
			var col = make_colour_rgb(r, g, b);
			draw_sprite_ext(spr_skinchoicepalette, 0, xdraw, ydraw, 1, 1, 0, col, a);
			
			yy += 36;
			
			// current
			if sel.pal == i
			{
				draw_slider = function(ind, x, y, wd, ht, col, value = 0, black = c_black)
				{
					draw_rectangle_color(x - 1, y - 1, x + wd + 1, y + ht + 1, c_black, c_black, c_black, c_black, false);
					
					if ind == 3
						draw_sprite_stretched(spr_rainbow, 0, x, y, wd + 1, ht);
					else
						draw_rectangle_color(x, y, x + wd, y + ht - 1, black, col, col, black, false);
					
					var click = sel.mix == ind && anim_con != 2;
					if point_in_rectangle(mouse_x_gui, mouse_y_gui, x, y, x + wd, y + ht) or click
					{
						draw_sprite_ext(spr_creditsfont, 8, x + value * wd - 16 - click * 2, y - 6 - click * 2, click ? 1.1 : 1, click ? 1.1 : 1, 0, c_aqua, 1);
						if mouse_check_button_pressed(mb_left)
							sel.mix = ind;
						if click
							value = clamp((mouse_x_gui - x) / wd, 0, 1);
					}
					else
						draw_sprite(spr_creditsfont, 8, x + value * wd - 16, y - 6);
					
					return value;
				}
				if !mouse_check_button(mb_left)
					sel.mix = -1;
				
				static h = 0, s = 0, v = 0, prev = -1;
				var wd = 300, ht = 20, sliderx = 250, slidery = 90;
				
				draw_text(250, slidery, "RGB");
				slidery += 50;
				var r = draw_slider(0, sliderx, slidery, wd, ht, #FF0000, custom_palette[i * 4]); // RED
				slidery += ht + 16;
				var g = draw_slider(1, sliderx, slidery, wd, ht, #00FF00, custom_palette[i * 4 + 1]); // GREEN
				slidery += ht + 16;
				var b = draw_slider(2, sliderx, slidery, wd, ht, #0000FF, custom_palette[i * 4 + 2]); // BLUE
				
				slidery += 90;
				draw_text(250, slidery, "HSV");
				slidery += 50;
				h = draw_slider(3, sliderx, slidery, wd, ht, #FFFFFF, h); // HUE
				slidery += ht + 16;
				s = draw_slider(4, sliderx, slidery, wd, ht, make_colour_hsv(h * 255, 255, v * 255), s, make_colour_hsv(0, 0, v * 255)); // SAT
				slidery += ht + 16;
				v = draw_slider(5, sliderx, slidery, wd, ht, make_colour_hsv(h * 255, s * 255, 255), v); // VAL
				
				if sel.mix == 0 or sel.mix == 1 or sel.mix == 2
				or prev != sel.pal
				{
					if colour_get_hue(col) != 0 or h != 1
						h = colour_get_hue(col) / 255;
					if colour_get_saturation(col) != 0 or s != 1
						s = colour_get_saturation(col) / 255;
					if colour_get_value(col) != 0 or v != 1
						v = colour_get_value(col) / 255;
				}
				if sel.mix == 3 or sel.mix == 4 or sel.mix == 5
				{
					var col = make_colour_hsv(h * 255, s * 255, v * 255);
					r = colour_get_red(col) / 255;
					g = colour_get_green(col) / 255;
					b = colour_get_blue(col) / 255;
				}
				
				custom_palette[i * 4] = r;
				custom_palette[i * 4 + 1] = g;
				custom_palette[i * 4 + 2] = b;
			}
		}
		
		if prev != sel.pal
		{
			prev = sel.pal;
			sound_play(sfx_step);
		}
		
		if point_in_rectangle(mouse_x_gui, mouse_y_gui, 650, 120, 900, 320) && mouse_check_button_pressed(mb_left) && anim_con != 2
			select();
		
		// guide
		draw_set_font(lang_get_font("font_small"));
		draw_set_align(fa_center);
		
		var str = embed_value_string(lstr("dresser_new_help"), [chr(tdp_input_get("menu_back").actions[0].value)]);
		draw_text_ext_color(960 / 2 + 280 + 2, 380 + 2, str, 16, 350, 0, 0, 0, 0, 0.25);
		draw_text_ext(960 / 2 + 280, 380, str, 16, 350);
	}
	tdp_text_commit();
	
	#region Hand
	
	if handy > 0
		draw_sprite_ext(spr_skinchoicehand, 0, handx, handy + sin(current_time / 1000) * 4, 2, 2, 0, c_white, 1);
	draw_set_align();
	shader_reset();
		
	#endregion
}
handx = SCREEN_WIDTH / 2;
handy = -50;
sideoffset = 0;
skin_tip = 5;
pageoffset = 0;
