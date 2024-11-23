if (global.timedgatetimer == 1)
	sprite_index = spr_button_pressed;

time = time_max;
timedgate_add_objects(obj_baddie, global.baddieroom);
timedgate_add_objects(obj_destructibles, global.saveroom);
timedgate_add_objects(obj_metalblock, global.saveroom);

if obj_player1.character == "G"
	time *= 1.5;
if check_char("V")
	time *= 1.2;
