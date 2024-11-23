if !in_saveroom()
{
	if (!place_meeting(x, y, obj_gnomecustomer))
	{
		if SUGARY_SPIRE && sugary
		{
			repeat 6
				create_debris(x, y, spr_confecticage_debris, false);
		}
		else if !(BO_NOISE && bo)
		{
			with (create_debris(x, y - 32, spr_cagedebris, false))
				image_index = 0;
			with (create_debris(x, y + 32, spr_cagedebris, false))
				image_index = 1;
			with (create_debris(x - 10, y, spr_cagedebris, false))
				image_index = 2;
			with (create_debris(x, y, spr_cagedebris, false))
				image_index = 3;
			with (create_debris(x + 10, y, spr_cagedebris, false))
				image_index = 4;
		}
		//sound_play_3d("event:/misc/breakblock", x, y);
	}
	add_saveroom();
}
