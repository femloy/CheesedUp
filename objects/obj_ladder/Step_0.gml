with obj_player
{
	if place_meeting(x, y + 1, other)
	{
		if place_meeting(x, y + 1, obj_platform) && !check_solid(other.x + 16, y + 1) && key_down && ladderbuffer <= 0
		&& ((state == states.freefall && grounded && REMIX)
		or (state == states.machcancel && (sprite_index == spr_playerN_divebomb || sprite_index == spr_playerN_divebombland) && move == 0 && grounded && REMIX)
		or state == states.crouch or state == states.ratmountcrouch
		or (((character == "S" && abs(movespeed) < 8) or character == "M") && (state == states.normal or state == states.mach1)))
		{
			if REMIX
				smoothx = x - (other.x + 16);
			
			y += 5;
			if isgustavo
			{
				state = states.ratmountladder;
				if brick && character != "V"
				{
					with instance_create(x, y, obj_brickcomeback)
					{
						wait = true;
						create_particle(x, y, part.genericpoofeffect);
					}
					brick = false;
				}
			}
			else
				state = states.ladder;
			
			x = other.x + 16;
			y = floor(y);
			if y % 2 == 1
				y -= 1;
		}
	}
}
