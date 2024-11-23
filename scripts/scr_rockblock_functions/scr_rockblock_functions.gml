function scr_rockblock_tag()
{
	with obj_rockblock
	{
		if !destroy && distance_to_object(other) <= 1
		{
			destroy = true;
			scr_rockblock_tag();
		}
	}
	with obj_destructiblerockblock
	{
		if !destroy && distance_to_object(other) <= 1
		{
			destroy = true;
			scr_rockblock_tag();
		}
	}
}
