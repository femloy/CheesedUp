function scr_changetoppings()
{
	with obj_collect
	{
		var spr = scr_collectspr(,,false);
		if spr != sprite_index
		{
			sprite_index = spr;
			create_particle(x + sprite_width / 2, y + sprite_height / 2, part.cloudeffect);
		}
	}
}
