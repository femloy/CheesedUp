if (drop == 0)
{
	instance_create(x, y, obj_stompeffect);
	other.image_index = 0;
	other.state = states.stunned;
	other.sprite_index = other.spr_stunned;
	vsp = -5;
	hsp = 3;
	shake_camera(10, 30 / room_speed);
	drop = true;
}
