if (playerid != noone)
{
	with (playerid)
	{
		if (floor(image_index) >= 9)
		{
			if ((global.noisejetpack && character != "N") || (noisepizzapepper && character == "N"))
			{
				sound_play_3d("event:/sfx/misc/cow", x, y);
				if (character != "N")
					global.noisejetpack = false;
				else
					noisepizzapepper = false;
			}
		}
		if (floor(image_index) == (image_number - 1))
		{
			state = states.normal;
			landAnim = false;
			with (other)
			{
				playerid = noone;
				if !in_saveroom()
				{
					add_saveroom();
					global.collect += 1000;
					global.combotime = 60;
					with (instance_create(x, y, obj_smallnumber))
						number = string(1000);
				}
			}
		}
	}
}
if (sprite_index == spr_freemilksuprised && floor(image_index) == (image_number - 1))
	sprite_index = spr_freemilk;
