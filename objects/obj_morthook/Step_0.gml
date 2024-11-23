var _found = false;
with obj_player
{
	if (state == states.mort || state == states.mortjump || state == states.mortattack || state == states.morthook)
	or (character == "V" && global.vigiweapon == vweapons.hook)
		_found = true;
}
if _found
	image_alpha = 1;
else
	image_alpha = 0.5;
if projectilebuffer > 0
	projectilebuffer--;
