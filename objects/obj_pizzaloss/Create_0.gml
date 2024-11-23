spr_palette = noone;
paletteselect = 0;
scr_collectspr();
grav = 0.5;
hsp = random_range(-10, 10);
vsp = random_range(-5, 0);
if (obj_player.character == "S")
	sprite_index = spr_snickcollectible1;
