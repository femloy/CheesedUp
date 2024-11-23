with (obj_player1)
{
	if (hsp != 0 && grounded && (floor(image_index) % 10) == 0)
	&& (!REMIX or (!place_meeting(x, y + 1, obj_iceblock) && !place_meeting(x, y + 1, obj_iceblockslope)))
		create_debris(x, y + 43, spr_snowparticle);
}
