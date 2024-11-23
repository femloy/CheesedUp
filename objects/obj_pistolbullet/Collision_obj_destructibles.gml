if other.object_index == obj_onewaybigblock
{
	if sign(image_xscale) != sign(other.image_xscale)
		instance_destroy(other);
}
else
	instance_destroy(other);
