event_inherited();
spr_dead = spr_ratblock_dead;

depth = 2;
anim = false;
baddie = false;
animy = 0;

sniffsnd = fmod_event_create_instance("event:/sfx/rat/ratsniff");
sound_instance_move(sniffsnd, x, y);
use_sound = true;
deadsnd = "event:/sfx/rat/ratdead";
if (place_meeting(x + 1, y, object_index) && place_meeting(x - 1, y, object_index))
	use_sound = false;
if (use_sound && place_meeting(x + 1, y, object_index) && !place_meeting(x - 1, y, object_index))
	use_sound = false;

if BO_NOISE
{
	if MIDWAY && sprite_index == spr_ratblock
	{
		sprite_index = spr_ratblock_bo;
		spr_dead = spr_ratblock_dead_bo;
		use_sound = false;
	}
}

if SUGARY_SPIRE
{
	sugary = check_sugary();
	if sugary && sprite_index == spr_ratblock
	{
		sprite_index = spr_chocofrogbig;
		spr_dead = spr_chocofrogbigdead;
		use_sound = false;
	}
}
