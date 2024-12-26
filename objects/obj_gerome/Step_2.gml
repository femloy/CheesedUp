if !april or global.panic or !IT_grabbable_gerome()
{
	instance_destroy(junkid);
	exit;
}

if !instance_exists(junkid)
{
	junkid = instance_create(x, y, obj_junkNEW);
	with junkid
	{
		visible = false;
		sprite_index = other.sprite_index;
		mask_index = other.mask_index;
		image_xscale = other.image_xscale;
	}
}
else
{
	image_xscale = junkid.image_xscale;
	image_yscale = junkid.image_yscale;
	x = junkid.x;
	y = junkid.y;
}
