live_auto_call;

x += hsp;
y += vsp;

var dmg = 1;
var result = scr_pistolcollision(dmg, xprevious, false);

if !result && place_meeting(x, y, obj_solid) or collision_line(x, y, x, yprevious, obj_platform, 0, 0)
	instance_destroy();

for(var i = 0; i < array_length(collision_list); i++)
{
	var obj = collision_list[i];
	var inst = instance_nearest(x, y, obj);
	if !inst
		continue;
	
	var center = lerp(inst.bbox_top, inst.bbox_bottom, 0.3);
	if sign(inst.x - x) == image_xscale && distance_to_object(inst) < 400 && abs(y - center) < 200
	{
		y = Approach(y, center, 8);
		break;
	}
}
