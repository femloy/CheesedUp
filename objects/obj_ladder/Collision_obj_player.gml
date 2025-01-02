with (other)
{
	if (key_up && ladderbuffer <= 0 && (state == states.normal or state == states.pogo or state == states.machcancel or state == states.mach2 or state == states.mach3 or state == states.mach1 or state == states.punch or state == states.shotgunjump or state == states.jump or state == states.highjump or (state == states.ratmountbounce && character == "N")
	or state == states.removed_state))
	{
		if REMIX
			smoothx = x - (other.x + 16);
		
		input_buffer_jump = 0;
		state = states.ladder;
		x = other.x + 16;
		y = floor(y);
		if ((y % 2) == 1)
			y -= 1;
	}
	if (key_up && ladderbuffer <= 0 && isgustavo && (state == states.ratmountjump || state == states.ratmountbounce || state == states.noisecrusher or state == states.ratmount))
	{
		if REMIX
			smoothx = x - (other.x + 16);
		
		input_buffer_jump = 0;
		state = states.ratmountladder;
		if brick && character != "V"
		{
			with instance_create(x, y, obj_brickcomeback)
			{
				wait = true;
				create_particle(x, y, part.genericpoofeffect);
			}
		}
		brick = false;
		x = other.x + 16;
		y = floor(y);
		if ((y % 2) == 1)
			y -= 1;
	}
}
