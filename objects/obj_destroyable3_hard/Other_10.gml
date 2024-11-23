/// @description hit
shake = 5;
sprite_index = spr_destroyable3_ss;

scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
create_debris(x + sprite_width / 2, y + sprite_height / 2, spr_destroyable3_bandage);
repeat 4
	create_debris(x + sprite_width / 2, y + sprite_height / 2, spr_debris_ss);
