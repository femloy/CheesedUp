move = false;
movespeed = 0;
xscale = sign(image_xscale);
steppybuffer = 12;
active = false;
depth = 1;
name = lstr("fake_player_name");

if !global.sandbox
	instance_destroy();
