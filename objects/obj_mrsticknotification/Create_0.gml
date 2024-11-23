x = 32;
start = false;
finish = false;
height = sprite_get_height(sprite_index);
alarm[0] = 150;
image_speed = 0.35;
sound_play("event:/sfx/misc/kashing");
if (obj_player1.character == "N" || global.swapmode)
	sprite_index = spr_noisettenotification;
y = -height - 50;
