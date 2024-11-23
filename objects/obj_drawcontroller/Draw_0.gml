draw_set_color(c_white);
if (use_dark)
{
	for (var i = 0; i < array_length(objdark_arr); i++)
	{
		with (objdark_arr[i])
		{
			if (visible && sprite_exists(sprite_index))
			{
				var yy = y;
				if object_is_ancestor(object_index, obj_followcharacter)
					yy += yoffset;
				
				var b = get_dark(image_blend, other.use_dark);
				if SUGARY
				{
					draw_set_flash(b);
					draw_sprite_ext(sprite_index, image_index, x, yy, image_xscale, image_yscale, image_angle, b, image_alpha);
					draw_reset_flash();
				}
				else
				{
					if (object_index != obj_swapmodegrab && other.objdark_arr[i] != obj_swapplayergrabbable && object_index != obj_swapmodefollow && object_index != obj_swapdeatheffect)
					{
						var ix = image_xscale;
						if (object_index == obj_vigilantecow)
							ix = xscale;
						if variable_instance_exists(id, "spr_palette") && sprite_exists(spr_palette)
						{
							shader_set(global.Pal_Shader);
							pal_swap_set(spr_palette, paletteselect);
						}
						draw_sprite_ext(sprite_index, image_index, x, yy, ix, image_yscale, image_angle, b, image_alpha);
						pal_swap_reset();
					}
					else
					{
						var blend = image_blend;
						image_blend = b;
						event_perform(ev_draw, 0);
						image_blend = blend;
					}
				}
			}
		}
	}
}
if (obj_player1.finisher || obj_player2.finisher || (obj_player.state == states.playersuperattack && obj_player.superattackstate == states.transition))
	finisher_alpha = Approach(finisher_alpha, 0.3, 0.1);
else if (finisher_alpha > 0)
	finisher_alpha = Approach(finisher_alpha, 0, 0.02);
if (finisher_alpha > 0)
{
	draw_set_alpha(finisher_alpha);
	draw_rectangle_color(-32, -32, room_width + 32, room_height + 32, 0, 0, 0, 0, false);
	draw_set_alpha(1);
}

with (obj_baddie)
{
	if (object_index != obj_pizzafaceboss)
		draw_enemy(global.kungfu, true);
}

with obj_heatafterimage
{
	if !visible
		break;
	with obj_player1
	{
		if character == "N" && state == states.trashjumpprep
			break;
			
		pal_swap_player_palette(sprite_index, image_index, xscale, yscale);
		draw_sprite_ext(sprite_index, image_index, other.x, other.y, xscale, yscale, angle, c_white, other.alpha);
		pal_swap_reset();
	}
}
if (room == boss_fakepep)
{
    with (obj_fakepepclone)
    {
        if (visible && !flash)
        {
            pal_swap_player_palette(,,,,,true);
            draw_self();
			pattern_reset();
			cuspal_reset();
            pal_swap_set(spr_peppalette, 13, 0);
            draw_self();
        }
    }
}
pal_swap_reset();

draw_set_flash();
with (obj_baddie)
{
	var _stun = 0;
	if (state == states.stun && object_index != obj_pizzaball)
		_stun = 25;
	if (visible && flash && bbox_in_camera(view_camera[0], 32))
		draw_sprite_ext(sprite_index, image_index, x, y + _stun, xscale * image_xscale, yscale, angle, image_blend, image_alpha);
	
}
if (room == boss_fakepep)
{
    with (obj_fakepepclone)
    {
        if (visible && flash)
            draw_self();
    }
}
with (obj_deadjohnparent)
{
	if (visible && flash && bbox_in_camera(view_camera[0], 32))
		draw_sprite_ext(sprite_index, image_index, x + hurtx, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
with (obj_smallnumber)
{
	if visible && flash && !global.timeattack && (global.option_hud or !REMIX)
	{
		draw_set_font(global.smallnumber_fnt);
		draw_set_halign(fa_center);
		draw_text(x, y, number);
	}
}
for (i = 0; i < array_length(flash_arr); i++)
{
	with (flash_arr[i])
	{
		if (visible && flash)
			event_perform(ev_draw, 0);
	}
}
draw_reset_flash();

shader_set(global.Pal_Shader);
pal_swap_set(spr_peppalette, 0, false);
with (obj_pizzagoblinbomb)
{
	if (grabbable && grounded && vsp > 0)
		draw_sprite(spr_grabicon, image_index, x - 10, y - 30);
	draw_self();
}

with (obj_player1)
{
	if (!other.hungrypillarflash && visible && state != states.titlescreen && bbox_in_camera(view_camera[0], 32))
		draw_player();
}
pal_swap_reset();

pattern_set_solid(true);
with obj_noiseeffect
{
	pal_swap_player_palette();
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	pal_swap_reset();
}
with obj_noisedebris
{
	pal_swap_player_palette();
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	pal_swap_reset();
}
pattern_set_solid(false);

// very simple particles
for (i = 0; i < array_length(particles); i++)
{
	with (particles[i])
		draw_sprite(sprite_index, image_index, x, y);
}

// dead enemies
with obj_sausageman_dead
{
	if !gui && visible
	{
		var b = get_dark(image_blend, other.use_dark);
		if room == boss_vigilante
			b = c_white;
		
		if other.use_dark && SUGARY
		{
			draw_set_flash(b);
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, b, image_alpha);
			draw_reset_flash();
		}
		else
		{
			if sprite_exists(spr_palette)
			{
				shader_set(global.Pal_Shader);
				if oldpalettetexture != noone
					pattern_set(pattern_color != noone ? pattern_color : global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, oldpalettetexture);
				pal_swap_set(spr_palette, paletteselect, false);
			}
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, b, image_alpha);
			if oldpalettetexture != noone
	            pattern_reset();
			pal_swap_reset();
		}
	}
}

// flashing
draw_set_flash();
with obj_player1
{
	if visible && flash && bbox_in_camera(view_camera[0], 32)
		draw_sprite_ext(player_sprite(), image_index, x + smoothx, y, xscale * col_scale, yscale * col_scale, angle, image_blend, image_alpha);
}
draw_reset_flash();

// pto entrance lamp overlays
with obj_lampost
{
	if sprite_index == spr_lampostpanic_NEW
		draw_sprite_ext(sprite_index, image_index + 2, x, y, image_xscale, image_yscale, 0, c_white, 1);
}

if BO_NOISE
{
	// midway boxofpizza
	with obj_boxofpizza
	{
		if bo
		{
			draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			with obj_secrettile
				desireddepth = -8;
		}
	}
}
