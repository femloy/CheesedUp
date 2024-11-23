event_inherited();
dmg = 30;
parryable = true;
boss_parry_hitbox = function(argument0, argument1)
{
	if (!argument1.collisioned)
	{
		SUPER_parry();
		with (obj_pizzafaceboss)
			SUPER_boss_hurt(30, argument0);
		with (argument1)
			event_user(0);
	}
};
