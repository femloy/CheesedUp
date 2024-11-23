function sh_skin()
{
	if !WC_debug
		return "You do not have permission to use this command";
	if !instance_exists(obj_player)
		return safe_get(obj_pause, "pause") ? "Can't do this while paused" : "The player is not in the room";
	
	isOpen = false;
	instance_create(0, 0, obj_skinchoice);
}
function meta_skin()
{
	return {
		description: "opens palette menu",
	}
}
