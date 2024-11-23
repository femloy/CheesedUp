x += hsp;
y += vsp;
sound_instance_move(snd, x, y);
if (vsp < 10)
	vsp += grav;
