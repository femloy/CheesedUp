event_inherited();

sprite_index = spr_ratblock6;
spr_dead = spr_ratblock6_dead;

if BO_NOISE && MIDWAY
{
	sprite_index = spr_ratblock6_bo;
	spr_dead = spr_ratblock6_dead_bo;
}
if SUGARY_SPIRE && sugary
{
	sprite_index = spr_chocofrogsmall;
	spr_dead = spr_chocofrogsmalldead;
}

if check_char("G")
{
	instance_change(obj_collect, false);
	event_perform_object(obj_collect, ev_create, 0);
}
