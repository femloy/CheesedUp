var player = instance_nearest(x, y, obj_player);
if !instance_exists(obj_genericdeath)
{
	if y == ystart && !player.boxxed && player.state != states.boxxedpep && player.state != states.boxxedpepspin && player.state != states.boxxedpepjump
	&& (player.x > x - 50 && player.x < x + 50) && (player.y > y && player.y < y + 200)
	{
		vsp = 10;
		sprite_index = spr_boxcrusher_fall;
	}
}

if (sprite_index == spr_boxcrusher_fall && grounded)
{
	GamepadSetVibration(0, 1, 1, 0.65);
	sound_play_3d("event:/sfx/pep/groundpound", x, y);
	shake_camera(10, 30 / room_speed);
	vsp = 0;
	image_index = 0;
	sprite_index = spr_boxcrusher_land;
}
if (sprite_index == spr_boxcrusher_land && floor(image_index) == (image_number - 1))
{
	sprite_index = spr_boxcrusher_idle;
	gobackup = true;
}
if (gobackup == 1)
	y = Approach(y, ystart, 2);
if (y == ystart)
	gobackup = false;
scr_collide();
