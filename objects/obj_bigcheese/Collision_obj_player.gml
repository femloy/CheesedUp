if instance_exists(obj_genericdeath)
	exit;

if (state != states.throwing && other.character != "V")
{
	pizzaball = false;
	playerid = other.id;
	shot = false;
	state = states.throwing;
	sprite_index = spr_bigcheese_throw;
	image_index = 0;
	other.state = states.actor;
	other.sprite_index = other.spr_tumble;
}
