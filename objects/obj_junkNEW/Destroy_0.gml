if !in_saveroom()
{
	with instance_create(x, y, obj_debris)
	{
		sprite_index = other.sprite_index;
		image_index = other.img;
	}
	add_saveroom();
}
