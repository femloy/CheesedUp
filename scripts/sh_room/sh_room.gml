function sh_room(args)
{
	if YYC
	{
		if instance_exists(obj_disclaimer) or room == Initroom
			return WC_FUCK_YOU;
	}
	if !WC_debug
		return WC_NODEBUG;
	
	if instance_exists(obj_cyop_loader)
	{
		if array_length(args) < 2
			return $"The current room is {obj_cyop_loader.room_name} ({string(room)})";
		
		var door = args[1];
		var roomgoto = WCscr_allargs(args, 2);
		
		if !ds_map_exists(global.cyop_room_map, roomgoto) && !(global.afom_wfixed && ds_map_exists(global.cyop_room_map, roomgoto + "_wfixed"))
			return "The room " + string(roomgoto) + " doesn't exist in the current custom level";
	}
	else
	{
		if array_length(args) < 2
			return "The current room is " + room_get_name(room) + " (" + string(room) + ")";
		
		var roomgoto = args[1];
		if YYC
		{
			if roomgoto == "Initroom" or roomgoto == "Loadiingroom"
				return "Not a good idea.";
		}
		
		var door = "NONE";
		if array_length(args) >= 3
			door = args[2];
		
		if string_is_number(roomgoto)
		{
			roomgoto = real(roomgoto);
			if !room_exists(roomgoto)
				return "The room " + string(roomgoto) + " doesn't exist";
		}
		else
		{
			if asset_get_type(roomgoto) != asset_room
				return "The asset " + roomgoto + " is not a room";
			roomgoto = asset_get_index(roomgoto);
		}
		
		// DO NOT REMOVE THIS.
		if array_contains(asset_get_tags(roomgoto, asset_room), "hidden") && !DEBUG
			return $"The asset {roomgoto} is not a room";
	}
	
	with obj_player1
	{
		targetDoor = string_upper(door);
		set_lastroom();
	}
	
	scr_room_goto(roomgoto);
	sound_play(sfx_door);
}
function meta_room()
{
	return {
		description: "travel to a room",
		arguments: function() {
			return instance_exists(obj_cyop_loader) ? ["targetDoor", "targetRoom"] : ["targetRoom", "<targetDoor>"];
		},
		suggestions: [
			
			// arg 1
			function()
			{
				if instance_exists(obj_cyop_loader)
					return ["A", "B", "C", "D", "E", "F", "G"];
				
				var room_array = [];
				var tags = tag_get_asset_ids("hidden", asset_room);
				for(var i = 0; room_exists(i); i++)
				{
					if !array_contains(tags, i)
						array_push(room_array, room_get_name(i));
				}
				array_sort(room_array, true);
				return room_array;
			},
			
			// arg 2
			function()
			{
				if instance_exists(obj_cyop_loader)
				{
					var room_array = [];
					var map = ds_map_find_first(global.cyop_room_map);
					while !is_undefined(map)
					{
						if global.afom_wfixed
						{
							if string_ends_with(map, "_wfixed") or global.cyop_room_map[? concat(map, "_wfixed")] == undefined
								array_push(room_array, string_replace(map, "_wfixed", ""));
						}
						else
							array_push(room_array, map);
						map = ds_map_find_next(global.cyop_room_map, map);
					}
					return room_array;
				}
				return ["A", "B", "C", "D", "E", "F", "G"];
			}
		],
	}
}
