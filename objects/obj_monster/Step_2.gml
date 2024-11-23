xs = image_xscale;
if (y > (room_height + (sprite_height * 2)))
{
	instance_destroy();
	sound_play_3d("event:/sfx/pep/groundpound", x, obj_player1.y);
	shake_camera(5, 15 / room_speed);
}
