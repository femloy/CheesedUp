function sh_switchgustavo()
{
	if !WC_debug
		return "You do not have permission to use this command";
	
	with obj_player1
	{
		with instance_create_unique(0, 0, obj_charswitch_intro)
		{
			spr = scr_charswitch_sprite(other.isgustavo or other.noisecrusher);
			stable = false;
		}
		
		hsp = 0;
		vsp = 0;
		visible = false;
		state = states.actor;
	}
}
function meta_switchgustavo()
{
	return {
		description: "switches to and from gustavo or gloved noise",
	}
}
