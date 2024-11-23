image_index = 0.35;
if (room == rm_editor)
{
	if (check_solid(x, y + 32))
	{
		while (!check_solid(x, y + 1))
			y += 1;
	}
}
if (room == rm_editor)
	exit;
skip = false;
with obj_player1
{
	if character == "V" or isgustavo or character == "S"
		other.skip = true;
}
if !skip
{
	with (instance_create(x, y - 20, obj_grabmarker))
	{
		ID = other.id;
		other.ID = id;
	}
}
depth = 10;
