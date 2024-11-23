live_auto_call;

var _x = x;
x += image_xscale * spd;
y += -spdh;

var dmg = 1.5;
scr_pistolcollision(dmg, _x);

if image_index > 7 && woosh
{
	image_speed = 0.35;
	spd = 20;
	
	//particle_set_scale(part.jumpdust, image_xscale, 1);
	//create_particle(x, y - 10, part.jumpdust);
	
	woosh = false;
}
if !woosh
	spd = Approach(spd, 20, 1);

instance_destroy(instance_place(x, y, obj_tntblock));
//instance_destroy(instance_place(x, y, obj_shotgunblock));
instance_destroy(instance_place(x, y, obj_enemyblock));
instance_destroy(instance_place(x, y, obj_electricpotato));
with instance_place(x, y, obj_clerk)
	event_user(0);
with instance_place(x, y, obj_onewaybigblock)
{
	if other.image_xscale == -image_xscale
		instance_destroy();
}

// aim
for(var i = 0; i < array_length(collision_list); i++)
{
	var obj = collision_list[i];
	var inst = instance_nearest(x, y, obj);
	
	if !inst// or inst.object_index == obj_grandpa
		continue;
	if object_is_ancestor(inst.object_index, obj_baddie) && inst.state == states.underground
		continue;
	
	var center = lerp(inst.bbox_top, inst.bbox_bottom, 0.3);
	if sign(inst.x - x) == image_xscale && distance_to_object(inst) < 800 && abs(y - center) < 200
	{
		y = Approach(y, center, 8);
		break;
	}
}
