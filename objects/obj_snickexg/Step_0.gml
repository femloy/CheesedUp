event_inherited();
if deactivate
	instance_destroy(obj_snickexgquill);

if room == dungeon_pizzamart
{
	x = room_width / 2
	y = room_height + 100
}
else
{
	for (var i = floor((x - 50) / 32) * 32; i < floor((x + 50) / 32) * 32; i += 32)
	{
		for (var j = floor((y - 50) / 32) * 32; j < floor((y + 50) / 32) * 32; j += 32)
		{
			if choose(true, false) && irandom_range(0, 10) == 10
			{
				var lay_id = layer_get_id("Tiles_1")
				var map_id = layer_tilemap_get_id(lay_id);
				
				var data = tilemap_get_at_pixel(map_id, i, j);
				if data > 0
				{
					data = irandom_range(1, 97);
					tilemap_set_at_pixel(map_id, data, i, j);
				}
			}
		}
	}
}

if quillt <= 0 && !knocked
{
	instance_create(x, y, obj_snickexgquill);
	quillt = room_speed / 2
}
else
	quillt -= 1
