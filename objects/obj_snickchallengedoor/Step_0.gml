if locked
{
	sprite_index = spr_doorblocked;
	if uparrowID != noone
	{
		instance_destroy(uparrowID);
		uparrowID = noone;
	}
}
