function sh_oobcam()
{
	if !WC_debug
		return WC_NODEBUG;
	
	WC_oobcam = !WC_oobcam;
	if !isOpen
		create_transformation_tip(concat("{s}Limitless camera ", WC_oobcam ? "ON" : "OFF", "/"),,,true);
	else
		return $"Limitless camera {(WC_oobcam ? "ON" : "OFF")}";
}
function meta_oobcam()
{
	return {
		description: "toggles the limitless camera",
	}
}
