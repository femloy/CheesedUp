for (var j = 0; j < array_length(menus); j++)
{
	var m = menus[j];
	for (var i = 0; i < array_length(m.options); i++)
	{
		var b = m.options[i];
		if (b.type == menutype.slide && b.sound != noone)
		{
			fmod_event_instance_stop(b.sound, true);
			sound_destroy_instance(b.sound);
		}
	}
}
