global.roommessage = lang_get_value("room_tower2");
if !global.panic
	gameframe_caption_text = lstr("caption_tower2");
else
{
	global.roommessage = "WANTED TO NEEDED";
	
	with (obj_door)
		instance_create(x + 50, y + 96, obj_rubble);
	with (obj_bossdoor)
		instance_create(x + 50, y + 96, obj_rubble);
	instance_destroy(obj_door);
	instance_destroy(obj_bossdoor);
}
global.door_sprite = spr_door;
global.door_index = 1;
scr_random_granny();

var lay_id = layer_get_id("Assets_1");
var pep = layer_sprite_get_id(lay_id, "pep_graffiti");
var noise = layer_sprite_get_id(lay_id, "noise_graffiti");

if obj_player1.character != "N" && !global.swapmode
{
	layer_sprite_alpha(pep, 1);
	layer_sprite_alpha(noise, 0);
	
	switch obj_player1.character
	{
		case "V": layer_sprite_change(pep, spr_peppermangraffitiV); break;
	}
	if SUGARY_SPIRE && obj_player1.character == "SP"
		layer_sprite_change(pep, spr_peppermangraffitiSP);
}
else
{
	layer_sprite_alpha(pep, 0);
	layer_sprite_alpha(noise, 1);
}
