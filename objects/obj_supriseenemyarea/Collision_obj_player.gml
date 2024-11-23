add_baddieroom();
with (obj_supriseenemy)
{
	if (trigger == other.trigger)
		alarm[0] = 1;
}
instance_destroy();
