function sh_destroyice()
{
	if !WC_debug
		return WC_NODEBUG;
	
	instance_destroy(obj_iceblock);
	instance_destroy(obj_iceblockslope);
}
function meta_destroyice()
{
	return {
		description: "base game command",
	}
}
