function sh_resetsaveroom()
{
	if YYC
	{
		if instance_exists(obj_disclaimer) or room == Initroom
			return WC_FUCK_YOU;
	}
	if !WC_debug
		return WC_NODEBUG;
	if !instance_exists(obj_player1)
		return "Player is not in room";
	
	if variable_global_exists("saveroom") && ds_exists(global.saveroom, ds_type_list)
		ds_list_clear(global.saveroom);
	if variable_global_exists("baddieroom") && ds_exists(global.baddieroom, ds_type_list)
		ds_list_clear(global.baddieroom);
	if variable_global_exists("baddietomb") && ds_exists(global.baddietomb, ds_type_list) // april build
		ds_list_clear(global.baddietomb);
	if variable_global_exists("escaperoom") && ds_exists(global.escaperoom, ds_type_list) // final
		ds_list_clear(global.escaperoom);
	
	with obj_player
		targetDoor = "none";
	with all
		if !persistent && id != other.id then instance_destroy(id, false);
	
	if instance_exists(obj_cyop_loader)
		scr_room_goto(obj_cyop_loader.room_name);
	else
		room_restart();
	
	if !isOpen
		create_transformation_tip(lstr("resetleveldata"));
	else
		return "Reset all level data, and restarted current room";
}
function meta_resetsaveroom()
{
	return {
		description: "clears global.saveroom and similar lists",
	}
}
