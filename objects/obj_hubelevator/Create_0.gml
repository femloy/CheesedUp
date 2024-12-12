live_auto_call;

ini_open_from_string(obj_savesystem.ini_str);
if (!ini_key_exists("Ranks", "exit") && !global.sandbox && !instance_exists(obj_elevatorcutscene)) // checks if you beat the game on this savefile
or instance_exists(obj_cyop_loader)
{
	var tr = room;
	if variable_instance_exists(id, "targetRoom")
		tr = targetRoom;
	
	instance_change(obj_door, true);
	targetRoom = tr;
	
	event_perform_object(obj_door, ev_other, ev_room_start);
	ini_close();
	exit;
}
ini_close();

// elevator here
with instance_create(0, 0, obj_hubelevator_ui)
	elevator = other.id;

scr_create_uparrowhitbox();
depth = 99;

state = 0;
targetDoor = "A";
sel = 0;
sel_prev = 0;

if global.panic
{
	instance_create(x + 50, y + 96, obj_rubble);
	instance_destroy();
}

outback = animcurve_get_channel(curve_menu, "outback");
incubic = animcurve_get_channel(curve_menu, "incubic");
anim_t = 0;
angle = 360;
scr_init_input();

// floors
hub_array = [];
add_floor = function(button_index, target_room, target_door, target_door_back = target_door, group_arr = noone, offload_arr = noone)
{
	var a = {
		button_index: button_index,
		target_room: target_room,
		target_door: target_door,
		target_door_back: target_door_back,
		group_arr: group_arr,
		offload_arr: offload_arr
	};
	array_push(hub_array, a);
	return a;
}

if !instance_exists(obj_cyop_loader)
{
	add_floor(0, tower_1, "E", "E");
	add_floor(1, tower_2, "E", "C");
	add_floor(2, tower_3, "C", "B");
	add_floor(3, tower_4, "B", "E");
	add_floor(4, tower_5, "E", "E");
	
	if !global.goodmode
	{
		if SUGARY_SPIRE
			add_floor(7, tower_sugary, "A");
		
		if CHEESED_UP
			add_floor(5, tower_extra, "G", "G");
		else
			add_floor(6, tower_basement, "A", "A");
		
		//if DEBUG
		//	add_floor(7, tower_test, "A");
	}
}
else
	add_floor(1, room, "A");

offload_arr = noone;
buffer = 0;
