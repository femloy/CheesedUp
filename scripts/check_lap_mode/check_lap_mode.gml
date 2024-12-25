function check_lap_mode(lapmode)
{
	if global.timeattack
		return lapmode == LAP_MODES.normal;
	
	if instance_exists(obj_cyop_loader) && global.in_afom
		return global.afom_lapmode == lapmode;
	
	if lapmode == LAP_MODES.april
		return global.lapmode == lapmode && !MOD.FromTheTop && global.leveltosave != "war" && global.leveltosave != "exit";
	else
		return global.lapmode == lapmode;
}
