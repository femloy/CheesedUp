y += vsp;
if (vsp < 20)
	vsp += grav;
if (vsp > 0 && y > (room_height + 200))
	instance_destroy();
sound_instance_move(snd, x, y);
