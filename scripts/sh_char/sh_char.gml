function sh_char(args)
{
	if !WC_debug && (!string_starts_with(room_get_name(room), "tower") or global.panic)
		return "You cannot use this command inside of a level";
	if !instance_exists(obj_player1)
		return safe_get(obj_pause, "pause") ? "Can't do this while paused" : "The player is not in the room";
	if array_length(args) < 2
		return $"Current character: {obj_player1.character}";
	
	var char = string_upper(args[1]), skin = char;
	if array_length(args) >= 3
		skin = string_upper(args[2]);
	
	with obj_player1
	{
		character = skin; // visual character
		scr_characterspr();
		paletteselect = (character == "P" or character == "G" or character == "N") ? 1 : 0;
		character = char; // actual character
		
		// revert from gustavo
		if isgustavo && character != "G"
			state = states.normal;
		isgustavo = character == "G";
		brick = character == "G";
	}
	
	if char == "M"
		return "Yeah, good luck with that.";
	
}
function meta_char()
{
	return {
		description: "change characters",
		arguments: ["character", "<sprites>"],
		suggestions: [
			function()
			{
				var array = ["P", "N", "V", "S", "G", "M", "F", "MS"];
				if SUGARY_SPIRE
					array_push(array, "SP", "SN");
				if BO_NOISE
					array_push(array, "BN");
				return array;
			},
		],
	}
}
