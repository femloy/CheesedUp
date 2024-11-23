function __levelinfo(gate_room, john_room, name) constructor
{
	self.gate_room = gate_room;
	self.john_room = john_room;
	self.name = name;
}
function level_info(levelname)
{
	switch levelname
	{
		case "entrance":
			return new __levelinfo(entrance_1, entrance_10, levelname);
		case "medieval":
			return new __levelinfo(medieval_1, medieval_10, levelname);
		case "ruin":
			return new __levelinfo(ruin_1, ruin_11, levelname);
		case "dungeon":
			return new __levelinfo(dungeon_1, dungeon_10, levelname);
		case "badland":
			return new __levelinfo(badland_1, badland_9, levelname);
		case "graveyard":
			return new __levelinfo(graveyard_1, graveyard_6, levelname);
		case "farm":
			return new __levelinfo(farm_2, farm_11, levelname);
		case "saloon":
			return new __levelinfo(saloon_1, saloon_6, levelname);
		case "plage":
			return new __levelinfo(plage_entrance, plage_cavern2, levelname);
		case "forest":
			return new __levelinfo(forest_1, forest_john, levelname);
		case "space":
			return new __levelinfo(space_1, space_9, levelname);
		case "minigolf":
			return new __levelinfo(minigolf_1, minigolf_8, levelname);
		case "street":
			return new __levelinfo(street_intro, street_john, levelname);
		case "sewer":
			return new __levelinfo(sewer_1, sewer_8, levelname);
		case "industrial":
			return new __levelinfo(industrial_1, industrial_5, levelname);
		case "freezer":
			return new __levelinfo(freezer_1, freezer_escape1, levelname);
		case "chateau":
			return new __levelinfo(chateau_1, chateau_9, levelname);
		case "kidsparty":
			return new __levelinfo(kidsparty_1, kidsparty_john, levelname);
		//case "exit":
		//	return new __levelinfo(tower_finalhallway, tower_entrancehall, "The Crumbling Tower Of Pizza");
	}
	return noone;
}
