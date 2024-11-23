with (obj_teleporter)
{
	if (trigger == other.trigger && !start)
	{
		repeat (8)
		{
			with (instance_create(x + random_range(50, -50), y + random_range(50, -50), obj_cloudeffect))
				sprite_index = spr_teleporteffect;
		}
	}
}
with (obj_pizzaball)
{
	visible = true;
	if (check_solid(x, y))
		y--;
}
