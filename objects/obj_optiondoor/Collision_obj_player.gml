var _actor = false;
with obj_player
{
	if state == states.actor
		_actor = true;
}
if _actor
	exit;

with other
{
	if key_up && grounded && !instance_exists(obj_option) && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.pogo || state == states.mach3 || state == states.Sjumpprep)
	{
		open_menu();
		
		instance_create(x, y, obj_option);
		state = states.actor;
		sprite_index = spr_idle;
		
		hsp = 0;
		vsp = 0;
	}
}
