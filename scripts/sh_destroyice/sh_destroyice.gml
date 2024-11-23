function sh_destroyice()
{
	if !WC_debug
		return "You do not have permission to use this command";
	
	instance_destroy(obj_iceblock);
	instance_destroy(obj_iceblockslope);
}
function meta_destroyice()
{
	return {
		description: "base game command",
	}
}
