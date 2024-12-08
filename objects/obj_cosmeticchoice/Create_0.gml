live_auto_call;
event_inherited();

image_speed = 0.35;

// init
sel = {
	side: 0,
	hat: 0,
	pet: 0
};
hats = [];
pets = [];

select = function()
{
	anim_con = 2;
	
	with obj_player
	{
		var hatprev = hat, petprev = pet;
		hat = other.hats[other.sel.hat].hat;
		pet = other.pets[other.sel.pet].pet;
		
		if hatprev != hat or petprev != pet
		{
			ini_open_from_string(obj_savesystem.ini_str);
			ini_write_string("Game", "hat", hat);
			ini_write_real("Game", "pet", pet);
			obj_savesystem.ini_str = ini_close();
			gamesave_async_save();
		}
		sound_play("event:/sfx/misc/collecttoppin");
	}
}
draw = function(curve)
{
	var hat = hats[sel.hat];
	var pet = pets[sel.pet];
	
	// hat
	var sprite;
	switch sel.side
	{
		case 0: sprite = hat.sprite; break;
		case 1: sprite = pet.sprite; break;
	}
	
	var col = c_white;
	if sprite == spr_nocosmetic
	{
		col = c_black;
		if sel.side == 0
			sprite = spr_cowboyhat;
		else
			sprite = spr_toppinshroom;
	}
	
	var shd = shader_current();
	var yoffset = 50 + (sprite_get_yoffset(sprite) - lerp(sprite_get_bbox_bottom(sprite), sprite_get_bbox_top(sprite), 0.5) * 2);
	if sel.side != 0 && sprite == spr_playerN_cheesedidle
		pal_swap_set(spr_noisepalette, 1);
	lang_draw_sprite_ext(sprite, image_index, lerp(0, SCREEN_WIDTH, 0.5) + charshift[0], SCREEN_HEIGHT / 2 + charshift[1] + floor(yoffset), 2, 2, 0, col, charshift[2]);
	pal_swap_reset();
	
	shader_set(shd);
	gpu_set_blendmode(bm_normal);
	
	// text
	tdp_draw_set_font(lang_get_font("bigfont"));
	tdp_draw_set_align(fa_left);
	var info = font_get_offset();
	
	var str = string_upper(sel.side == 0 ? hat.name : pet.name), xx = lerp(0, SCREEN_WIDTH, 0.5) - string_width(str) / 2;
	for(var i = 1; i <= string_length(str); i++)
	{
		// hat
		var char = string_char_at(str, i);
		var yy = screen_center_y(380);
		
		var d = (i % 2 == 0) ? -1 : 1;
		var _dir = floor(Wave(-1, 1, 0.1, 0));
		yy += _dir * d;
		
		tdp_draw_text(round(xx) - info.x, yy - info.y, char);
		xx += string_width(char);
	}
	
	tdp_draw_set_font(lang_get_font("font_small"));
	tdp_draw_set_align(fa_center);
	tdp_draw_text_ext(lerp(0, SCREEN_WIDTH, 0.5), screen_center_y(420), sel.side == 0 ? hat.desc : pet.desc, 16, 600);
	
	/*
	switch sel.side
	{
		case 0: handx = lerp(handx, lerp(0, SCREEN_WIDTH, 0.3) - 70, 0.25); break;
		case 1: handx = lerp(handx, lerp(0, SCREEN_WIDTH, 0.7) - 70, 0.25); break;
	}
	draw_sprite_ext(spr_skinchoicehand, 0, handx, 200, 2, 2, 0, c_white, 1);
	*/
	
	// arrows
	var arrow_sel = sel.side == 0 ? sel.hat : sel.pet;
	var arrow_max = sel.side == 0 ? array_length(hats) : array_length(pets);
	
	if arrow_sel > 0
	{
		var xx = SCREEN_WIDTH / 2 - 120 - sin(current_time / 200) * 4, yy = SCREEN_HEIGHT / 2 + 16;
		if charshift[0] < 0
			xx += charshift[0];
		
		draw_sprite_ext(spr_palettearrow, 0, xx, yy, 1, 1, 90, c_white, 1);
	}
	if arrow_sel < arrow_max - 1
	{
		var xx = SCREEN_WIDTH / 2 + 120 + sin(current_time / 200) * 4, yy = SCREEN_HEIGHT / 2 + 16;
		if charshift[0] > 0
			xx += charshift[0];
		
		draw_sprite_ext(spr_palettearrow, 0, xx, yy, 1, 1, 270, c_white, 1);
	}
	
	tdp_text_commit();
}
charshift = [0, 0, 1, 1];
handx = 0;

add_hat = function(hat, local, unlockable = true)
{
	var s = 
	{
		hat: hat,
		sprite: scr_hat_sprites(hat),
		name: lstr($"hat_{local}title"),
		desc: lstr($"hat_{local}"),
		unlockable: unlockable
	};
	array_push(hats, s);
	return s;
}
add_pet = function(pet, local, unlockable = true)
{
	var s =
	{
		pet: pet,
		sprite: scr_pet_sprites(pet).spr_idle,
		name: lstr($"pet_{local}title"),
		desc: lstr($"pet_{local}"),
		unlockable: unlockable
	};
	array_push(pets, s);
	return s;
}

// hats
add_hat(-1, "none", false);
add_hat(HAT.cowboy, "cowboy", false);
add_hat(HAT.dunce, "dunce");
add_hat(HAT.crown, "golden");
add_hat(HAT.uwunya, "uwunya");
add_hat(HAT.dougdimmadome, "dougdimmadome");
add_hat(HAT.boobs, "boobs");
add_hat(HAT.dunit, "dunit");

// pets
add_pet(-1, "none", false);
add_pet(PET.noiserat, "noiserat");
add_pet(PET.berry, "berry");
add_pet(PET.vivian, "vivian");
add_pet(PET.gooch, "gooch");

// auto select
for(var i = 0; i < array_length(hats); i++)
{
	if obj_player1.hat == hats[i].hat
		sel.hat = i;
}
for(var i = 0; i < array_length(pets); i++)
{
	if obj_player1.pet == pets[i].pet
		sel.pet = i;
}
shown_tip = false;
