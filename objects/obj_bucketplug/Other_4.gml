if obj_player1.character != "N" && !global.swapmode
{
	with (instance_create(x, y, obj_spike))
	{
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
}
else
	sprite_index = spr_plug;
if (in_saveroom())
	sprite_index = spr_plugdead;
