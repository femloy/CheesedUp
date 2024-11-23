SS_CODE_START;

scr_collide();
hsp = image_xscale * movespeed;
	
instance_destroy(instance_place(x + hsp, y, obj_baddie));
instance_destroy(instance_place(x + hsp, y, obj_destructibles));
instance_destroy(instance_place(x + hsp, y, obj_ratblock));

if check_solid(x + image_xscale, y) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_ratblock)
{
	trace("bigcherry hitwall");
	instance_destroy();
}

SS_CODE_END;
