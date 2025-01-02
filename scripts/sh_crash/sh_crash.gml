function sh_crash()
{
	if !WC_debug
		return WC_NODEBUG;
	
	throw "Crash text";
}
function meta_crash()
{
	return {
		description: "crash the game",
	}
}
