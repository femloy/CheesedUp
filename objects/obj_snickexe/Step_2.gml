/// @description push out of other snicks
var snick = instance_place(x, y, obj_snickexe);
if snick
{
	var dir = sign(x - snick.x);
	if dir == 0
		dir = 1;
	while place_meeting(x, y, snick)
		x += dir;
}
