if !global.swapmode
{
	instance_destroy();
	exit;
}

if room == rank_room
	visible = false;
else
	visible = true;

if swap_index == global.swap_index
{
	swap_index++;
	if swap_index >= array_length(global.swap_characters)
		swap_index = 0;
	
	character = global.swap_characters[swap_index];
	if character != "N" && obj_player1.noisecrusher
		isgustavo = true;
	alarm[0] = 1;
}

playerid = obj_player1.id;
image_speed = 0.35;
if obj_player1.key_taunt_p2 && taunttimer <= 0 && usable
{
	taunttimer = 20;
	sprite_index = spr_taunt;
	image_speed = 0;
	tauntID = instance_create(x, y, obj_baddietaunteffect);
	tauntID.depth = 0;
	sound_play_3d("event:/sfx/pep/taunt", x, y);
	image_index = irandom(sprite_get_number(spr_taunt) - 1);
}
if !isgustavo && obj_player1.key_taunt2_p2
	breakdance_pressed++;
else
	breakdance_pressed = 0;
