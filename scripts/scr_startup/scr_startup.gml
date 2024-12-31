// optimizations
gml_pragma("forceinline");
surface_depth_disable(true); // disable the depth buffer.
gpu_set_sprite_cull(true);

function toggle_texture_debug(enable)
{
	texturegroup_set_mode(true, enable, spr_missing);
}
toggle_texture_debug(false);

if DEBUG
	debug_event("OutputDebugOn");

// crash handler
exception_unhandled_handler
(
	function(e)
	{
		// force stop all sound
		audio_stop_all();
		with obj_fmod
		{
			fmod_event_instance_set_paused_all(true);
			fmod_update();
		}
		
		// fallback to default audio engine for this
		audio_bus_main.bypass = true;
		audio_master_gain(1);
		audio_play_sound(sfx_pephurt, 0, false, global.option_master_volume * global.option_sfx_volume);
		
		// take a screenshot
		try
		{
			var surf = surface_create(SCREEN_WIDTH, SCREEN_HEIGHT);
			surface_set_target(surf);
			
			draw_clear(c_black);
			gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
			
			scr_draw_screen(0, 0, 1, 1, 1, true);
			if instance_exists(obj_screensizer) && surface_exists(obj_screensizer.gui_surf)
				draw_surface(obj_screensizer.gui_surf, 0, 0);
			
			gpu_set_blendmode(bm_normal);
			surface_reset_target();
			
			surface_save(surf, "crash_img.png");
			surface_free(surf);
		}
		catch (h)
		{
			trace(h);
		}
		
		// show and log the crash
	    show_debug_message(string(e));
		show_message($"The game crashed!\n\n---\n\n{e.longMessage}\n---\n\nstacktrace: {e.stacktrace}");
		
		// save it to a file
		var _f = file_text_open_write(save_folder + "crash_log.txt");
		file_text_write_string(_f, json_stringify(e));
		file_text_close(_f);
	}
);

// failsafe
if !directory_exists(exe_folder + "data")
{
	audio_play_sound(sfx_pephurt, 0, false);
	show_message("Can't see data folder.\n\nIt could be that the working directory is wrong. Make sure the game is extracted to its own folder before playing.");
	game_end();
	exit;
}

// drama
#macro SUGARY_SPIRE 0
#macro DEATH_MODE 0
#macro BO_NOISE 0

// macros
if GM_build_type == "run"
	global.debug_mode = true;

#macro DEBUG (GM_build_type == "run" && (global[$ "debug_mode"] ?? true))
#macro YYC code_is_compiled()
#macro PLAYTEST 0

if !YYC
{
	if code_is_compiled()
	{
		show_message("You forgot to set the YYC flag moron.");
		game_end();
	}
}

#macro STRING_UNDEFINED "<undefined>"
#macro CAMX camera_get_view_x(view_camera[0])
#macro CAMY camera_get_view_y(view_camera[0])
#macro CAMW camera_get_view_width(view_camera[0])
#macro CAMH camera_get_view_height(view_camera[0])
#macro DATE_TIME_NOW concat(current_year, "-", current_month, "-", current_day, "__", current_hour, "-", current_minute, "-", current_second)
#macro GAME_PAUSED (instance_exists(obj_pause) && obj_pause.pause) or instance_exists(obj_popupscreen)

#macro WINDOWS (os_type == os_windows)
#macro SWITCH (os_type == os_switch)

#macro PANIC check_panic()
function check_panic()
{
	if !global.panic && !global.snickchallenge
		return false;
	if instance_exists(obj_ghostcollectibles) && !(global.leveltosave == "sucrose" or global.leveltosave == "secretworld")
		return false;
	if global.lapmode == LAP_MODES.april && string_ends_with(room_get_name(room), "_treasure")
		return false;
	return true;
}
function funny_room()
{
	game_end();
}

// initialize
scr_get_languages();
pal_swap_init_system_fix(shd_pal_swapper, true);
texture_debug_messages(DEBUG);

// fonts
global.bigfont = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ!¡¿?.1234567890:ÁÄÃÀÂÉÈÊËÍÌÎÏÓÖÕÔÒÚÙÛÜÇ+()[]',\"-_▼&#*", true, 0);
global.smallfont = font_add_sprite_ext(spr_smallerfont, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZ!¡.:?¿1234567890ÁÄÃÀÂÉÈÊËÍÌÎÏÓÖÕÔÒÚÙÛÜÇ+", true, 0);
global.lapfont = font_add_sprite_ext(spr_lapfont, "1234567890", true, -1);
global.lapfont2 = font_add_sprite_ext(spr_lapfontbig, "0123456789", true, -2);
global.tutorialfont = font_add_sprite_ext(spr_tutorialfont, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz!¡,.:0123456789'?¿-áäãàâæéèêëíìîïóöõôòúùûüÿŸÁÄÃÀÂÉÈÊËÍÌÎÏÓÖÕÔÒÚÙÛÜÇçœß;«»+", true, 2);
global.creditsfont = font_add_sprite_ext(spr_creditsfont, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz.:!¡0123456789?'\"ÁÄÃÀÂÉÈÊËÍÌÎÏÓÖÕÔÒÚÙÛÜáäãàâéèêëíìîïóöõôòúùûüÇç_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнльœ«»+ß", true, 2);
global.moneyfont = font_add_sprite_ext(spr_stickmoney_font, "0123456789$-", true, 0);
global.font_small = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz¡!._1234567890:;¿?▯|*/',\"()=-+@█%~ÁÄÃÀÂÉËÈÊÍÏÌÎÓÖÕÒÔÚÜÙÛáäãàâéëèêíïìîóöõòôúüùûÑñ[]<>${}«»#", true, -1);
global.collectfont = font_add_sprite_ext(spr_font_collect, "0123456789", true, 0);
global.combofont = font_add_sprite_ext(spr_font_combo, "0123456789/:", true, 0);
global.combofont2 = font_add_sprite_ext(spr_tv_combobubbletext, "0123456789", true, 0);
global.wartimerfont1 = font_add_sprite_ext(spr_wartimer_font1, "1234567890", true, 0);
global.wartimerfont2 = font_add_sprite_ext(spr_wartimer_font2, "1234567890", true, 0);
global.minimal_number = font_add_sprite_ext(spr_numbers_minimal, "0123456789:", false, 1);
global.smallnumber_fnt = font_add_sprite_ext(spr_smallnumber, "1234567890-+", true, 0);
global.lap3scorefont = font_add_sprite_ext(spr_lap3scorefont, "1234567890", false, 1);
global.lap3lapfont = font_add_sprite_ext(spr_lap3lapfont, "1234567890", true, 0);

if SUGARY_SPIRE
{
	global.collectfontSP = font_add_sprite_ext(spr_font_collectSP, "0123456789", true, 0);
	global.combofontSP = font_add_sprite_ext(spr_tv_combobubbletextSP, "1234567890x", true, 0);
	global.smallfont_ss = font_add_sprite_ext(spr_smallfont_ss, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.:?1234567890-", true, 0);
	global.bigfont_ss = font_add_sprite_ext(spr_font_ss, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.0123456789:- ", true, -1);
	global.candlefont = font_add_sprite_ext(spr_fontcandle, "0123456789", true, 0);
	global.lapfont2_ss = font_add_sprite_ext(spr_lapfontbig_ss, "0123456789", true, -2);
	global.lapfont_ss = font_add_sprite_ext(spr_lapfont_ss, "1234567890", true, -1);
	global.sugarypromptfont = global.creditsfont;
}
if BO_NOISE
{
	global.collectfontBN = font_add_sprite_ext(spr_font_collectBN, "0123456789", true, 0);
	global.combofont2BN = font_add_sprite_ext(spr_tv_combobubbletextBN, "0123456789", true, 0);
}

// language font map
global.font_map = ds_map_create();

ds_map_set(global.font_map, "bigfont_en", global.bigfont);
ds_map_set(global.font_map, "smallfont_en", global.smallfont);
ds_map_set(global.font_map, "tutorialfont_en", global.tutorialfont);
ds_map_set(global.font_map, "creditsfont_en", global.creditsfont);
ds_map_set(global.font_map, "captionfont_en", fnt_caption);

ds_map_set(global.font_map, "font_small_en", global.font_small);
ds_map_set(global.font_map, "comicsans_en", font0);
ds_map_set(global.font_map, "tvbubblefont_en", font1);
ds_map_set(global.font_map, "dos_en", fnt_dos);

if SUGARY_SPIRE
{
	ds_map_set(global.font_map, "sugarypromptfont_en", global.sugarypromptfont);
	ds_map_set(global.font_map, "smallfont_ss_en", global.smallfont_ss);
	ds_map_set(global.font_map, "bigfont_ss_en", global.bigfont_ss);
}

// key = "en"
trace("--- Custom fonts --- size: ", ds_map_size(global.lang_map));

font_add_enable_aa(false);
for(var key = ds_map_find_first(global.lang_map); key != undefined; key = ds_map_find_next(global.lang_map, key))
{
	var lang = global.lang_map[? key]; // {lang: "en", text1: "", ...}
	if lang[? "custom_fonts"] != true
		continue;
	
	trace("Loading fonts for language ", lang[? "display_name"]);
	
	var font = ds_map_find_first(global.font_map);
	while font != undefined
	{
		var fontname = string_replace(font, "_en", "");
		
		var ret = lang_get_custom_font(fontname, lang);
		if is_undefined(ret)
			ret = lang_get_font(fontname);
		else if is_string(ret)
		{
			audio_play_sound(sfx_pephurt, 0, false);
			show_message(concat("ERROR loading font \"", fontname, "\" in language \"", lang[? "display_name"],"\"\n\n", ret));
			ret = lang_get_font(fontname);
		}
		
		ds_map_set(global.font_map, string_replace(font, "_en", concat("_", key)), ret);
		font = ds_map_find_next(global.font_map, font);
	}
}

global.custom_palettes = [];
global.custom_patterns = ds_map_create();

// etc
global.disclaimer_section = 0;
global.goodmode = false; // makes everything a living nightmare
global.sandbox = true;
global.saveloaded = false;

global.secrettile_clip_distance = 150; // distance before we cut off tiles
global.secrettile_fade_size = 0.85; // distance before we start to fade
global.secrettile_fade_intensity = 32; // dropoff intensity

#macro heat_nerf (IT_heat_nerf() ? 5 : 1) // divides the style gain by this
#macro heat_lossdrop (IT_heat_nerf() ? 0.1 : 0.05) // speed of global.style loss
#macro heat_timedrop (IT_heat_nerf() ? 0.5 : 0.25) // speed of global.heattime countdown
