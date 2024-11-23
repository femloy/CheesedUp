function scr_load_savefiles()
{
	var data_arr = [get_save_folder() + "/saveData1", get_save_folder() + "/saveData2", get_save_folder() + "/saveData3"];
	for (var i = 0; i < array_length(data_arr); i++)
	{
		global.game[i] = scr_read_game(data_arr[i] + ".ini");
		global.story_game[i] = scr_read_game(data_arr[i] + "S.ini");
	}
}
function scr_get_game(slot = global.currentsavefile - 1, sandbox = global.sandbox)
{
	if sandbox
		return global.game[slot];
	else
		return global.story_game[slot];
}
function scr_read_game(ini)
{
	var q = game_empty();
	ini_open(ini);
	
	q.started = ini_read_real("Tutorial", "finished", false);
	
	// judge
	q.percentage = ini_read_real("Game", "percent", 0);
	q.judgement = ini_read_string("Game", "finalrank", "none");
	q.john = ini_read_real("Game", "john", false);
	q.snotty = ini_read_real("Game", "finalsnotty", false);
	
	q.minutes = ini_read_real("Game", "minutes", 0);
	q.seconds = ini_read_real("Game", "seconds", 0);
	
	// pal
	q.palette = q.started ? ini_read_real("Game", "palette", 1) : 1;
	q.palettetexture = q.started ? scr_get_texture_palette(ini_read_string("Game", "palettetexture", "none")) : noone;
	
	// swap mode
	q.palette_player2 = ini_read_real("Game", "palette_player2", 1);
	q.palettetexture_player2 = scr_get_texture_palette(ini_read_string("Game", "palettetexture_player2", "none"));
	
	// pto
	q.character = q.started ? ini_read_string("Game", "character", "P") : "P";
	
	ini_close();
	return q;
}
function menu_get_game(slot, sandbox)
{
	var g = global.game[slot]; // scr_read_game
	if !sandbox
		g = global.story_game[slot];
	
	var q = 
	{
		percentage: g.percentage,
		snotty: g.snotty,
		john: g.john,
		judgement: g.judgement,
		minutes: g.minutes,
		seconds: g.seconds,
		started: g.started,
		character: g.character,
		palette: g.palette,
		palettetexture: g.palettetexture,
		
		perstatus_icon: 0,
		percvisual: 0,
		alpha: 1,
	};
	q.perstatus_icon = floor(q.percentage / (100 / 7));
	if q.perstatus_icon > sprite_get_number(spr_percentstatemenu) - 1
		q.perstatus_icon = sprite_get_number(spr_percentstatemenu) - 1;
	if q.percentage >= 101
		q.perstatus_icon = 8;
	return q;
}
function game_empty()
{
	return 
	{
		percentage: 0,
		started: false,
		judgement: "none",
		john: false,
		snotty: false,
		palette: 1,
		palettetexture: -4,
		minutes: 0,
		seconds: 0,
		palette_player2: 1,
		palettetexture_player2: -4,
		
		// pto
		character: "P"
	};
}
