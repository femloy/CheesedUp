global.switchbuffer = 0;
image_speed = 0.35;
image_xscale = 1;
escape = false; // TODO? escape = true in noise update
depth = -5;

sprite_index = spr_gustavoswitch1;
switchstart = spr_gustavoswitch1;
switchend = spr_gustavoswitch2;
spr_sign = spr_pepsign;

if obj_player1.character == "N"
{
	sprite_index = spr_noiseswitch1;
	switchstart = spr_noiseswitch1;
	switchend = spr_noiseswitch2;
	spr_sign = spr_noisesign;
}
collisioned = false;
