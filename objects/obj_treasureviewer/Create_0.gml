treasure_arr = [
	[global[$ "entrancetreasure"] ?? false, spr_treasure1],
	[global[$ "medievaltreasure"] ?? false, spr_treasure1],
	[global[$ "ruintreasure"] ?? false, spr_treasure1],
	[global[$ "dungeontreasure"] ?? false, spr_treasure1],
	[global[$ "deserttreasure"] ?? false, spr_treasure1],
	[global[$ "graveyardtreasure"] ?? false, spr_treasure1],
	[global[$ "farmtreasure"] ?? false, spr_treasure1],
	[global[$ "spacetreasure"] ?? false, spr_treasure1],
	[global[$ "beachtreasure"] ?? false, spr_treasure1],
	[global[$ "foresttreasure"] ?? false, spr_treasure1],
	[global[$ "pinballtreasure"] ?? false, spr_treasure1],
	[global[$ "golftreasure"] ?? false, spr_treasure1],
	[global[$ "streettreasure"] ?? false, spr_treasure1],
	[global[$ "sewertreasure"] ?? false, spr_treasure1],
	[global[$ "factorytreasure"] ?? false, spr_treasure1],
	[global[$ "freezertreasure"] ?? false, spr_treasure1],
	[global[$ "chateautreasure"] ?? false, spr_treasure1],
	[global[$ "mansiontreasure"] ?? false, spr_treasure1],
	[global[$ "kidspartytreasure"] ?? false, spr_treasure1],
	[global[$ "wartreasure"] ?? false, spr_treasure1]
];
treasure_pos = 0;
treasure_posX = 0;
treasure_posY = 0;
treasure_state = 0;
alarm[0] = 235;
depth = -40;
visible = false;
