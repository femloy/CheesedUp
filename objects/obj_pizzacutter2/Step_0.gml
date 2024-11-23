if instance_exists(handleID)
{
	image_angle = handleID.image_angle;
	image_blend = handleID.image_blend;
}
else
	handleID = noone;

if parry_timer > 0
{
	parry_timer--;
	if parry_timer == 0
		create_particle(x + lengthdir_x(32, image_angle - 90), y + lengthdir_y(32, image_angle - 90), part.genericpoofeffect);
}
