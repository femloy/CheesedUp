function sh_giveheat(args)
{
	var style = 100;
	if array_length(args) > 1
	{
		if string_is_number(args[1])
			style = real(args[1]);
	}
	global.style += style;
}
function meta_giveheat()
{
	return
	{
		description: "gives heat",
		arguments: ["<heat>"],
	}
}
