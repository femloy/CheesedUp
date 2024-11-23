live_auto_call;

if !global.option_screenshake
	screen_shake = 0;

// titlecard
draw_set_alpha(1);
if start
{
	var xscale = SCREEN_WIDTH / 960, yscale = SCREEN_HEIGHT / 540;
	var title_offset = 32 * xscale;
	
	draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);
	if !instance_exists(obj_cyop_loader)
	{
		if REMIX && obj_player1.spr_palette == spr_peppalette
			pal_swap_player_palette(titlecard_sprite, titlecard_index, 1, 1);
		else
		{
			shader_set(global.Pal_Shader);
			pal_swap_set(spr_peppalette, 1);
		}
	}
	else
	{
		draw_sprite(spr_cyop_fuckingidiot, 0, SCREEN_WIDTH - 10, SCREEN_HEIGHT - 10);
		//title_offset = 0; // ???
	}
	
	var shake_x = random_range(-screen_shake, screen_shake);
	var shake_y = random_range(-screen_shake, screen_shake);
	
	draw_sprite_ext(titlecard_sprite, titlecard_index, shake_x, shake_y, xscale, yscale, 0, c_white, 1);
	pal_swap_reset();
	lang_draw_sprite_ext(title_sprite, title_index, title_offset + irandom_range(-1, 1) + shake_x, irandom_range(-1, 1) + shake_y, xscale, yscale, 0, c_white, 1);
	
	for (var i = 0; i < array_length(noisehead); i++)
	{
		var head = noisehead[i];
		if !head.visible
			continue;
		
		if head.visual_scale > 1
		{
			head.visual_scale = Approach(head.visual_scale, 1, 0.25);
			if head.visual_scale == 1 && obj_player1.character == "V"
				screen_shake = 4;
		}
		draw_sprite_ext(noisehead_sprite, head.image_index, (head.x * xscale) + shake_x, (head.y * yscale) + shake_y, head.scale * head.visual_scale * xscale, head.scale * head.visual_scale * yscale, 0, c_white, 1);
	}
	if !vigigolf
		screen_shake = Approach(screen_shake, 0, 0.5);
}

// modifiers
if alarm[0] <= 130 && start
{
	if array_length(modifiers) == 1
		modif_t = 1;
	else
		modif_t = floor(lerp(0, array_length(modifiers), clamp(1 - ((alarm[0] - 60) / (130 - 60)), 0, 1)));
}

if modif_con < modif_t
{
	modif_con = modif_t;
	sound_play_centered(sfx_killingblow);
	modif_shake = 3;
	
	if modif_t >= array_length(modifiers) && array_length(modifiers) > 5
		sound_play_centered("event:/modded/sfx/enemyscream");
}

#region ALIGN

// 0 TOP RIGHT
// 1 BOTTOM RIGHT
// 2 BOTTOM LEFT
// 3 TOP LEFT

var align = 2;
if titlecard_sprite == spr_titlecards switch titlecard_index
{
	case 0: align = 2; break; // JOHN GUTTER
	case 1: align = 2; break; // MEDIEVAL
	case 2: align = 1; break; // RUIN
	case 3: align = 1; break; // DUNGEON
	
	case 4: align = 2; break; // DESERT
	case 5: align = 2; break; // GRAVEYARD
	case 6: align = 1; break; // FARM
	case 7: align = 1; break; // SALOON
	
	case 8: align = 1; break; // PLAGE
	case 9: align = 2; break; // FOREST
	case 10: align = 1; break; // SPACE
	case 11: align = 2; break; // GOLF
	
	case 12: align = 0; break; // STREET
	case 13: align = 1; break; // SEWER
	
	case 14: align = 2; break; // WAR
	case 15: align = 2; break; // CTOP
	
	case 16: align = 2; break; // FACTORY
	case 17: align = 3; break; // FREEZER
	
	case 18: align = 1; break; // CHATEAU
	case 19: align = 1; break; // KIDSPARTY
}

if titlecard_sprite == spr_titlecardsecret
	align = 2;

if titlecard_sprite == spr_titlecards_new switch titlecard_index
{
	case 0: align = 2; break; // DRAGONLAIR
	case 1: align = 3; break; // STRONGCOLD
	case 2: align = 2; break; // PINBALL
	case 3: align = 1; break; // MANSION
	case 4: align = 3; break; // MIDWAY
	case 5: align = 0; break; // GRINCH
	case 6: align = 2; break; // SKY
	case 7: align = 2; break; // BOILER
	case 8: align = 3; break; // SNICKCHALLENGE
	case 9: align = 2; break; // TOP
	case 10: align = 2; break; // ETB
}

#endregion

var xx = 16, yy = 16;
for(var i = 0; i < modif_con; i++)
{
	var xdraw = xx, ydraw = yy;
	if i == modif_con - 1
	{
		xdraw += random_range(-modif_shake, modif_shake);
		ydraw += random_range(-modif_shake, modif_shake);
	}
	if align == 0 or align == 1
		xdraw = SCREEN_WIDTH - 32 - xdraw;
	if align == 1 or align == 2
		ydraw = SCREEN_HEIGHT - 32 - ydraw;
	
	draw_sprite(spr_modifier_icons, modifiers[i], xdraw, ydraw);
	
	xx += 38;
	if i % 5 == 4
	{
		xx = 16;
		yy += 38;
	}
}
modif_shake = Approach(modif_shake, 0, 0.2);

if start && vigigolf
{
	switch vigigolf_con
	{
		case 1:
			with dynamite
			{
				a = Approach(a, 1, 0.5);
				img += 0.35;
				
				var max_time = 40;
				
				var acrv = animcurve_get_channel(curve_jump, 0);
				var curve = animcurve_channel_evaluate(acrv, other.vigigolf_t / max_time);
				
				var scale = lerp(5, .25, other.vigigolf_t / max_time);
				var col = merge_color(c_black, c_white, clamp(other.vigigolf_t / (max_time / 1.5) - .5, 0, 1));
				var yoff = curve * 300 - 150;
				draw_sprite_ext(spr_titlecard_dynamite, img, SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + yoff, scale, scale, 0, col, a);
			}
			break;
	}
	if vigigolf_con >= 2
	{
		var shake_x = random_range(-screen_shake, screen_shake);
		var shake_y = random_range(-screen_shake, screen_shake);
		screen_shake = Approach(screen_shake, 0, 0.3);
		
		if vigigolf_t > 4
		{
			draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);
			draw_sprite_ext(spr_titlecardgolfV, 0, shake_x, shake_y, xscale, yscale, 0, c_white, 1);
			lang_draw_sprite_ext(spr_titlecardgolfV_title, 0, title_offset + irandom_range(-1, 1) + shake_x, irandom_range(-1, 1) + shake_y, xscale, yscale, 0, c_white, 1);
		}
		else
		{
			var c = vigigolf_t >= 1 ? c_black : c_white;
			draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, c, c, c, c, false);
		}
	}
	
	for(var i = 0; i < array_length(particles); i++)
	{
		with particles[i]
		{
			if type == 0 && other.vigigolf_t > 4
			{
				draw_sprite_ext(spr_titlecardgolfdebris, img, (x + shake_x) * xscale, (y + shake_y + 25) * yscale, xscale, yscale, 0, c_black, 0.5);
				draw_sprite_ext(spr_titlecardgolfdebris, img, (x + shake_x) * xscale, (y + shake_y) * yscale, xscale, yscale, 0, c_white, 1);
				if img == 4
					lang_draw_sprite_ext(spr_titlecards_title2, 1, title_offset + irandom_range(-1, 1) + (x + shake_x) * xscale, irandom_range(-1, 1) + (y + shake_y) * yscale, xscale, yscale, 0, c_white, 1);
				
				x += hsp;
				y += vsp;
				
				vsp += 0.5;
			}
			if type == 1
			{
				draw_sprite_ext(spr_bombexplosion, img, (x + shake_x) * xscale, (y + shake_y) * yscale, xscale, yscale, 0, c_white, 1);
				
				img += 0.35;
				if img >= sprite_get_number(spr_bombexplosion)
				{
					array_delete(other.particles, i, 1);
					i--;
				}
			}
		}
	}
}

// fade
if !instance_exists(obj_fadeout)
	draw_set_alpha(fadealpha);
else
	draw_set_alpha(obj_fadeout.fadealpha);
draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);
draw_set_alpha(1);
