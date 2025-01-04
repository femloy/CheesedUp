up = SCREEN_HEIGHT + 20;
sprite_index = spr_itspizzatime;

var custom = scr_modding_character(obj_player1.character);
if custom != noone && !is_undefined(custom.sprites.misc[$ "spr_itspizzatime"])
	sprite_index = custom.sprites.misc.spr_itspizzatime;
