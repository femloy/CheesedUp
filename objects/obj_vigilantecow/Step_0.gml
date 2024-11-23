hsp = xscale * spd;
if (flashbuffer > 0)
	flashbuffer--;
else
	flash = false;
x += hsp;
y += vsp;
if (y >= ystart && vsp > 0)
{
	sound_play_3d("event:/sfx/vigilante/cowstomp", x, y);
	vsp = -16;
	sprite_index = bouncespr;
	image_index = 0;
	bounce -= 1;
	shake_camera(3, 3 / room_speed);
	instance_create(x - 20, 448, obj_stampedecloud);
	instance_create(x, 448, obj_stampedecloud);
	instance_create(x + 20, 448, obj_stampedecloud);
}
if (bounce <= 0)
	instance_destroy();
if (vsp < 20)
	vsp += 0.5;
if (check_solid(x + (xscale * 4), y))
	xscale *= -1;
if (sprite_index == spr)
	image_index = 0;
else if (sprite_index == bouncespr && floor(image_index) == (image_number - 1))
	sprite_index = spr;
mask_index = spr_bouncingcow_mask;
