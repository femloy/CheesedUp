var player = other;
if player.key_up2 && (player.state == states.normal or player.state == states.ratmount)
{
	player.key_up2 = false;
	instance_create_unique(0, 0, obj_skinchoice);
}
