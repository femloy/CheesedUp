global.roommessage = lang_get_value("room_tower1");
global.door_sprite = spr_door;
global.door_index = 0;

if !global.panic
	gameframe_caption_text = lstr("caption_tower1");
else
{
	with (obj_door)
		instance_create(x + 50, y + 96, obj_rubble);
	with (obj_bossdoor)
		instance_create(x + 50, y + 96, obj_rubble);
	instance_destroy(obj_door);
	instance_destroy(obj_bossdoor);
	
	global.roommessage = "A PEPPER IN DISTRESS";
}
scr_random_granny();

var lay_id = layer_get_id("Assets_1");
var next_floor = layer_sprite_get_id(lay_id, "next_floor");
if global.sandbox
	layer_sprite_alpha(next_floor, 0);
