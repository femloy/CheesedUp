global.roommessage = lang_get_value("room_towerentrance");
global.door_sprite = spr_door;
global.door_index = 0;
gameframe_caption_text = lstr("caption_tower_entrancehall");
with (obj_player1)
{
	if (targetDoor == "C")
	{
		targetDoor = "HUB";
		verticalhallway = false;
		backtohubstartx = obj_doorC.x + 32;
		backtohubstarty = obj_doorC.y - 14;
		x = backtohubstartx;
		y = backtohubstarty - (SCREEN_HEIGHT * 2);
		state = states.backtohub;
		sprite_index = spr_slipbanan1;
		image_index = 10;
	}
}
if global.panic
	global.roommessage = "FAREWELL";

/*
var tutx = obj_startgate.x;
for(var i = 1; i < 30; i++)
{
	instance_create(lerp(obj_exitgate.x, tutx, i / 31), obj_startgate.y, obj_startgate, {
		targetRoom: editor_entrance,
		gateSprite: spr_gate_cyop,
		bgsprite: spr_gate_cyopBG,
		msg: $"CYOP Gate #{i}",
		allow_modifier: false,
		show_titlecard: false
	});
}
*/
