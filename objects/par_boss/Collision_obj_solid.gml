if (!colliding)
	exit;
var ty = try_solid(0, -1, obj_solid, 64);
if (ty != -1)
	y -= ty;
var tx = try_solid(image_xscale, 0, obj_solid, 64);
if (tx != -1)
	x += (tx * image_xscale);
if (check_solid(x, y))
{
	ty = try_solid(0, 1, obj_solid, 64);
	if (ty != -1)
		y += ty;
	tx = try_solid(-image_xscale, 0, obj_solid, 64);
	if (tx != -1)
		x += (tx * -image_xscale);
}
