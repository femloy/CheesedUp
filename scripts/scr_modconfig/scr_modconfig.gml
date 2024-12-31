load_mod_config();
global.lap4time = 1;

// macros
#macro REMIX global.gameplay
enum BLOCK_STYLES
{
	final,     // Do not change the order of these
	september, // It would mess up save files.
	old
}
enum HUD_STYLES
{
	final,
	old,
	april,
	minimal,
	debug
}
enum BORDER_STYLES
{
	none = -1,
	space,
	dynamic
}
enum LAP_MODES
{
	normal,
	infinite,
	laphell,
	april
}
enum CHASE_KINDS
{
	none,
	blocks,
	slowdown
}
enum VIGI_STYLES
{
	pto,
	vanilla
}
enum TV_COLORS
{
	normal,
	purple,
	yellow,
	brown,
	pink,
	red,
	green,
	orange,
	blue,
	metal,
	gutter
}
enum GENERAL_STYLES
{
	pto,
	vanilla,
	plus
}
enum TASK_PAUSE_STYLES
{
	show,
	hide,
	hide_on_completion
}
enum AFTERIMAGES
{
	mach,
	blue
}
enum SHOOT_BUTTONS
{
	grab,
	shoot,
	shoot_for_shotgun
}
enum HITSTUN_STYLES
{
	none,
	final,
	early
}
enum SECRETTILE_STYLES
{
	fade,
	spotlight
}

// default / presets
#macro PRESET_VERSION 2

function ModPreset(name = "PRESET", desc = "Wow that's Cray Zay!", version = PRESET_VERSION) constructor
{
	preset_name = name;
	preset_desc = desc;
	preset_version = version;
	
	preset_copy_struct = function(struct)
	{
		// this allows for an exploit
		/*
		var vars = struct_get_names(struct);
		for(var i = 0, n = array_length(vars); i < n; ++i)
			self[$ vars[i]] = struct[$ vars[i]];
		*/
		
		var defaulter = new ModPreset();
		defaulter.preset_default();
		
		var vars = struct_get_names(defaulter);
		for(var i = 0, n = array_length(vars); i < n; ++i)
		{
			if struct[$ vars[i]] != undefined
				self[$ vars[i]] = struct[$ vars[i]];
		}
		
		delete defaulter;
	}
	
	preset_apply = function()
	{
		var vars = struct_get_names(self);
		for(var i = 0, n = array_length(vars); i < n; ++i)
		{
			if string_starts_with(vars[i], "preset_") or self[$ vars[i]] == undefined
				continue;
			
			trace("[PRESET] Setting ", vars[i], " to ", self[$ vars[i]]);
			variable_global_set(vars[i], self[$ vars[i]]);
		}
	}
	
	preset_default = function()
	{
		// mod config
		iteration = ITERATIONS.FINAL;
		gameplay = true; // REMIX
		
		// gameplay settings
		uppercut = true; // buffed uppercut
		poundjump = false;
		attackstyle = MOD_MOVES.grab;
		shootstyle = MOD_MOVES.none;
		doublegrab = MOD_MOVES.none;
		shootbutton = SHOOT_BUTTONS.grab;
		heatmeter = false;
		swapgrab = false;
		hitstun = HITSTUN_STYLES.final;
		banquet = true; // mod that got merged into base game
		eggplantslope = false;
		combokeeper = true;
		
		// vigi gameplay
		vigishoot = VIGI_STYLES.pto;
		
		// visual settings
		panicbg = true;
		panictilt = false;
		sloperot = false;
		showfps = false;
		self.afterimage = AFTERIMAGES.mach;
		smoothcam = 0; // 0 through 1 lerp amount
		secrettiles = SECRETTILE_STYLES.fade;
		hud = HUD_STYLES.final;
		blockstyle = BLOCK_STYLES.final;
		roomnames = false;
		if SUGARY_SPIRE
			sugaryoverride = false;
		tvcolor = TV_COLORS.normal;
		generalstyle = GENERAL_STYLES.pto;
		taskpausestyle = TASK_PAUSE_STYLES.hide;
		
		// lapping style
		lapmode = LAP_MODES.normal;
		parrypizzaface = false;
		lap3checkpoint = true;
		chasekind = CHASE_KINDS.blocks;
	}
	
	preset_from_opened_ini = function()
	{
		preset_default();
		
		if ini_section_exists("Modded")
		{
			var vars = struct_get_names(self);
			for(var i = 0, n = array_length(vars); i < n; ++i)
			{
				if string_starts_with(vars[i], "preset_")
					continue;
				if ini_key_exists("Modded", vars[i])
					self[$ vars[i]] = ini_read_real("Modded", vars[i], 0);
			}
			
			preset_version = ini_read_real("Modded", "preset_version", 1);
			preset_backwards();
		}
	}
	
	preset_backwards = function()
	{
		if preset_version < 2
		{
			trace("[PRESET] Updating to v2");
			
			switch attackstyle
			{
				default: attackstyle = MOD_MOVES.grab; break;
				case 1: shootstyle = MOD_MOVES.kungfu; break;
				case 2: shootstyle = MOD_MOVES.shoulderbash; break;
				case 3: shootstyle = MOD_MOVES.lunge; break;
			}
			
			switch shootstyle
			{
				default: shootstyle = MOD_MOVES.none; break;
				case 1: shootstyle = MOD_MOVES.pistol; break;
				case 2: shootstyle = MOD_MOVES.breakdance; break;
			}
			
			switch doublegrab
			{
				default: doublegrab = MOD_MOVES.none; break;
				case 1: doublegrab = MOD_MOVES.shoulderbash; break;
				case 2: doublegrab = MOD_MOVES.faceplant; break;
				case 3: doublegrab = MOD_MOVES.chainsaw; break;
			}
		}
	}
}

function load_mod_config()
{
	if instance_exists(obj_savesystem)
		ini_open_from_string(obj_savesystem.ini_str_options);
	else
		ini_open(save_folder + "saveData.ini");
	
	// read or set
	var mod_preset = new ModPreset();
	with mod_preset
	{
		preset_from_opened_ini();
		preset_apply();
	}
	
	// outside of preset
	global.lap4checkpoint = global.lap3checkpoint;
	
	global.richpresence = ini_read_real("Modded", "richpresence", true);
	global.experimental = ini_read_real("Modded", "experimental", DEBUG);
	global.performance = ini_read_real("Modded", "performance", false);
	global.unfocus_pause = ini_read_real("Modded", "unfocus_pause", false);
	global.holidayoverride = ini_read_real("Modded", "holidayoverride", -1);
	global.border = ini_read_real("Modded", "border", BORDER_STYLES.none);
	
	global.minimal_pad = ini_read_real("Modded", "minimal_pad", 0);
	global.minimal_combospot = ini_read_real("Modded", "minimal_combospot", 0);
	global.minimal_rankspot = ini_read_real("Modded", "minimal_rankspot", 0);
	
	global.inputdisplay = ini_read_real("Modded", "inputdisplay", false);
	
	global.record_replay = false;
	global.replay_limit = 1000000 * 5; // in bytes, 5 MB
	
	// online
	/*
	global.online_player_opacity = ini_read_real("Modded", "online_player_opacity", 1);
	global.online_name_opacity = ini_read_real("Modded", "online_name_opacity", 1);
	global.online_streamer_mode = ini_read_real("Modded", "online_streamer_mode", 0);
	*/
	
	// convert from islam (PTT 1.0)
	if ini_key_exists("Modded", "pizzellesugaryoverride")
	{
		if SUGARY_SPIRE
		{
			global.sugaryoverride = ini_read_real("Modded", "pizzellesugaryoverride", false);
			ini_write_real("Modded", "sugaryoverride", global.sugaryoverride);
		}
		ini_key_delete("Modded", "pizzellesugaryoverride");
		
		/*
		global.vigisuperjump = ini_read_real("Modded", "vigisuperjump", 0) ? 2 : 0;
		ini_write_real("Modded", "vigisuperjump", global.vigisuperjump);
		*/
		ini_key_delete("Modded", "vigisuperjump");
	}
	
	// PTU
	if ini_section_exists("ControlsKeysPTU")
		ini_section_delete("ControlsKeysPTU"); // REMOVES IT FROM CHEESED UP. NOT THE ORIGINAL FILE.
	if ini_section_exists("ControlsKeys2")
		ini_section_delete("ControlsKeys2");
	
	// fucked up
	if ini_key_exists("Modded", "infinitespeed")
	{
		show_message("PTFU modded config detected.\nShame on you. Removing it.");
		
		ini_key_delete("Modded", "infinitespeed");
		ini_key_delete("Modded", "spoilers");
		ini_key_delete("Modded", "sighting_2");
		ini_key_delete("Modded", "rpcstyle");
		ini_key_delete("Modded", "colorblind_type");
		ini_key_delete("Modded", "sugaryphysics");
	}
	
	// turn on performance mode
	/*
	if !shaders_are_supported() && !global.performance
	{
		show_message("It seems your device doesn't support shaders.\nPerformance mode has been turned on.");
		global.performance = true;
	}
	*/
	
	ini_close();
}
