function shake_camera(shake, acc = (shake * 2) / room_speed)
{
	with obj_camera
	{
		shake_mag = shake;
		shake_mag_acc = acc;
	}
}
