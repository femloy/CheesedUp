function LevelInfo(_gate_room, _john_room,
_gate_spr = spr_gate_entrance, _gate_bgspr = spr_gate_entranceBG,
_titlecard_sprite = spr_titlecards, _titlecard_index = 0,
_title_sprite = spr_titlecards_title, _title_index = 0,
_title_music = "event:/music/w1/entrancetitle") constructor
{
	gate_room = _gate_room;
	john_room = _john_room;
	has_john = true;
	has_lap = true;
	is_exit = false;
	is_tutorial = false;
	
	gate_spr = _gate_spr;
	gate_bgspr = _gate_bgspr;
	titlecard_sprite = _titlecard_sprite;
	titlecard_index = _titlecard_index;
	title_sprite = _title_sprite;
	title_index = _title_index;
	title_music = _title_music;
}
function level_get_info(levelname)
{
	switch levelname
	{
		case "tutorial":
			var gate_room = tower_tutorial1;
			var john_room = tower_tutorial10;
			
			switch obj_player1.character
			{
				case "N":
					gate_room = tower_tutorial1N;
					john_room = tower_tutorial3N;
					break;
				case "V":
					gate_room = tutorialV_1;
					john_room = tutorialV_3;
					break;
			}
			
			var io = new LevelInfo(gate_room, john_room, spr_gate_tutorial, spr_gate_tutorialBG, noone);
			io.is_tutorial = true;
			io.has_lap = false;
			return io;
		case "entrance":
			return new LevelInfo(entrance_1, entrance_10, spr_gate_entrance, spr_gate_entranceBG, spr_titlecards, 0, spr_titlecards_title, 0, "event:/music/w1/entrancetitle");
		case "medieval":
			return new LevelInfo(medieval_1, medieval_10, spr_gate_medieval, spr_gate_medievalBG, spr_titlecards, 1, spr_titlecards_title, 1, "event:/music/w1/medievaltitle");
		case "ruin":
			return new LevelInfo(ruin_1, ruin_11, spr_gate_ruin, spr_gate_ruinBG, spr_titlecards, 2, spr_titlecards_title, 2, "event:/music/w1/ruintitle");
		case "dungeon":
			return new LevelInfo(dungeon_1, dungeon_10, spr_gate_dungeon, spr_gate_dungeonBG, spr_titlecards, 3, spr_titlecards_title, 3, "event:/music/w1/dungeontitle");
		case "badland":
			return new LevelInfo(badland_1, badland_9, spr_gate_badland, spr_gate_badlandBG, spr_titlecards, 4, spr_titlecards_title, 4, "event:/music/w2/deserttitle");
		case "graveyard":
			return new LevelInfo(graveyard_1, graveyard_6, spr_gate_graveyard, spr_gate_graveyardBG, spr_titlecards, 5, spr_titlecards_title, 5, "event:/music/w2/graveyardtitle");
		case "farm":
			return new LevelInfo(farm_2, farm_11, spr_gate_farm, spr_gate_farmBG, spr_titlecards, 6, spr_titlecards_title, 6, "event:/music/w2/farmtitle");
		case "saloon":
			return new LevelInfo(saloon_1, saloon_6, spr_gate_saloon, spr_gate_saloonBG, spr_titlecards, 7, spr_titlecards_title, 7, "event:/music/w2/saloontitle");
		case "plage":
			return new LevelInfo(plage_entrance, plage_cavern2, spr_gate_plage, spr_gate_plageBG, spr_titlecards, 8, spr_titlecards_title, 8, "event:/music/w3/beachtitle");
		case "forest":
			return new LevelInfo(forest_1, forest_john, spr_gate_forest, spr_gate_forestBG, spr_titlecards, 9, spr_titlecards_title, 9, "event:/music/w3/foresttitle");
		case "space":
			return new LevelInfo(space_1, space_9, spr_gate_space, spr_gate_spaceBG, spr_titlecards, 10, spr_titlecards_title2, 0, "event:/music/w3/spacetitle");
		case "minigolf":
			return new LevelInfo(minigolf_1, minigolf_8, spr_gate_golf, spr_gate_golfBG, spr_titlecards, 11, spr_titlecards_title2, 1, "event:/music/w3/golftitle");
		case "street":
			return new LevelInfo(street_intro, street_john, spr_gate_street, spr_gate_streetBG, spr_titlecards, 12, spr_titlecards_title2, 2, "event:/music/w4/streettitle");
		case "sewer":
			return new LevelInfo(sewer_1, sewer_8, spr_gate_sewer, spr_gate_sewerBG, spr_titlecards, 13, spr_titlecards_title2, 3, "event:/music/w4/sewertitle");
		case "industrial":
			return new LevelInfo(industrial_1, industrial_5, spr_gate_industrial, spr_gate_industrialBG, spr_titlecards, 16, spr_titlecards_title2, 6, "event:/music/w4/industrialtitle");
		case "freezer":
			return new LevelInfo(freezer_1, freezer_escape1, spr_gate_freezer, spr_gate_freezerBG, spr_titlecards, 17, spr_titlecards_title2, 7, "event:/music/w4/freezertitle");
		case "chateau":
			return new LevelInfo(chateau_1, chateau_9, spr_gate_chateau, spr_gate_chateauBG, spr_titlecards, 18, spr_titlecards_title2, 8, "event:/music/w5/chateautitle");
		case "kidsparty":
			return new LevelInfo(kidsparty_1, kidsparty_john, spr_gate_kidsparty, spr_gate_kidspartyBG, spr_titlecards, 19, spr_titlecards_title2, 9, "event:/music/w5/kidspartytitle");
		case "war":
			var io = new LevelInfo(war_1, war_13, spr_gate_war, spr_gate_warBG, spr_titlecards, 14, spr_titlecards_title2, 4, "event:/music/w5/wartitle");
			io.has_john = false;
			return io;
		case "exit":
			var io = new LevelInfo(tower_finalhallway, tower_entrancehall, spr_gate_exit, spr_gate_exitBG, spr_titlecards, 15, spr_titlecards_title2, 5, noone);
			io.is_exit = true;
			return io;
		case "secretworld":
			var io = new LevelInfo(secret_entrance, secret_entrance, spr_gate_secret, spr_gate_secretBG, spr_titlecardsecret, 0, spr_titlecardsecrettitle, 0, "event:/music/secretworldtitle");
			io.has_john = false;
			io.has_lap = false;
			return io;
		
		case "custom":
			var io = new LevelInfo(editor_entrance, editor_entrance, spr_gate_cyop, spr_gate_cyopBG, noone);
			io.has_john = false;
			io.has_lap = false;
			return io;
		case "strongcold":
			return new LevelInfo(strongcold_10, strongcold_1, spr_gate_strongcold, spr_gate_strongcoldBG, spr_titlecards_new, 1, spr_titlecards_newtitles, 1, "event:/modded/level/strongcoldtitle");
		case "etb":
			return new LevelInfo(etb_1, etb_8, spr_gate_etb, spr_gate_etbBG, spr_titlecards_new, 10, spr_titlecards_newtitles, 10, "event:/modded/level/grinchtitle");
		case "grinch":
			var io = new LevelInfo(grinch_1, grinch_10, spr_gate_grinchrace, spr_gate_grinchraceBG, spr_titlecards_new, 5, spr_titlecards_newtitles, 5, "event:/music/w1/ruintitle");
			io.has_john = false;
			io.has_lap = false;
			return io;
		case "beach":
			return new LevelInfo(beach_1, beach_13, spr_gate_plage, spr_gate_plageBG, spr_titlecards_new, 12, spr_titlecards_newtitles, 12, "event:/music/w3/beachtitle");
		case "snickchallenge":
			var io = new LevelInfo(medieval_1, snick_challengeend, spr_gate_snickchallenge, spr_gate_snickchallengeBG, spr_titlecards_new, 8, spr_titlecards_newtitles, 8, "event:/modded/level/snickchallengetitle");
			io.has_john = false;
			io.has_lap = false;
			return io;
	}
	return noone;
}
