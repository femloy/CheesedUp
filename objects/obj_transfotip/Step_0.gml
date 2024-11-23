if (fadeout)
	fade = Approach(fade, 0, fadeout_speed);
else
	fade = Approach(fade, 1, fadein_speed);
if (fade <= 0)
	instance_destroy();
