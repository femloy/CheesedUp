if (!ds_list_empty(global.debris_list))
{
	for (var i = 0; i < ds_list_size(global.debris_list); i++)
	{
		var q = ds_list_find_value(global.debris_list, i);
		if (is_struct(q))
		{
			with (q)
			{
				if (vsp < 20)
					vsp += grav;
				if (type == part_type.fadeout)
				{
					vsp = 0;
					alpha -= 0.05;
				}
				
				if struct_get(q, "momentum") != undefined
				{
					x += momentum[0];
					y += momentum[1];
					
					momentum[0] = Approach(momentum[0], 0, 0.1);
					momentum[1] = Approach(momentum[1], 0, 0.1);
				}
				x += hsp;
				y += vsp;
				
				var _destroy = false;
				if (animated)
				{
					if (image_index > image_number - 1)
					{
						image_index = frac(image_index);
						if (destroyonanimation)
							_destroy = true;
					}
					image_index += image_speed;
				}
				var outofx = x > (room_width + sprw) || x < -sprw;
				var outofy = y > (room_height + sprh) || y < -sprh;
				if (outofx || outofy || (type == part_type.fadeout && alpha <= 0))
					_destroy = true;
				if (_destroy)
				{
					ds_list_delete(global.debris_list, i);
					i--;
					delete q;
				}
			}
		}
	}
}
if (!ds_list_empty(global.collect_list))
{
	for (i = 0; i < ds_list_size(global.collect_list); i++)
	{
		var b = ds_list_find_value(global.collect_list, i);
		if (is_struct(b))
		{
			with (b)
			{
				var _dir = point_direction(x, y, 110, 80);
				if MOD.Mirror xor global.hud == HUD_STYLES.old
					_dir = point_direction(x, y, SCREEN_WIDTH - 110, 80);
				
				hsp = lengthdir_x(25, _dir);
				vsp = lengthdir_y(25, _dir);
				x += hsp;
				y += vsp;
				image_index = (image_index + 0.35) % image_number;
				
				outofx = x < 140;
				outofy = y < 120;
				
				if MOD.Mirror xor global.hud == HUD_STYLES.old
					outofx = x > SCREEN_WIDTH - 140;
				
				if outofx && outofy
				{
					with obj_camera
						collect_shake += 10;
					ds_list_delete(global.collect_list, i);
					i--;
					delete b;
				}
			}
		}
	}
}
