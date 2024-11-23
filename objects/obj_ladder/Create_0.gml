depth = 7;
if SUGARY
{
	visible = true;
	sprite_index = spr_ladder_sugary;
	depth = 32;
}
if ((global.leveltosave == "grinch" or global.leveltosave == "etb" or global.leveltosave == "ancient") && !room_is_secret(room))
or MOD.OldLevels
	visible = true;
if REMIX
	mask_index = spr_solid;
