function sh_crash()
{
	if !WC_debug
		return "You do not have permission to use this command";
	
	throw "Crash text";
}
function meta_crash()
{
	return {
		description: "crash the game",
	}
}
