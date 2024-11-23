mask_index = spr_pepperman_statues1;
if (hitLag <= 0)
	scr_collide();
else
{
	x = hitX + irandom_range(-4, 4);
	y = hitY + irandom_range(-4, 4);
	hitLag--;
	if (hitLag <= 0)
	{
		x = hitX;
		y = hitY;
	}
}
if (!fall && grounded && vsp > 0)
{
	sound_play_3d("event:/sfx/pep/groundpound", x, y);
	fall = true;
	if (instance_exists(obj_player1) && obj_player1.character != "N" && !global.swapmode)
	{
		grabID = instance_create(x + (32 * image_xscale), y, obj_grabmarker);
		with (grabID)
			ID = other.id;
	}
	shake_camera(3, 5 / room_speed);
}
if (contemplated)
{
	with (obj_pepperman)
	{
		if (thrown || state == states.phase1hurt)
			instance_destroy(other);
		else if (state != states.contemplate && state != states.hit && state != states.stun)
		{
			other.contemplated = false;
			marbleblockID = noone;
		}
	}
}
image_index = round(maxhp - hp);
if floor(image_index) == image_number - 1
	instance_destroy(grabID);
