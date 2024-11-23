y = -sprite_height;
down = true;
movespeed = 2;
depth = -100;
event_user(0);

if SUGARY_SPIRE
{
	sugary = check_sugary();
	if sugary
		sprite_index = spr_lap2_ss;
}

if global.timeattack
	sprite_index = spr_timeattack;
