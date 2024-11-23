if state == states.normal
{
	if ((hsp > 0 && x > obj_bucketdestination.x) || (hsp <= 0 && x <= obj_bucketdestination.x))
	{
		state++
		sound_play_3d("event:/sfx/playerN/bucket", x, y)
		instance_create(x, y, obj_bucketsplash)
		repeat 3
		{
			with (instance_create(x, y, obj_bucketsplash))
			{
				vsp = -random_range(6, 9)
				hsp = random_range(-2, 2)
			}
		}
	}
}
else
{
	if vsp < 20
		vsp += 0.4
	hsp = Approach(hsp, 0, 0.2)
	
	if REMIX
		sprite_index = spr_bucketfall;
}
x += hsp
y += vsp
