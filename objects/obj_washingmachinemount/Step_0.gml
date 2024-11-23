if (obj_player.state != states.hookshot)
{
	if (!visible)
		instance_create(x, y, obj_genericpoofeffect);
	visible = true;
}