function sh_noclip(args)
{
	if !WC_debug
		return "You do not have permission to use this command";
	if !instance_exists(obj_player1)
		return safe_get(obj_pause, "pause") ? "Can't do this while paused" : "The player is not in the room";
	
	var collide = false;
	if array_length(args) > 1
	{
		if args[1] == "1" or args[1] == "true"
			collide = true;
	}
	
	with obj_player1
	{
		var targetstate = collide ? states.debugfly : states.debugstate;
		if state == targetstate
			state = states.normal;
		else
			state = targetstate;
	}
}
function meta_noclip()
{
	return {
		description: "puts the player in the debug state",
		arguments: ["<collision>"],
	}
}
