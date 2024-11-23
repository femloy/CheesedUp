with (other)
{
	if (other.appear == -1 && key_up && ladderbuffer == 0 && (state == states.fireass || state == states.machcancel || state == states.punch || state == states.normal || state == states.pogo || state == states.mach2 || state == states.mach3 || state == states.mach1 || state == states.shotgunjump || state == states.jump || state == states.highjump or state == states.twirl))
	{
		fmod_event_instance_play(other.snd);
		other.hooked = true;
		hooked = true;
		mach2 = 0;
		state = states.ladder;
		x = other.x + 16;
		y = other.y + 40;
	}
	if (other.appear == -1 && key_up && ladderbuffer == 0 && (state == states.ratmountjump || state == states.ratmountbounce || state == states.ratmount) && character != "N")
	{
		fmod_event_instance_play(other.snd);
		other.hooked = true;
		hooked = true;
		state = states.ratmountladder;
		if (brick == 1)
		{
			with (instance_create(x, y, obj_brickcomeback))
			{
				wait = true;
				create_particle(x, y, part.genericpoofeffect);
			}
		}
		brick = false;
		x = other.x + 16;
		y = other.y + 40;
	}
}
