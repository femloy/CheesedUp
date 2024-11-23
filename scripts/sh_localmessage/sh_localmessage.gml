function sh_localmessage(args)
{
	if array_length(args) < 2
		return "Argument missing: author";
	if array_length(args) < 3
		return "Argument missing: message";
	
	var author = args[1], message = WCscr_allargs(args, 2);
	if author == "noone"
		author = noone;
	
	global_message(message, author);
}
function meta_localmessage()
{
	return
	{
		description: "triggers an online global message, but only you can see it",
		arguments: ["author", "message"],
	}
}
