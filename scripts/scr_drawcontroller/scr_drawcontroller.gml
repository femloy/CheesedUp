function get_dark(blend, use_dark, use_position = false, posX = 0, posY = 0)
{
	if (use_dark)
	{
		if room == boss_vigilante
			blend = make_color_rgb(247, 109, 22);
		if SUGARY_SPIRE && SUGARY
			return #264d72;
		
		var dis, d = room_width * room_height, b = d, bb = b;
		with (obj_lightsource)
		{
			if (object_index != obj_lightsource_attach || instance_exists(objectID))
			{
				if !use_position
					dis = distance_to_object(other);
				else
					dis = distance_between_points(x, y, posX, posY);
				
				if (dis < d)
				{
					bb = dis / distance;
					if (bb < b)
					{
						b = bb;
						d = dis;
					}
				}
			}
		}
		
		var t = clamp((b + 0.4) * 255, 0, 255);
		var a = clamp(((1 - obj_drawcontroller.dark_alpha) * 255) - 102, 0, 255);
		
		var r = max((color_get_red(blend) - t) + a, 0);
		var g = max((color_get_green(blend) - t) + a, 0);
		var b = max((color_get_blue(blend) - t) + a, 0);
		
		return make_color_rgb(r, g, b);
	}
	else
		return image_blend;
}
function enemy_is_superslam(baddieid)
{
	with baddieid
	{
		if state == states.grabbed
		{
			var g = grabbedby == 1 ? obj_player1.id : obj_player2.id;
			if g.state == states.superslam || (g.state == states.chainsaw && g.tauntstoredstate == states.superslam)
				return true;
		}
	}
	return false;
}
function enemy_is_swingding(baddieid)
{
	with baddieid
	{
		if state == states.grabbed
		{
			var g = grabbedby == 1 ? obj_player1.id : obj_player2.id;
			if (g.state == states.grab || (g.state == states.chainsaw && g.tauntstoredstate == states.grab)) && g.sprite_index == g.spr_swingding
				return true;
		}
	}
	return false;
}
function draw_enemy(healthbar, palette, color = c_white)
{
	if object_index == obj_swapplayergrabbable
	{
		shader_set(global.Pal_Shader);
		var b = get_dark(image_blend, obj_drawcontroller.use_dark);
		pal_swap_set(spr_palette, paletteselect, false);
		pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, patterntexture);
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, b, image_alpha);
		pattern_reset();
		shader_reset();
		exit;
	}
	
	var _stun = 0;
	if ((state == states.stun && thrown == 0 && object_index != obj_peppinoclone) || state == states.pizzaheadjump || (state == states.supergrab && sprite_index == stunfallspr))
		_stun = 25;
	if (state == states.pizzaheadjump && object_index == obj_gustavograbbable) or object_index == obj_junkNEW
		_stun = 0;
	
	if (visible && object_index != obj_pizzaball && object_index != obj_fakesanta && bbox_in_camera(view_camera[0], 32))
	{
		var c = image_blend;
		if elite
			c = c_yellow;
		if elitegrab
			c = c_green;
		if color != c_white
			c = color;
		
		var _ys = 1;
		if (state == states.grabbed)
		{
			if (enemy_is_superslam(id))
			{
				_stun += 18;
				_ys = -1;
			}
		}
		
		var b = get_dark(c, obj_drawcontroller.use_dark);
		var xx = x, yy = y;
		
		// aggro sugary enemy by taunting
		if SUGARY_SPIRE
		{
			if self[$ "sugary"]
			{
				var player = instance_nearest(x, y, obj_player);
				if player.state == states.backbreaker && point_in_rectangle(x, y, player.x - 480, player.y - 270, player.x + 480, player.y + 270)
				{
					xx += irandom_range(-1, 1);
					yy += irandom_range(-1, 1);
				
					draw_sprite_ext(spr_angrycloud, (++aggrimg) * 0.35, xx, yy + _stun, 1, 1, 0, b, image_alpha);
				}
			}
		}
		
		var spr = sprite_index;
		if object_index == obj_swedishmonkey
			spr = spr_googlyjuice_walk;
		if object_index == obj_pepgoblin
			spr = spr_crackerkicker_walk;
		
		if obj_drawcontroller.use_dark && SUGARY
		{
			draw_set_flash(b);
			draw_sprite_ext(spr, image_index, xx, yy + _stun, xscale * image_xscale, yscale * _ys, angle, b, image_alpha);
			draw_reset_flash();
		}
		else
		{
			pattern_reset();
			if (object_index == obj_peppinoclone)
				pal_swap_set(spr_peppalette, 1, false);
			else if (usepalette && palette)
			{
				if (object_index == obj_fakepepboss || object_index == obj_gustavograbbable)
					pal_swap_player_palette(spr, image_index, image_xscale * xscale, image_yscale * yscale, , true);
				else
					pal_swap_set(spr_palette, paletteselect, false);
			}
			draw_sprite_ext(spr, image_index, xx, yy + _stun, xscale * image_xscale, yscale * _ys, angle, b, image_alpha);
			cuspal_reset();
		}
		
		if (healthbar)
		{
			if (hp > maxhp)
				maxhp = hp;
			draw_healthbar(x - 16, y - 50, x + 16, y - 45, (hp / maxhp) * 100, 0, 255, 255, 0, true, true);
		}
		
		if (object_index == obj_fakepepboss)
		{
			if (miniflash)
			{
				pal_swap_set(spr_peppalette, 14, false);
				draw_sprite_ext(spr, image_index, x, y + _stun, xscale * image_xscale, yscale * _ys, angle, b, image_alpha);
			}
		}
		if object_index == obj_peppinoclone
		{
			pattern_reset();
			if elite or global.stylethreshold >= 3
			{
				pal_swap_set(spr_peppalette, 2, false);
				draw_sprite_ext(spr, image_index, xx, yy + _stun, xscale * image_xscale, yscale * _ys, angle, b, image_alpha);
			}
			pal_swap_reset();
		}
		else if usepalette && palette
		{
			pattern_reset();
			pal_swap_reset();
		}
		if (object_index == obj_hamkuff)
		{
			if (state == states.blockstance && instance_exists(playerid))
			{
				var x1 = x + (6 * image_xscale);
				var y1 = y + 29;
				if (spr == spr_hamkuff_chain2)
				{
					x1 = x + (15 * image_xscale);
					y1 = y + 33;
				}
				var dis = point_distance(x1, y1, playerid.x, playerid.y);
				var w = 24;
				var len = dis div w;
				var dir = point_direction(x1, y1, playerid.x, playerid.y + 16);
				var xx = lengthdir_x(w, dir);
				var yy = lengthdir_y(w, dir);
				for (var i = 0; i < len; i++)
					draw_sprite_ext(spr_hamkuff_sausage, image_index, x1 + (xx * i), y1 + (yy * i), 1, 1, dir, b, 1);
			}
		}
	}
}
function draw_superslam_enemy()
{
	if (state == states.superslam && floor(image_index) >= 5 && floor(image_index) <= 7 && instance_exists(baddiegrabbedID))
	{
		with (baddiegrabbedID)
			draw_enemy(global.kungfu, true);
	}
}
function draw_player()
{
	if live_call() return live_result;
	
	if MOD.Golf
	{
		if scr_golfball_draw()
			exit;
	}
	
	if instance_exists(obj_swapgusfightball)
	{
		var _use_dark = other.use_dark;
		with obj_swapgusfightball
		{
			var b = get_dark(image_blend, _use_dark);
			var _info = [
				[sprite_index, get_pep_palette_info()],
				[spr_playerN_fightballratmount, get_noise_palette_info()]
			];
			for (var i = 0; i < array_length(_info); i++)
			{
				var sprite = _info[i][0];
				var pal = _info[i][1];
				pattern_set(global.Base_Pattern_Color, sprite, image_index, image_xscale, image_yscale, pal.patterntexture);
				pal_swap_set(pal.spr_palette, pal.paletteselect, false);
				draw_sprite_ext(sprite, image_index, x, y, image_xscale, image_yscale, image_angle, b, image_alpha);
			}
			pattern_reset();
		}
		exit;
	}
	if character == "N" && state == states.trashjumpprep
		exit;
	
	var xx = x + smoothx, yy = y;
	if (state == states.removed_state or state == states.frozen) && shaketime > 0
		xx += random_range(shaketime / 6, -shaketime / 6);
	
	var _sprite_index = player_sprite();
	var _image_index = image_index;
	if pistolanim != -4 && _sprite_index == sprite_index
	{
		_sprite_index = pistolanim;
		_image_index = pistolindex;
	}
	
	var xs = xscale * scale_xs * col_scale;
	var ys = yscale * scale_ys * col_scale;
	
	if check_skin(SKIN.cosmic)
		draw_cosmic_clone(_sprite_index, _image_index, xx, yy, xs, ys, angle, c_white, image_alpha);
	else
	{
		var b = get_dark(image_blend, obj_drawcontroller.use_dark);
		if SUGARY_SPIRE && obj_drawcontroller.use_dark && SUGARY
			draw_set_flash(b);
		else
		{
			var pattern = global.palettetexture;
			var ps = paletteselect;
			var spr = spr_palette;
		
			if character != "N" && room == boss_noise && (sprite_index == spr_playerN_doiseintro1 || sprite_index == spr_playerN_doiseintro2 || sprite_index == spr_playerN_doiseintro3)
			{
				var info = get_noise_palette_info();
				pattern = info.patterntexture;
				ps = info.paletteselect;
				spr = info.spr_palette;
			}
			pattern_set(global.Base_Pattern_Color, _sprite_index, _image_index, xs, ys, pattern);
		
			if isgustavo && spr != spr_peppalette
			{
				var info = get_pep_palette_info();
				spr = info.spr_palette;
				ps = info.paletteselect;
				pattern = info.patterntexture;
			}
		
			pal_swap_supernoise();
			pal_swap_set(spr, ps % sprite_get_width(spr), false);
		}
		draw_sprite_ext(_sprite_index, _image_index, xx, yy, xs, ys, angle, b, image_alpha);
	
		if global.noisejetpack && (character != "N" || noisepizzapepper)
		{
			pal_swap_set(spr_palette, 2, false);
			draw_sprite_ext(_sprite_index, _image_index, xx, yy, xs, ys, angle, b, image_alpha);
		}
	}
	draw_superslam_enemy();
	
	if global.pistol
	{
		pal_swap_set(spr_peppalette, 0, false);
		if pistolcharge >= 4
			draw_sprite(spr_revolvercharge, pistolcharge, xx, yy - 70);
	}
	
	pal_swap_reset();
	draw_reset_flash();
}
