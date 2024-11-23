fmod_set_parameter("REMIX", REMIX, true);
if MOD.Mirror
	fmod_set_listener_attributes(0, room_width - (CAMX + (CAMW / 2)), CAMY + (CAMH / 2));
else
	fmod_set_listener_attributes(0, CAMX + (CAMW / 2), CAMY + (CAMH / 2));
fmod_update();
