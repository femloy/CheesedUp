image_speed = 0.35;
depth = 20;
switch (state)
{
	case states.titlescreen:
		x = camera_get_view_x(view_camera[0]) - 100;
		y = camera_get_view_y(view_camera[0]) - 100;
		var dx = 350;
		var dy = 400;
		if (spr_fall == spr_gustavo_exitshuttle)
		{
			dx = 200;
			dy = 220;
		}
		if (global.panic && distance_to_pos(xstart, ystart, obj_player1.x, obj_player1.y, dx, dy))
		{
			state = states.fall;
			vsp = 20;
			x = xstart;
			y = camera_get_view_y(view_camera[0]) - 100;
			sprite_index = spr_fall;
		}
		break;
	
	case states.fall:
		y += vsp;
		if (vsp < 20)
			vsp += 0.5;
		with (instance_place(x, y, obj_baddiecollisionbox))
		{
			instance_destroy(baddieID);
			instance_destroy();
		}
		if (y >= ystart)
		{
			y = ystart;
			instance_destroy(instance_place(x, y, obj_ramp));
			create_particle(x, y, part.landcloud);
			state = states.normal;
			if (sprite_index == spr_gustavo_exitshuttle)
			{
				with (instance_create(x, y, obj_shuttleparts))
				{
					image_index = 3;
					vspeed = 10;
				}
				with (instance_create(x, y, obj_shuttleparts))
				{
					image_index = 2;
					vspeed = -10;
				}
				with (instance_create(x, y, obj_shuttleparts))
				{
					image_index = 1;
					hspeed = -10;
				}
				with (instance_create(x, y, obj_shuttleparts))
				{
					image_index = 0;
					hspeed = 10;
				}
				instance_create(x, y, obj_playerexplosion);
			}
			sprite_index = spr_idle;
			image_index = 0;
		}
		break;
	
	case states.land: // unused
		if (floor(image_index) == (image_number - 1))
		{
			sprite_index = spr_idle;
			state = states.normal;
		}
		break;
	
	case states.normal:
		if sprite_index != spr_taunt or !sprite_exists(spr_taunt)
		{
			if obj_player1.sprite_index == obj_player1.spr_taunt && sprite_exists(spr_taunt)
			{
				if /*(spr_taunt != spr_noisette_ass or irandom(100) == 1) && */!taunting
				{
					sprite_index = spr_taunt;
					image_index = random(image_number);
				
					with instance_create(x, y, obj_cloudeffect)
		            {
		                sprite_index = spr_taunteffect;
		                depth = other.depth + 1;
		            }
				}
				taunting = true;
			}
			else
			{
				taunting = false;
				if sprite_exists(spr_dull)
				{
			        if --dulltimer <= 0
			            sprite_index = spr_dull;
				}
			}
		}
		else if obj_player1.sprite_index != obj_player1.spr_taunt
		{
			sprite_index = spr_idle;
			image_index = 0;
		}
		break;
}
visible = state != states.titlescreen;
