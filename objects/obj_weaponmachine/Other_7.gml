live_auto_call;

if sprite_index == spr_weaponmachine_custom_press
{
	sprite_index = spr_weaponmachine_custom;
	image_speed = 0;
	image_index = 3;
}
else
	instance_destroy();
