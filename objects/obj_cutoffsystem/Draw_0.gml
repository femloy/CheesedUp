if (obj_drawcontroller.use_dark && SUGARY) or global.performance
	exit;

var f = function(c, i)
{
	x = c.x;
	y = c.y;
	sprite_index = c.big ? spr_64x64cutoff : spr_32x32cutoff;
	image_index = c.img;
	image_angle = c.angle;
	
	if c.buffer > 0
		--c.buffer;
	
	var sold = instance_place(x, y, obj_solid);
	if sold && (sold.object_index == obj_solid or sold.object_index == obj_secretblock or sold.object_index == obj_secretbigblock or sold.object_index == obj_secretblock2 or sold.object_index == obj_secretbigblock2)
	{
		if image_angle == 0
			y++;
		else if image_angle == 180
			y--;
		
		draw_self();
	}
}
array_foreach(cutoffs, f, 0, infinity);
