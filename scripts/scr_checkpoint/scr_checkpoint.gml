function set_checkpoint()
{
	trace("CHECKPOINT");
	clear_checkpoint();
	
	if !(global.in_cyop && instance_exists(obj_transfotip))
		create_transformation_tip(lstr("checkpointset"));
	
	var r = room;
	if instance_exists(obj_cyop_loader)
		r = obj_cyop_loader.room_name;
	
	// base
	global.checkpoint_data = {
		room: r,
		baddieroom: ds_list_create(),
		saveroom: ds_list_create(),
		escaperoom: ds_list_create(),
		wartime: -1,
		deathtime: -1,
		loaded: 0
	};
	
	var c = global.checkpoint_data;
	with obj_wartimer
		c.wartime = (minutes * 60) + seconds + addseconds;
	
	ds_list_copy(c.baddieroom, global.baddieroom);
	ds_list_copy(c.saveroom, global.saveroom);
	ds_list_copy(c.escaperoom, global.escaperoom);
	
	// globals and player
	var global_store = [
		"collect", "combo", "combodropped", "lap", "laps", "secretfound", "comboscore", "fill", "panic",
		"prank_enemykilled", "prank_cankillenemy", "modifier_failed", "gerome", "treasure", "toppintotal",
		"shroomfollow", "cheesefollow", "tomatofollow", "sausagefollow", "pineapplefollow", "maxwave",
		"level_minutes", "level_seconds",
		"heatmeter_count", "vigiweapon", "noisejetpack", 
	];
	var player_store = [
		"targetDoor", "shotgunAnim", "supercharge", "supercharged",
	];
	
	while array_length(global_store)
	{
		var name = array_shift(global_store);
		struct_set(c, name, variable_global_get(name));
	}
	while array_length(player_store)
	{
		var name = array_shift(player_store);
		struct_set(c, $"p.{name}", safe_get(obj_player1, name));
	}
}
function clear_checkpoint()
{
	var c = global.checkpoint_data;
	if is_struct(c)
	{
		trace("CLEARED CHECKPOINT");
		
		ds_list_destroy(c.baddieroom); 
		ds_list_destroy(c.saveroom); 
		ds_list_destroy(c.escaperoom);
		
		delete c;
		global.checkpoint_data = noone;
	}
}
function load_checkpoint()
{
	var c = global.checkpoint_data;
	if is_struct(c)
	{
		global.levelreset = false;
		
		c.loaded = 2;
		
		scr_playerreset(false, true);
		
		c.loaded = 1;
		
		// restore
		var name = struct_get_names(c);
		for(var i = 0, n = array_length(name); i < n; ++i)
		{
			switch name[i]
			{
				case "room": case "baddieroom": case "saveroom": case "escaperoom": case "loaded": break;
				case "wartime":
					if c.wartime > -1
					{
						with instance_create(0, 0, obj_wartimer)
						{
							seconds = c.wartime;
							while seconds >= 60
							{
								minutes++;
								seconds -= 60;
							}
						}
					}
					break;
				
				default:
					if string_starts_with(name[i], "p.")
						variable_instance_set(obj_player1, string_replace(name[i], "p.", ""), c[$ name[i]]);
					else
						variable_global_set(name[i], c[$ name[i]]);
			}
		}
		ds_list_copy(global.baddieroom, c.baddieroom);
		ds_list_copy(global.saveroom, c.saveroom);
		ds_list_copy(global.escaperoom, c.escaperoom);
		
		// restart
		if global.combo > 0
			global.combotime = 60;
		
		global.levelattempts++;
		obj_music.music = noone;
		
		scr_room_goto(c.room);
		
		if global.shroomfollow instance_create(obj_player1.x, obj_player1.y, obj_pizzakinshroom);
		if global.cheesefollow instance_create(obj_player1.x, obj_player1.y, obj_pizzakincheese);
		if global.tomatofollow instance_create(obj_player1.x, obj_player1.y, obj_pizzakintomato);
		if global.sausagefollow instance_create(obj_player1.x, obj_player1.y, obj_pizzakinsausage);
		if global.pineapplefollow instance_create(obj_player1.x, obj_player1.y, obj_pizzakinpineapple);
		if global.gerome instance_create(obj_player1.x, obj_player1.y, obj_geromefollow);
		
		with obj_player
		{
			hurted = true;
			alarm[7] = 60;
		}
	}
}
