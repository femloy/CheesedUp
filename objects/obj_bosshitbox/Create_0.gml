collisioned = false;
dmg = 30;
parryable = false;
parried = false;
team = 1;

SUPER_player_hurt = function(argument0, argument1)
{
	if (!collisioned && argument1.state != states.arenaround)
	{
		if (instance_exists(obj_bosscontroller))
			obj_bosscontroller.player_hp -= argument0;
		collisioned = true;
		with (argument1)
		{
			var lag = 8;
			scr_hitstun_enemy(id, lag, 15, -8);
			xscale = (x != other.x) ? sign(other.x - x) : other.image_xscale;
			hitxscale = (x != other.x) ? sign(other.x - x) : other.image_xscale;
			sprite_index = spr_hurt;
			hitstunned = 100;
			instance_create(other.x, other.y, obj_parryeffect);
			repeat 2
			{
				create_slapstar(x, y);
				create_baddiegibs(x, y);
			}
			shake_camera(3, 3 / room_speed);
		}
	}
}
SUPER_parry = function()
{
	if (!parried)
	{
		team = 0;
		parried = true;
	}
}
SUPER_boss_hurt = function(argument0)
{
	if (!collisioned && team != argument0.team)
	{
		with (argument0)
			boss_hurt_noplayer(other.dmg);
		collisioned = true;
	}
}
boss_hurt = function(argument0)
{
	SUPER_boss_hurt(argument0);
}
parry = function()
{
	SUPER_parry();
}
player_hurt = function(argument0, argument1)
{
	SUPER_player_hurt(argument0, argument1);
}
