state = states.titlescreen;
vsp = 0;
depth = 0;

spr_fall = obj_player1.spr_lonegustavogroundpound;
spr_idle = spr_gustavo_exitsign;
spr_taunt = noone; // sugary
spr_dull = noone; // sugary
dulltimer = 1500; // sugary
taunting = false;

var room_letters = string_letters(room_get_name(room));
if room_letters == "freezer" || room_letters == "floor5room"
{
	spr_idle = spr_gustavo_exitsignfreezer;
	spr_fall = spr_gustavo_exitsignfreezer;
}
else if room == saloon_5 || room == saloon_4 || room == saloon_3 || room == saloon_2 || room == saloon_1
	spr_idle = spr_gustavo_exitsigndrunk;
else if room_letters == "chateau"
{
	spr_idle = spr_gustavorat_exitsign;
	spr_fall = spr_gustavorat_fall;
}
if room == space_11b
	spr_fall = spr_gustavo_exitshuttle;
