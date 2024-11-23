if global.in_afom
{
	if sprite_index == spr_doorunvisited
	{
		if old
		{
		    sprite_index = spr_doorunvisited;
		    spr_visited = spr_doorvisited;
		    spr_blocked = spr_doorblocked;
		}
		else
		{
		    sprite_index = global.door_sprite;
			image_index = global.door_index;
			image_speed = 0;
		    spr_blocked = spr_doorblocked;
		}
	}
	else if spr_visited == spr_doorvisited
		spr_visited = sprite_index;
	
	if in_saveroom()
		visited = true;
	else
	{
		alarm[0] = -1;
		auto_targetdoor();
		
		if obj_player1.targetDoor == targetDoor
		{
			add_saveroom();
			visited = true;
		}
	}
	if visited && sprite_index != spr_cheftaskdoor && sprite_index != spr_pepperdoor && sprite_index != spr_elevatordown1 && sprite_index != spr_elevatordown2 && sprite_index != spr_elevatordown3 && sprite_index != spr_elevatordown4
		sprite_index = spr_visited;
	
	if john && global.panic
		sprite_index = spr_blocked;
	exit;
}

if string_ends_with(room_get_name(room), "_treasure")
{
	sprite_index = global.door_sprite;
	visible = false;
	
	if check_lap_mode(lapmodes.april)
		instance_destroy();
	exit;
}
if variable_instance_exists(id, "target_x") && variable_instance_exists(id, "target_y")
	compatibility = true;

if old
	exit;

if sprite_index != spr_pumpkingate && sprite_index != spr_cheftaskdoor && sprite_index != spr_pepperdoor && sprite_index != spr_elevatordown1 && sprite_index != spr_elevatordown2 && sprite_index != spr_elevatordown3 && sprite_index != spr_elevatordown4 && sprite_index != spr_blastdooropen
{
	sprite_index = global.door_sprite;
	image_index = global.door_index;
	image_speed = 0;
}
if john && global.panic
{
	if room == saloon_4
		sprite_index = spr_doorblockedsaloon;
	else
		sprite_index = spr_doorblocked;
}
if sprite_index == spr_cheftaskdoor
{
	var arr = ["placebo"];
	switch room
	{
		case tower_1:
		case tower_cheftask1:
			arr = ["entrance1", "entrance2", "entrance3", "medieval1", "medieval2", "medieval3", "ruin1", "ruin2", "ruin3", "dungeon1", "dungeon2", "dungeon3", "sranks1", "pepperman"];
			break;
		case tower_2:
		case tower_cheftask2:
			arr = ["badland1", "badland2", "badland3", "graveyard1", "graveyard2", "graveyard3", "farm1", "farm2", "farm3", "saloon1", "saloon2", "saloon3", "sranks2", "vigilante"];
			break;
		case tower_3:
		case tower_cheftask3:
			arr = ["plage1", "plage2", "plage3", "forest1", "forest2", "forest3", "space1", "space2", "space3", "minigolf1", "minigolf2", "minigolf3", "sranks3", "noise"];
			break;
		case tower_4:
		case tower_cheftask4:
			arr = ["sewer1", "sewer2", "sewer3", "industrial1", "industrial2", "industrial3", "freezer1", "freezer2", "freezer3", "street1", "street2", "street3", "sranks4", "fakepep"];
			break;
		case tower_5:
		case tower_cheftask5:
			arr = ["chateau1", "chateau2", "chateau3", "kidsparty1", "kidsparty2", "kidsparty3", "war1", "war2", "war3", "sranks5", "pizzaface"];
			break;
		
		case tower_extra:
		case tower_cheftaskextra: // all p ranks not necessary for golden door
			arr = ["sranksextra", "cheesedragon"];
			break;
		case tower_basement:
		//case tower_cheftaskbasement:
			arr = ["sranksbasement", "mrstick"];
			break;
	}
	
	// look for non unlocked achievements
	var _found = false;
	ini_open_from_string(obj_savesystem.ini_str);
	for (var i = 0; i < array_length(arr); i++)
	{
		var b = arr[i];
		if !ini_read_real("achievements", b, false)
		{
			_found = true;
			break;
		}
	}
	ini_close();
	
	// if every achievement is unlocked for this floor, make it gold
	if !_found
		sprite_index = spr_cheftaskdoor_gold;
}
if MIDWAY
	sprite_index = spr_midwaydoor;
if room == steamy_8
	sprite_index = spr_clockdoor;
