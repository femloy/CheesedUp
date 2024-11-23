with (other)
{
	if character != "V"
	{
		if (vsp < 0)
		{
			repeat (2)
				create_debris(x, y + 43, other.particle);
			vsp *= 0.5;
			scr_fmod_soundeffect(global.snd_cheesejump, x, y);
		}
		if (state == states.climbwall)
			state = grounded ? states.normal : states.jump;
	}
	if (hsp != 0 && (floor(image_index) % 4) == 0)
	{
		create_debris(x, y + 43, other.particle);
		if (!other.stepped)
		{
			sound_play_3d("event:/sfx/pep/cheesefloor", x, y);
			other.stepped = true;
			other.alarm[0] = 8;
		}
	}
}
