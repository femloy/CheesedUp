var _sound = false;
if (place_meeting(x, y, obj_player))
{
	with (obj_hiddenobject)
	{
		if (!activated && trigger == other.trigger)
		{
			_sound = true;
			event_user(0);
		}
	}
}
if (_sound)
{
	if REMIX
	{
		sound_stop(sfx_collectpizza);
		//fmod_event_instance_set_parameter(global.snd_secretwall, "state", check_sugarychar(), false);
		fmod_event_instance_play(global.snd_secretwall);
	}
	else if !SUGARY
		sound_play("event:/sfx/misc/collectpizza");
}
