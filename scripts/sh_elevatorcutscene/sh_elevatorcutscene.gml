function sh_elevatorcutscene()
{
	if !WC_debug
		return WC_NODEBUG;
	
	with obj_player
	{
		state = states.titlescreen;
		x = -1000;
	}
	instance_create(0, 0, obj_elevatorcutscene);
	room_goto(tower_1);
}
function meta_elevatorcutscene()
{
	return {
		description: "",
	}
}
