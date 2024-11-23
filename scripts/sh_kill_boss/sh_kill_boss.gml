function sh_kill_boss()
{
	if !WC_debug
		return "You do not have permission to use this command";
	instance_destroy(obj_baddie);
}
function meta_kill_boss()
{
	return {
		description: "base game command",
	}
}
