function sh_sv_cheats(args)
{
	if args[1] == "1"
	{
		isOpen = true;
		return "thats not funny";
	}
	else if args[1] == "0"
		instance_destroy();
	else
	{
		isOpen = true;
		return args[1] + " is not a valid boolean";
	}
}
function meta_sv_cheats()
{
	return {
		description: "This boolean ConVar enables/disables cheats on the server. It also gives you access to commmands that would normally be abused or misused by players. When building maps, you may want this as a startup command.",
		arguments: ["boolean"],
		suggestions: [
			["0", "1"]
		],
		hidden: true
	}
}
