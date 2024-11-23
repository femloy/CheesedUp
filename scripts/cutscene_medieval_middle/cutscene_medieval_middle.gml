function cutscene_medieval_middle()
{
	var _finish = false;
	with (obj_knightplatform)
	{
		y = Approach(y, y_to, 5);
		if (y == y_to)
			_finish = true;
	}
	shake_camera(5, 10 / room_speed);
	if (_finish)
		cutscene_end_action();
}
