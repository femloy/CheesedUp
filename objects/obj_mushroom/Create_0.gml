image_speed = 0.35;
depth = 5;
spr_idle = spr_bigmushroom;
spr_bounce = spr_bigmushroom_bounce;

if SUGARY_SPIRE
{
	sugary = SUGARY;
	if sugary
	{
		spr_idle = spr_marshmallowspring;
		spr_bounce = spr_marshmallowspring_active;
		sprite_index = spr_idle;
	}
}
