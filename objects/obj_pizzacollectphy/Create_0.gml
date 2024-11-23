image_speed = 0.5;
init_collision();
vsp = random_range(-2, -4);
if check_char("S")
	sprite_index = spr_snickcollectible2;
depth = -3;
sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect);
