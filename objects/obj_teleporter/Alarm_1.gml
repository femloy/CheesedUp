with (obj_teleporter)
{
	if (trigger == other.trigger && start != 1 && id != other.id)
	{
		repeat (8)
			create_particle(x + random_range(50, -50), y + random_range(50, -50), part.teleporteffect, 0);
	}
}
with (player)
{
	sound_play_3d("event:/sfx/misc/teleporterend", x, y);
	visible = true;
	state = other.storedstate;
	movespeed = other.storedmovespeed;
	grav = other.storedgrav;
	image_index = other.storedimageindex;
	sprite_index = other.storedspriteindex;
	freefallsmash = other.storedfreefallsmash;
	with (instance_create(x, y, obj_parryeffect))
		sprite_index = spr_peppinoteleporteffect;
	if (check_solid(x, y))
		y--;
	if (state == states.grab)
		state = states.normal;
	if (freefallsmash >= 12)
	{
		with (instance_place(x, y + 4, obj_metalblock))
			instance_destroy();
	}
}
player = -1;
