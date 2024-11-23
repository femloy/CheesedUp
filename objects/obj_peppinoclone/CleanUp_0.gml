event_inherited();
destroy_sounds([snd]);

if state == states.grab or state == states.finishingblow
{
	with obj_player
	{
		if sprite_index == spr_hurt && state == states.actor
			state = states.normal;
	}
}
