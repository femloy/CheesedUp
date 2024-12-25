if global.lapmode != LAP_MODES.april
{
	ds_list_clear(global.baddietomb);
	exit;
}

if !ds_list_empty(global.baddietomb)
{
	var i = 0;
	repeat ds_list_size(global.baddietomb)
	{
		var arr = ds_list_find_value(global.baddietomb, i);
		var tombRoom = arr[0], X = arr[1], Y = arr[2];
		
		if !is_undefined(tombRoom) && !is_undefined(X) && !is_undefined(Y)
		{
			if room == tombRoom
			{
				with create_baddiegibsticks(X, Y)
				{
					storedx = X;
					storedy = Y;
					collisioned = true;
					hsp = 0;
					vsp = 0;
					image_index = image_number - 1;
				}
			}
		}
		i++;
	}
}
