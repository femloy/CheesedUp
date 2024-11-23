with (other)
{
	if scr_transformationcheck() or state == states.fireass
	{
		var _pindex = (object_index == obj_player1) ? 0 : 1;
		GamepadSetVibration(_pindex, 1, 1, 0.85);
		if (state != states.fireass)
			notification_push(notifs.boilingsauce, [room]);
		state = states.fireass;
		vsp = -20;
		fireasslock = false;
		sprite_index = spr_fireass;
		image_index = 0;
		movespeed = hsp;
		sound_play_3d("event:/sfx/pep/burn", x, y);
		if !fmod_event_instance_is_playing(global.snd_fireass)
			fmod_event_instance_play(global.snd_fireass);
	}
	else
		instance_destroy(other);
}
