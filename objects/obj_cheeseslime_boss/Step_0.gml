event_inherited();

if state == states.arenaintro
{
	image_xscale = -1;
	if --intro_wait <= 0 or skipintro
	{
		spotlightID.expand = true;
		state = states.walk;
		sprite_index = walkspr;
		
		with obj_player
			state = states.normal;
	}
	else
	{
		hsp = 0;
		sprite_index = idlespr;
		image_speed = 0.35;
		
		with obj_player
			sprite_index = spr_idle;
	}
}
