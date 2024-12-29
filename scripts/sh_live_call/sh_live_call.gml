function sh_live_call(args)
{
	if !WC_debug
		return "You do not have permission to use this command";
	if !live_enabled
		return "GMLive is not enabled";
	if array_length(args) < 2
		return "Argument missing: code";
	
	var code = string_copy(consoleString, string_pos(" ", consoleString) + 1, string_length(consoleString));
	trace("CODE TO RUN: ", code);
	if !live_execute_string(code)
		return string(live_result);
}
function meta_live_call()
{
	return
	{
		description: "run code with gmlive",
		arguments: ["code"],
	}
}
