if alarm[0] > 0
	exit;
if !active or !self.state or !instance_exists(obj_pause)
	exit;
if !global.richpresence
{
	np_clearpresence();
	exit;
}

// prep
var smallimagetext = "", largeimagetext = DEBUG ? "TEST" : GM_version;
var state = "", details = "", largeimage = "", smallimage = "";

largeimage = "big_icon";

// player character
if instance_exists(obj_player1)
{
	character = obj_player1.character;
	if obj_player1.isgustavo && character != "N"
		character = character == "V" ? "MORT" : "G";
}

smallimage = $"char_{string_lower(character)}";
smallimagetext = $"Playing as {scr_charactername(character, character == "G")}";

// status
if room == Mainmenu or room == Longintro or room == characterselect or room == Finalintro
	details = "Pre-Game";
else
	details = global.sandbox ? "Playing Sandbox" : "Playing Story";

if obj_pause.pause
	details = "Paused";
else if global.panic
{
	var minutes = 0;
	for (var seconds = ceil(global.fill / 12); seconds > 59; seconds -= 60)
		minutes++;
	if seconds < 10
		seconds = concat("0", seconds);
	
	if global.laps >= 2 && check_lap_mode(lapmodes.laphell)
		details = $"Lap {global.laps + 1}";
	else if global.laps > 0
		details = string("Lap {0} - {1}:{2} left", global.laps + 1, minutes, seconds);
	else
		details = string("Escaping - {0}:{1} left", minutes, seconds);
}
else if !instance_exists(obj_cyop_loader)
{
	var stack = [];
	if MOD.Encore
		array_push(stack, "Encore");
	if MOD.Mirror
		array_push(stack, MOD.HardMode or MOD.EasyMode ? "Mirrored" : "Mirror Mode");
	if MOD.EasyMode
		array_push(stack, MOD.HardMode ? "Easy" : "Easy Mode");
	if MOD.HardMode
		array_push(stack, "Hard Mode");
	
	var mods = struct_get_names(MOD);
	for (var i = 0; i < array_length(mods); i++)
	{
		if !MOD[$ mods[i]]
			continue;
		if array_contains(["Encore", "Mirror", "EasyMode", "HardMode", "OldLevels", "EscapeInvert"], mods[i])
			continue;
		array_push(stack, lstr(concat("mod_title_", string_lower(mods[i]))));
	}
	
	if MOD.OldLevels
		array_push(stack, "on old levels");
	
	if array_length(stack)
	{
		if array_length(stack) < 4
		{
			details = "Playing";
			while array_length(stack)
				details += $" {array_shift(stack)}";
		}
		else
			details = concat("Playing with ", array_length(stack), " modifiers");
	}
}
else
{
	var count = 0;
	var mods = struct_get_names(MOD);
	for (var i = 0; i < array_length(mods); i++)
	{
		if !MOD[$ mods[i]]
			continue;
		count++;
	}
	
	details = "Playing CYOP";
	if count > 0
		details += concat(" with ", count, " modifiers");
	
	if global.cyop_level_name != "Level Name" && global.cyop_level_name != ""
		state = string(global.cyop_level_name);
	else
		state = string(global.cyop_tower_name);
}

if global.goodmode
	details = "Enduring Good Mode";

if !instance_exists(obj_startgate)
{
	// level
	switch global.leveltosave
	{
		case "entrance": state = MOD.NoiseGutter ? "Noise Gutter" : "John Gutter"; break;
		case "medieval": state = "Pizzascape"; break;
		case "ruin": state = "Ancient Cheese"; break;
		case "dungeon": state = "Bloodsauce Dungeon"; break;
		case "badland": state = "Oregano Desert"; break;
		case "graveyard": state = "Wasteyard"; break;
		case "farm": state = "Fun Farm"; break;
		case "saloon": state = "Fast Food Saloon"; break;
		case "plage": state = "Crust Cove"; break;
		case "forest": state = "Gnome Forest"; break;
		case "space": state = "Deep-Dish 9"; break;
		case "minigolf": state = "GOLF"; break;
		case "street": state = "The Pig City"; break;
		case "sewer": state = "Oh Shit!"; break;
		case "industrial": state = "Peppibot Factory"; break;
		case "freezer": state = "R-R-Freezerator"; break;
		case "chateau": state = "Pizzascare"; break;
		case "kidsparty": state = "Don't Make A Sound"; break;
		case "war": state = "WAR"; break;
		case "exit": state = "CTOP"; break;
		case "secretworld": state = "Secrets Of The World"; break;
	
		// pto
		case "desert": state = "Old Desert"; break;
		case "beach": state = "Pineapple Beach"; break;
		case "factory": state = "April Factory"; break;
		case "city": state = "Old City"; break;
		case "oldsewer": state = "Old Shit!"; break;
		case "oldfactory": state = "Old Factory"; break;
		case "oldfreezer": state = "Old Freezer"; break;
		case "golf": state = "Old GOLF"; break;
		case "pinball": state = "Space Pinball"; break;
		case "top": state = "Top"; break;
		case "oldexit": state = "Exit"; break;
		case "ancient": state = "Ancient Tower"; break;
		case "dragonlair": state = "Dragon's Lair"; break;
	
		case "abyss": state = "John's Abyss"; break;
		case "careful": state = "Listen Carefully"; break;
		case "bunker": state = "Bunker"; break;
		case "knightmare": state = "Knightmare"; break;
		
		case "strongcold": state = "Strongcold"; break;
		case "hiddenlair": state = "The Hidden Lair"; break;
		case "snickchallenge": state = "Snick's Challenge"; break;
		case "sky": state = "Sky"; break;
		case "etb": state = "Formaggi Ruins"; break;
		case "grinch": state = "Grinch's Race"; break;
		case "whitespace": state = "What Lies Beyond?"; break;
	}
	if BO_NOISE if global.leveltosave == "midway"
		state = "Midway";
	if SUGARY_SPIRE switch global.leveltosave
	{
		case "entryway": state = "Crunchy Construction"; break;
		case "steamy": state = "Cottontown"; break;
		case "mines": state = "Sugarshack Mines"; break;
		case "molasses": state = "Molasses Swamp"; break;
		case "dance": state = "Dance Off" break;
		case "estate": state = "Choco Cafe"; break;
		case "mountain": state = "Mt. Fudgetop"; break;
		case "sucrose": state = "Sucrose Snowstorm"; break;
	}

	// add rank and score
	if state != ""
	{
		var rank = "D";
		if global.timeattack
		{
			var seconds = floor(global.tatime / 60);
			var minutes = floor(seconds / 60);
			seconds = seconds % 60;
			
			if seconds < 10
				seconds = concat(0, seconds);
			
			state += concat(" (Time Attack) - ", minutes, ":", seconds);
		}
		else
		{
			// Pizzascape - 10000 (S)
			if global.collect >= global.srank
				rank = scr_is_p_rank() ? "P" : "S";
			else if global.collect >= global.arank
				rank = "A";
			else if global.collect >= global.brank
				rank = "B";
			else if global.collect >= global.crank
				rank = "C";
			state += string(" - {0} ({1})", global.collect, rank);
		}
	}
}

// not a level
if state == ""
{
	var r = room_get_name(room);
	
	// tower floors
	if string_pos("tutorial", r) > 0
		state = "Tutorial";
	else if string_starts_with(r, "trickytreat_")
	{
		state = "Tricky Treat";
		if instance_exists(obj_pumpkincounter)
			state += $" - {obj_pumpkincounter.counter} left";
	}
	else
	{
		switch room
		{
			// tower
			case tower_entrancehall: state = "Tower Entrance"; break;
			case tower_johngutterhall: state = "John Gutter Hall"; break;
			case tower_1: state = "Tower Lobby"; break;
			case tower_cheftask1: state = "Tower Achievements"; break;
			case tower_2: state = "Western District"; break;
			case tower_cheftask2: state = "Western Achievements"; break;
			case tower_3: state = "Vacation Resort"; break;
			case tower_cheftask3: state = "Vacation Achievements"; break;
			case tower_4: state = "Slum"; break;
			case tower_cheftask4: state = "Slum Achievements"; break;
			case tower_5: state = "Staff Only"; break;
			case tower_cheftask5: state = "Staff Achievements"; break;
			case tower_laundryroom: state = "Wash 'n' Clean"; break;
			case tower_mansion: state = "Tower Mansion"; break;
			case tower_noisettecafe: state = "Noisette's Café"; break;
			case tower_pizzafacehall: state = "Tower's Unknown"; break;
			case tower_pizzaland: state = "Tower Pizzaland"; break;
			case tower_graffiti: state = "Mr. Car"; break;
			case tower_ravine: state = "Tower Ravine"; break;
			case tower_ruinsecret: state = "Old Tower"; break;
			case tower_finalhallway: state = "Control Room"; break;
			case tower_soundtest: state = "Sound Test"; break;
			case tower_outside: state = "Tower Outside"; break;
			case tower_1up: case tower_2up: case tower_3up: case tower_4up: state = "Next floor!"; break;
			
			// cutscenes
			case Loadiingroom: state = "Loading..."; break;
			case Mainmenu: state = "Main Menu"; break;
			case timesuproom: state = "Time's Up!"; break;
			case Longintro: state = "Are you ready?"; break;
			case Finalintro: state = "Cliff Cutscene"; break;
			case Endingroom: state = "Ending"; break;
			case Creditsroom: state = "Credits"; break;
			case Johnresurrectionroom: state = "Ending"; break;
			case characterselect: state = "Character Select"; break;
			
			// bosses
			case boss_pepperman: state = "Pepperman"; break;
			case boss_vigilante: state = character == "V" ? "The Green" : "Vigilante"; break;
			case boss_noise: state = character == "N" ? "The Doise" : "The Noise"; break;
			case boss_fakepep: case boss_fakepepkey: case boss_fakepephallway: state = "Fake Peppino"; break;
			case boss_pizzaface: case boss_pizzafacefinale: state = "Pizzaface"; break;
			case boss_pizzafacehub: state = "Top of the Pizza Tower"; break;
			
			// pto
			case Initroom: state = "Disclaimer"; break;
			case tower_extra: state = "Outerfloor"; break;
			case tower_cheftaskextra: state = "Outer Achievements"; break;
			case tower_basement: state = "Rock Bottom"; break;
			case tower_cheftaskbasement: state = "Sub Achievements"; break;
			case tower_meta: state = "Slop Zone"; break;
			case tower_hubroomE: state = "Abandoned Lobby"; break;
			case tower_freerun: state = "Freerunning"; break;
			case tower_shop: state = "Weekend Delight"; break;
			case tower_test: state = "Test"; break;
			case editor_entrance: state = "Editor Menu"; break;
			case Funnyroom: state = "Funny Room"; break;
		}
	}
}
if room == rank_room
	state = "Ranking";

//if instance_exists(obj_modconfig)
//	state = "Browsing the modded config";

np_setpresence(state, details, largeimage, smallimage);
np_setpresence_more(smallimagetext, largeimagetext, false);
