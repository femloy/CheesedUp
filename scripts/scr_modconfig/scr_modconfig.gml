load_mod_config();
global.lap4time = 1;

// macros
#macro REMIX global.gameplay
#macro IT_FINAL (global.iteration == IT.FINAL)
#macro IT_APRIL (global.iteration == IT.APRIL)
#macro IT_BNF (global.iteration == IT.BNF)

enum IT
{
	FINAL, // Do not change the order of these
	APRIL, // It would mess up savefiles.
	BNF
}
enum blockstyles
{
	final,
	september,
	old
}
enum hudstyles
{
	final,
	old,
	april,
	minimal,
	debug
}
enum attackstyles
{
	grab,
	kungfu,
	shoulderbash,
	lunge
}
enum shootstyles
{
	none,
	pistol,
	breakdance
}
enum doublestyles
{
	none,
	shoulderbash,
	faceplant,
	chainsaw
}
enum borderstyles
{
	none = -1,
	space,
	dynamic
}
enum lapmodes
{
	normal,
	infinite,
	laphell,
	april
}
enum chasekind
{
	none,
	blocks,
	slowdown
}
enum lap4mode
{
	preset,
	elm
}
enum vigishoot
{
	pto,
	vanilla
}
enum tvcolors
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

// default / presets
function ModPreset(name = "PRESET", desc = "Wow that's Cray Zay!") constructor
{
	preset_name = name;
	preset_desc = desc;
	
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
		iteration = IT.FINAL;
		gameplay = true; // misc. improvements on or off?
		
		// gameplay settings
		uppercut = true; // *buffed uppercut*
		poundjump = false;
		attackstyle = attackstyles.grab;
		shootstyle = shootstyles.none;
		doublegrab = doublestyles.none;
		shootbutton = 0; // 0 replace grab, 1 move to A, 2 only shotgun
		heatmeter = false;
		swapgrab = false;
		hitstun = 1; // 0 off, 1 on, 2 early
		banquet = true; // mod that got merged into base game
		eggplantslope = false;
		
		// vigi gameplay
		self.vigishoot = vigishoot.pto;
		
		// visual settings
		panicbg = true;
		panictilt = false;
		sloperot = false;
		showfps = false;
		self.afterimage = 0; // final, eggplant
		smoothcam = 0; // 0 through 1 lerp amount
		secrettiles = 0; // fade, spotlight
		hud = hudstyles.final;
		blockstyle = blockstyles.final;
		roomnames = false;
		if SUGARY_SPIRE
			sugaryoverride = false;
		tvcolor = tvcolors.normal;
		
		// lapping style
		lapmode = lapmodes.normal;
		parrypizzaface = false;
		lap3checkpoint = true;
		self.chasekind = chasekind.blocks; // none, place blocks, slow down
	}
}

function load_mod_config()
{
	if instance_exists(obj_savesystem)
		ini_open_from_string(obj_savesystem.ini_str_options);
	else
		ini_open(save_folder + "saveData.ini");
	
	// read or set
	var preset_default = new ModPreset();
	preset_default.preset_default();
	
	with preset_default
	{
		var vars = struct_get_names(self);
		for(var i = 0, n = array_length(vars); i < n; ++i)
		{
			if string_starts_with(vars[i], "preset_")
				continue;
			
			if ini_key_exists("Modded", vars[i])
			{
				var value = ini_read_real("Modded", vars[i], 0);
				variable_global_set(vars[i], value);
			}
			else
			{
				trace("[LOAD] Defaulting global.", vars[i], " to ", self[$ vars[i]]);
				variable_global_set(vars[i], self[$ vars[i]]);
			}
		}
	}
	
	global.lap4checkpoint = global.lap3checkpoint;
	
	global.richpresence = ini_read_real("Modded", "richpresence", true);
	global.experimental = ini_read_real("Modded", "experimental", DEBUG);
	global.performance = ini_read_real("Modded", "performance", false);
	global.unfocus_pause = ini_read_real("Modded", "unfocus_pause", false);
	global.holidayoverride = ini_read_real("Modded", "holidayoverride", -1);
	global.border = ini_read_real("Modded", "border", borderstyles.none);
	
	global.minimal_pad = ini_read_real("Modded", "minimal_pad", 0);
	global.minimal_combospot = ini_read_real("Modded", "minimal_combospot", 0);
	global.minimal_rankspot = ini_read_real("Modded", "minimal_rankspot", 0);
	
	global.inputdisplay = ini_read_real("Modded", "inputdisplay", false);
	
	global.record_replay = false;
	global.replay_limit = 1000000 * 5; // in bytes, 5 MB
	
	// Online (James)
	global.online_player_opacity = ini_read_real("Modded", "online_player_opacity", 1);
	global.online_name_opacity = ini_read_real("Modded", "online_name_opacity", 1);
	global.online_streamer_mode = ini_read_real("Modded", "online_streamer_mode", 0);
	
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
