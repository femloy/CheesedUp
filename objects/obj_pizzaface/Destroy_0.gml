if room == rank_room
{
	var _x = savedx - savedcx;
	var _y = savedy - savedcy;
	
	while (_x > SCREEN_WIDTH - 100)
		_x -= 20;
	while (_y > SCREEN_HEIGHT - 100)
		_y -= 20;
	while (_x < 100)
		_x += 20;
	while (_y < 100)
		_y += 20;
}
else
	var _x = x, _y = y;

with (instance_create(_x, _y, obj_shakeanddie))
	sprite_index = spr_pizzahead_intro1;
sound_play_3d("event:/sfx/misc/explosion", _x, _y);
sound_play_3d("event:/sfx/pep/groundpound", _x, _y);
