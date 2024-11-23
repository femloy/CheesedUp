var checker = (obj_player1.character == character);
if checker == invert
	exit;

if is_array(obj)
{
	array_foreach(obj, function(i)
	{
		with i
		{
			if !persistent && place_meeting(x, y, other)
				instance_destroy(id, false);
		}
	});
}
else
{
	with obj
	{
		if !persistent && place_meeting(x, y, other)
			instance_destroy(id, false);
	}
}
