if (falling == 1 && vsp > 0)
{
	hit = true;
	instance_create(x, y, obj_stompeffect);
	obj_player.image_index = 0;
	obj_player.state = states.stunned;
	obj_player.sprite_index = spr_player_stunned;
	vsp = -5;
	falling = false;
	shake_camera(10, 30 / room_speed);
}
