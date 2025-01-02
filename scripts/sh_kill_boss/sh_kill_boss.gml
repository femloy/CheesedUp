function sh_kill_boss()
{
	if !WC_debug
		return WC_NODEBUG;
	instance_destroy(obj_baddie);
}
function meta_kill_boss()
{
	return {
		description: "base game command",
	}
}
