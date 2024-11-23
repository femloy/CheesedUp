function sh_showinvisible(args)
{
	if array_length(args) > 1
	{
		var mode = args[1];
		if mode == "none" or mode == "0"
			mode = 0;
		else if mode == "sprites_only" or mode == "1"
			mode = 1;
		else if mode == "all" or mode == "2"
			mode = 2;
		else
			return "Invalid mode";
		
		WC_showinvisible = mode;
	}
	else
	{
		WC_showinvisible = !min(WC_showinvisible, 1);
		WC_showcollisions = false;
		toggle_collisions(false);
		return $"Showing invisible objects {(WC_showinvisible ? "ON" : "OFF")}";
	}
}
function meta_showinvisible()
{
	return {
		description: "if active, redraws every instance in the room, revealing invisible ones",
		arguments: ["<mode>"],
		suggestions: [
			["none", "sprites_only", "all"],
		],
	}
}
