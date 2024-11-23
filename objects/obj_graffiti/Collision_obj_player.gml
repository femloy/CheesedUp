if (!in_saveroom() && other.state == states.backbreaker)
{
	other.state = states.graffiti;
	other.sprite_index = other.spr_victory;
	other.image_index = 0;
	sprite_index = spr_graffiti_drawn;
	global.graffiticount++;
	instance_create(x, y - 80, obj_graffiticount);
	add_saveroom();
}
