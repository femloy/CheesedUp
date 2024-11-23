function scr_collide()
{
	grounded = false;
	
	// start standing on moving platform if we're not gonna be below it
	with (instance_place(x, y + 2 * flip, obj_movingplatform))
	{
		with (other)
		{
			if !place_meeting(x, y - (3 + abs(other.v_velocity)) * flip, other) && sign(other.image_yscale) == flip
			{
				platformid = other.id;
				hsp_carry = other.hsp;
				if (abs(other.vsp) > 2)
					vsp_carry = other.vsp;
			}
		}
	}
	
	// vertical
	var vsp_final = (vsp + vsp_carry) * flip;
	vsp_carry = 0;
	var target_y = round(y + vsp_final);
	var bbox_size_y = abs(bbox_bottom - bbox_top);
	var t = abs(target_y - y) / bbox_size_y;
	var sv = sign(vsp_final);
	
	for (var i = 0; i < t; i++)
	{
		if (!scr_solid(x, y + (bbox_size_y * sv) * flip))
		{
			y += (bbox_size_y * sv);
			if ((vsp_final > 0 && y >= target_y) || (vsp_final < 0 && y <= target_y))
			{
				y = target_y;
				break;
			}
			continue;
		}
		repeat (abs(target_y - y))
		{
			if (!scr_solid(x, y + sv * flip))
				y += sv;
			else
			{
				vsp = 0;
				break;
			}
		}
		break;
	}
	
	// horizontal
	var hsp_final = hsp + hsp_carry;
	hsp_carry = 0;
	var target_x = round(x + hsp_final);
	var bbox_size_x = bbox_right - bbox_left;
	t = abs(target_x - x) / bbox_size_x;
	var sh = sign(hsp_final);
	
	var down = scr_solid(x, y + 1);
	for (i = 0; i < t; i++)
	{
		if (!scr_solid(x + (bbox_size_x * sh), y) && down == scr_solid(x + (bbox_size_x * sh), y + 1))
		{
			x += (bbox_size_x * sh);
			if ((hsp_final > 0 && x >= target_x) || (hsp_final < 0 && x <= target_x))
			{
				x = target_x;
				break;
			}
			continue;
		}
		repeat (abs(target_x - x))
		{
			// slopes
			for (var k = 1; k <= 3; k++)
			{
				if (scr_solid(x + sh, y) && !scr_solid(x + sh, y - k))
					y -= k * flip;
				if (!scr_solid(x + sh, y) && !scr_solid(x + sh, y + 1) && scr_solid(x + sh, y + (k + 1)))
					y += k * flip;
			}
			if (!scr_solid(x + sh, y))
				x += sh;
			else
			{
				hsp = 0;
				break;
			}
		}
	}
	
	// gravity
	if vsp < 10
		vsp += grav * global.world_gravity;
	
	// standing on moving platform
	if (platformid != noone)
	{
		if (vsp < 0 || !instance_exists(platformid) || !place_meeting(x, y + 12 + (abs(platformid.v_velocity) * 2), platformid))
		{
			platformid = noone;
			y = floor(y);
		}
		else
		{
			grounded = true;
			vsp = grav;
			if (platformid.vsp > 0)
				vsp = abs(platformid.v_velocity);
			y = platformid.y - 46;
			if (!place_meeting(x, y + 1, platformid))
			{
				i = 0;
				while (!place_meeting(x, y + 1, platformid))
				{
					y++;
					if (i > abs(sprite_height))
						break;
				}
			}
			if (platformid.v_velocity != 0)
			{
				if (scr_solid(x, y))
				{
					for (i = 0; scr_solid(x, y); i++)
					{
						y--;
						if (i > 32)
							break;
					}
				}
				if (scr_solid(x, y))
				{
					for (i = 0; scr_solid(x, y); i++)
					{
						y++;
						if (i > 64)
							break;
					}
				}
			}
		}
	}
	
	// on ground check
	grounded |= scr_solid(x, y + 1);
	grounded |= (!place_meeting(x, y, obj_platform) && place_meeting(x, y + flip, obj_platform));
	if (platformid != noone || (place_meeting(x, y + flip, obj_movingplatform) && !place_meeting(x, y - 2 * flip, obj_movingplatform)))
		grounded = true;
	
	if grounded && vsp >= 0 && flip > 0
	{
		while inside_slope(obj_slope_platform)
			y--;
	}
}
