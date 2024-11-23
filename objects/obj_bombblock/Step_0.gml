with obj_player
{
	if state == states.bombpep && sprite_index != spr_bombpepend
	&& distance_to_object(other) <= 1
	{
		instance_create(x, y, obj_bombexplosion);
		GamepadSetVibration(0, 1, 1, 0.9);
		hurted = true;
		vsp = -4;
		image_index = 0;
		sprite_index = spr_bombpepend;
		state = states.bombpep;
		bombpeptimer = 0;
	}
}
