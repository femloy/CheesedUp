function scr_player_gameover()
{
	image_speed = 0.35;
	cutscene = true;
	scale_xs = 1;
	scale_ys = 1;
	visible = true;
	if (sprite_index == spr_deathstart)
	{
		vsp = 0;
		hsp = 0;
	}
	flash = false;
	alarm[0] = -1;
	alarm[1] = -1;
	alarm[3] = -1;
	alarm[4] = -1;
	alarm[5] = -1;
	alarm[6] = -1;
	alarm[7] = -1;
	alarm[8] = -1;
	alarm[9] = -1;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_deathstart)
	{
		alarm[10] = 5;
		vsp = -10;
		sprite_index = spr_deathend;
	}
	hurted = false;
	inv_frames = false;
	x += hsp;
	y += floor(vsp);
	if (vsp < 30)
		vsp += grav;
}
