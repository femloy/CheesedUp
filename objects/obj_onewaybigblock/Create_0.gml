if (room == rm_editor)
	exit;

event_inherited();
image_speed = 0.35;
depth = 1;
solid_inst = noone;

if instance_exists(obj_cyop_loader)
	alarm[0] = 1;
else
	event_perform(ev_alarm, 0);

// sprite
deadspr = spr_bigdoughblockdead;
particlespr = noone;

if global.blockstyle == blockstyles.old
{
	sprite_index = spr_onewaybigblock_old;
	deadspr = noone;
	particlespr = spr_bigdebris;
}

if SUGARY
{
	sprite_index = spr_onewaybigblock_ss;
	deadspr = noone;
}

if MIDWAY
{
	sprite_index = spr_onewaybigblock_bo;
	deadspr = spr_bigdoughblockdead_bo;
}
