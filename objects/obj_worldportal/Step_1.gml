live_auto_call;

depth = -100;

offset_by = function(by)
{
	var shiftlist = [
		obj_player1,
		obj_beatbox,
		obj_notes,
		obj_brickball,
		obj_brickcomeback,
		obj_dynamite,
		obj_dynamiteexplosion
	];
	
	while array_length(shiftlist)
	{
		with array_pop(shiftlist)
			x += by;
	}
	
	with obj_camera
		camx += by - (camx_real - camx) / 2;
	with obj_king
	{
		xstart += by;
		x += by;
	}
	with obj_parallax
	{
		var roombgs = room_get_bg_layers();
		for(var i = 0; i < array_length(roombgs); i++)
		{
			var l = roombgs[i];
			l.x += by % sprite_get_width(l.bg_sprite);
		}
		
		portal_offset.x -= by;
	}
	with obj_petfollow
	{
		var array = [];
		repeat ds_queue_size(followqueue)
			array_push(array, ds_queue_dequeue(followqueue));
		for(var i = 0; i < array_length(array); i++)
		{
			trace(array[i]);
			if i % 4 == 0
				ds_queue_enqueue(followqueue, array[i] + by);
			else
				ds_queue_enqueue(followqueue, array[i]);
		}
		x += by;
	}
}

var point = 6784, cam_x = obj_player1.x - 960 / 2;
if cam_x > point + 32
	offset_by(-point);
if cam_x <= 32
	offset_by(point);

with obj_camera
	chargecamera = 0;
