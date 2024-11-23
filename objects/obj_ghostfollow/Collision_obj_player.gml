with other
{
	if state == states.door or state == states.actor or state == states.comingoutdoor or state == states.secretenter
	or instance_exists(obj_taxitransition) or instance_exists(obj_spaceshuttlecutscene) or state == states.victory
	or state == states.stringfall
		exit;
}
if !locked && state != states.johnghost
{
	notification_push(notifs.johnghost_collide, [room]);
	with (other)
	{
		hitX = x;
		hitY = y;
		state = states.johnghost;
		sprite_index = spr_hurt;
		image_speed = 0.35;
	}
	sound_play("event:/sfx/pep/johnghost");
	fadein = false;
	state = states.johnghost;
	playerid = other.id;
}
