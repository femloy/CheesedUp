live_auto_call;

selected_level = 0;
selected_world = 0;
buffer = 30;
global.leveltorestart = noone;
scr_init_input();
worlds = [];

Level = function(_name, _display_name = lstr("level_" + _name), _func = undefined, _draw_func = noone) constructor
{
	name = _name;
	display_name = _display_name;
	world = noone;
	
	draw_func = _draw_func;
	if _draw_func != noone
		draw_func = method(self, _draw_func);
	
	if _func == undefined
	{
		func = function()
		{
			var _levelinfo = level_get_info(name);
			if _levelinfo == noone
			{
				trace("Unknown level ", name);
				exit;
			}
			
			global.sandbox = true;
			
			if world.door_index != noone
			{
				global.door_sprite = spr_door;
				global.door_index = world.door_index;
			}
			
			with obj_player
			{
				global.exitrank = true;
				global.startgate = true;
				global.leveltosave = other.name;
				global.leveltorestart = _levelinfo.gate_room;
				global.levelattempts = 0;
				global.levelreset = true;
				backtohubstartx = x;
				backtohubstarty = y;
				backtohubroom = rm_levelselect;
				
				state = states.comingoutdoor;
				targetRoom = _levelinfo.gate_room;
				targetDoor = "A";
				
				instance_create(x, y, obj_fadeout);
			}
		}
	}
	else
		func = method(self, _func);
}

World = function(_name) constructor
{
	name = _name;
	levels = [];
	door_index = noone;
	
	add_level = function(level)
	{
		level.world = self;
		array_push(levels, level);
		return level;
	}
}

// sandbox
var worldsandbox = new World("SANDBOX");
var f = function()
{
	scr_start_game_fresh(name[0], name[1]);
}
var d = function()
{
	var game = menu_get_game(name[0] - 1, name[1]);
	draw_set_valign(fa_top);
	
	var str = "FRESH";
	if game.started
	{
		str = "";
		if !name[1]
			str += $"{game.percentage} PERCENT\n";
		str += $"{scr_get_timer_string(game.minutes, game.seconds, true, false)}\n{game.character}";
	}
	draw_text(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, str);
}

worldsandbox.add_level(new Level([1, true], "", f, d));
worldsandbox.add_level(new Level([2, true], "", f, d));
worldsandbox.add_level(new Level([3, true], "", f, d));

// story mode
var worldstorymode = new World("STORY MODE");
worldstorymode.add_level(new Level([1, false], "", f, d));
worldstorymode.add_level(new Level([2, false], "", f, d));
worldstorymode.add_level(new Level([3, false], "", f, d));

// worlds
var world1 = new World("WORLD 1");
world1.door_index = 0;
world1.add_level(new Level("entrance"));
world1.add_level(new Level("medieval"));
world1.add_level(new Level("ruin"));
world1.add_level(new Level("dungeon"));
world1.add_level(new Level("tutorial"));

var world2 = new World("WORLD 2");
world2.door_index = 1;
world2.add_level(new Level("badland"));
world2.add_level(new Level("graveyard"));
world2.add_level(new Level("farm"));
world2.add_level(new Level("saloon"));

var world3 = new World("WORLD 3");
world3.door_index = 2;
world3.add_level(new Level("plage"));
world3.add_level(new Level("forest"));
world3.add_level(new Level("space"));
world3.add_level(new Level("minigolf"));

var world4 = new World("WORLD 4");
world4.door_index = 3;
world4.add_level(new Level("street"));
world4.add_level(new Level("sewer"));
world4.add_level(new Level("industrial"));
world4.add_level(new Level("freezer"));

var world5 = new World("WORLD 5");
world5.door_index = 4;
world5.add_level(new Level("chateau"));
world5.add_level(new Level("kidsparty"));
world5.add_level(new Level("war"));
world5.add_level(new Level("exit"));

var worldextra = new World("WORLD EXTRA");
worldextra.door_index = 5;
worldextra.add_level(new Level("custom"));
worldextra.add_level(new Level("strongcold"));
worldextra.add_level(new Level("grinch"));
worldextra.add_level(new Level("etb"));
worldextra.add_level(new Level("beach"));

if !global.saveloaded
{
	array_push(worlds, worldsandbox, worldstorymode);
	selected_world = 2;
}
array_push(worlds, world1, world2, world3, world4, world5, worldextra);

var lay_id = layer_get_id("Backgrounds_1"); 
var back_id = layer_background_get_id(lay_id); 
layer_background_index(back_id, 3);
layer_background_speed(back_id, 0);
