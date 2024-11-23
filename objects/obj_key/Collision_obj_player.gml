if (room == rm_editor)
	exit;
if (global.key_inv)
	exit;
if instance_exists(obj_genericdeath)
	exit;

with (other)
{
	if SUGARY_SPIRE && other.sugary
	{
		instance_destroy(other);
		global.key_inv = true;
		sound_play("event:/sfx/misc/collecttoppin");
		global.combotime = 60;
		global.heattime = 60;
		instance_create(x, y, obj_spookeyfollow);
		with instance_create(x, y, obj_taunteffect)
			player = noone;
	}
	else
	{
		if (state != states.bombpep && state != states.gotoplayer && state != states.ghost && state != states.knightpep && state != states.cheeseball && state != states.boxxedpep && state != states.cheesepep && state != states.knightpepattack && state != states.knightpepslopes && state != states.hurt && state != states.knightpepbump)
		{
			instance_destroy(other);
			goblinkey = false;
			global.key_inv = true;
			key_particles = true;
			alarm[7] = 30;
			sound_play("event:/sfx/misc/collecttoppin");
			state = states.keyget;
			image_index = 0;
			keysound = false;
			global.combotime = 60;
			global.heattime = 60;
		}
	}
}
