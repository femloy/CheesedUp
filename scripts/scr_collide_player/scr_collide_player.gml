function scr_collide_player()
{
	grounded = false;
	grinding = false;
	collision_flags = 0;
	
	image_xscale = col_scale;
	if image_yscale != flip * col_scale
	{
		image_yscale = flip * col_scale;
		while scr_solid(x, y)
			y -= flip;
	}
	
	var vsp_final = (vsp + vsp_carry) * flip;
	vsp_carry = 0;
	
	var target_y = round(y + vsp_final);
	var bbox_size_y = abs(bbox_bottom - bbox_top);
	var t = abs(target_y - y) / bbox_size_y;
	var sv = sign(vsp_final) * col_scale;
	
	for (var i = 0; i < t; i++)
	{
		if col_scale == 1 && !scr_solid_player(x, y + (bbox_size_y * sv) * flip)
		{
			y += (bbox_size_y * sv);
			if ((vsp_final > 0 && y >= target_y) || (vsp_final < 0 && y <= target_y))
			{
				y = target_y;
				break;
			}
			continue;
		}
		repeat abs(target_y - y)
		{
			if !scr_solid_player(x, y + sv * flip)
				y += sv;
			else
			{
				vsp = 0;
				break;
			}
		}
		break;
	}
	
	// horizontal movement
	var hsp_final = hsp + hsp_carry;
	hsp_carry = 0;
	
	var target_x = round(x + hsp_final);
	var bbox_size_x = abs(bbox_right - bbox_left);
	var t = abs(target_x - x) / bbox_size_x;
	var sh = sign(hsp_final) * col_scale;
	
	var down = scr_solid_player(x, y + 1);
	for (i = 0; i < t; i++)
	{
		if col_scale == 1 && (!scr_solid_player(x + (bbox_size_x * sh), y) && down == scr_solid_player(x + (bbox_size_x * sh), y + 1) && !check_slope(x + (bbox_size_x * sh), y) && !check_slope(x, y) && !check_slope(x + (bbox_size_x * sh), y + 1))
		{
			x += (bbox_size_x * sh);
			if ((hsp_final > 0 && x >= target_x) || (hsp_final < 0 && x <= target_x))
			{
				x = target_x;
				break;
			}
			continue;
		}
		repeat abs(target_x - x)
		{
			// slopes
			for (var k = 1; k <= 4; k++)
			{
				if scr_solid_player(x + sh, y) && !scr_solid_player(x + sh, y - k * col_scale)
					y -= k * flip * col_scale;
				if state != states.ghost && state != states.rocket
				{
					if !scr_solid_player(x + sh, y) && !scr_solid_player(x + sh, y + col_scale) && scr_solid_player(x + sh, y + (k + 1) * col_scale)
						y += k * flip * col_scale;
					
					if (!check_slope_pos(x + sh, y, obj_grindrailslope) && !check_slope_pos(x + sh, y + k * col_scale, obj_grindrailslope) && check_slope_pos(x + sh, y + (k + 1) * col_scale, obj_grindrailslope))
					&& state != states.grind
						y += k * col_scale;
				}
			}
			if !scr_solid_player(x + sh, y)
				x += sh;
			else
			{
				hsp = 0;
				break;
			}
		}
		break;
	}
	
	// gravity
	if vsp < 20
		vsp += grav * global.world_gravity;
	
	// moving platforms
	if (platformid != noone)
	{
		if (vsp < -1 || !instance_exists(platformid) || (!place_meeting(x, y + 16, platformid) || !place_meeting(x, y + 32, platformid)))
		{
			platformid = noone;
			y = floor(y);
		}
		else
		{
			grounded = true;
			vsp = grav;
			if platformid.vsp > 0
				vsp_carry = platformid.vsp;
			
			y = platformid.y - 46 * col_scale;
			if !place_meeting(x, y + col_scale, platformid)
				y++;
			
			if platformid.v_velocity != 0
			{
				if scr_solid(x, y)
				{
					for (i = 0; scr_solid(x, y); i++)
					{
						y--;
						if i > 32
							break;
					}
				}
				if scr_solid(x, y)
				{
					for (i = 0; scr_solid(x, y); i++)
					{
						y++;
						if i > 64
							break;
					}
				}
			}
		}
	}
	
	// on ground check
	grounded |= scr_solid_player(x, y + col_scale);
	
	var plat = instance_place(x, y + col_scale * flip, obj_platform);
	if plat
	{
		if sign(plat.image_yscale) != flip or (SUGARY_SPIRE && plat.object_index == obj_cottonplatform_tiled && state != states.cotton && state != states.cottonroll)
			plat = noone;
	}
	
	grounded |= ((vsp >= 0 or !REMIX) && !place_meeting(x, y, obj_platform) && plat != noone);
	grinding = !place_meeting(x, y, obj_grindrail) && place_meeting(x, y + flip, obj_grindrail);
	
	grounded |= grinding;
	if platformid != noone || (place_meeting(x, y + flip, obj_movingplatform) && !place_meeting(x, y - 3 * flip, obj_movingplatform))
		grounded = true;
	if grounded && platformid == noone && col_scale == 1
		y = floor(y);
	
	// snap on top of sloped platforms
	if grounded && vsp >= 0 && flip > 0
	{
		//while inside_slope(obj_slope_platform)
		//	y--;
	}
}
