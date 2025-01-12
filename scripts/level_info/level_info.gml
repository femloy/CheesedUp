function LevelInfo(_gate_room, _john_room, _gate_spr = spr_gate_entrance, _gate_bgspr = spr_gate_entranceBG) constructor
{
	gate_room = _gate_room;
	john_room = _john_room;
	gate_spr = _gate_spr;
	gate_bgspr = _gate_bgspr;
}
function level_get_info(levelname)
{
	switch levelname
	{
		case "entrance":
			return new LevelInfo(entrance_1, entrance_10, spr_gate_entrance, spr_gate_entranceBG);
		case "medieval":
			return new LevelInfo(medieval_1, medieval_10, spr_gate_medieval, spr_gate_medievalBG);
		case "ruin":
			return new LevelInfo(ruin_1, ruin_11, spr_gate_ruin, spr_gate_ruinBG);
		case "dungeon":
			return new LevelInfo(dungeon_1, dungeon_10, spr_gate_dungeon, spr_gate_dungeonBG);
		case "badland":
			return new LevelInfo(badland_1, badland_9, spr_gate_badland, spr_gate_badlandBG);
		case "graveyard":
			return new LevelInfo(graveyard_1, graveyard_6, spr_gate_graveyard, spr_gate_graveyardBG);
		case "farm":
			return new LevelInfo(farm_2, farm_11, spr_gate_farm, spr_gate_farmBG);
		case "saloon":
			return new LevelInfo(saloon_1, saloon_6, spr_gate_saloon, spr_gate_saloonBG);
		case "plage":
			return new LevelInfo(plage_entrance, plage_cavern2, spr_gate_plage, spr_gate_plageBG);
		case "forest":
			return new LevelInfo(forest_1, forest_john, spr_gate_forest, spr_gate_forestBG);
		case "space":
			return new LevelInfo(space_1, space_9, spr_gate_space, spr_gate_spaceBG);
		case "minigolf":
			return new LevelInfo(minigolf_1, minigolf_8, spr_gate_golf, spr_gate_golfBG);
		case "street":
			return new LevelInfo(street_intro, street_john, spr_gate_street, spr_gate_streetBG);
		case "sewer":
			return new LevelInfo(sewer_1, sewer_8, spr_gate_sewer, spr_gate_sewerBG);
		case "industrial":
			return new LevelInfo(industrial_1, industrial_5, spr_gate_industrial, spr_gate_industrialBG);
		case "freezer":
			return new LevelInfo(freezer_1, freezer_escape1, spr_gate_freezer, spr_gate_freezerBG);
		case "chateau":
			return new LevelInfo(chateau_1, chateau_9, spr_gate_chateau, spr_gate_chateauBG);
		case "kidsparty":
			return new LevelInfo(kidsparty_1, kidsparty_john, spr_gate_kidsparty, spr_gate_kidspartyBG);
		case "exit":
			return new LevelInfo(tower_finalhallway, tower_entrancehall, spr_gate_exit, spr_gate_exitBG);
		case "secretworld":
			return new LevelInfo(secret_entrance, secret_entrance, spr_gate_secret, spr_gate_secretBG);
		
		case "custom":
			return new LevelInfo(editor_entrance, editor_entrance, spr_gate_cyop, spr_gate_cyopBG);
		case "strongcold":
			return new LevelInfo(strongcold_10, strongcold_1, spr_gate_strongcold, spr_gate_strongcoldBG);
		case "etb":
			return new LevelInfo(etb_1, etb_8, spr_gate_etb, spr_gate_etbBG);
		case "grinch":
			return new LevelInfo(grinch_1, grinch_10, spr_gate_etb, spr_gate_etbBG);
		case "beach":
			return new LevelInfo(beach_1, beach_13, spr_gate_plage, spr_gate_plageBG);
		case "snickchallenge":
			return new LevelInfo(medieval_1, snick_challengeend, spr_gate_snickchallenge, spr_gate_snickchallengeBG);
	}
	return noone;
}
