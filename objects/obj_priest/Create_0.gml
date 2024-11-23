if check_char(["S", "G", "V"])
{
	with instance_create(x, y - 18, obj_ratfairy)
	{
		ID = other.id;
		//instant = true;
		minus = 50;
		value = 500;
	}
	instance_destroy();
	exit;
}

image_speed = 0.35;
mask_index = spr_priest_idle;
collect = true;
escape = false;
depth = 1;

spr_idle = spr_priest_idle;
spr_pray = spr_priest_pray;

if SUGARY_SPIRE && check_sugary()
{
	spr_idle = spr_cultist;
	spr_pray = spr_cultist_pray;
}

sprite_index = spr_idle;
