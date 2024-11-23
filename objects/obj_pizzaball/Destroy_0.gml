event_inherited();
if !destroyable
{
	if global.leveltosave == "exit"
		add_saveroom(id, global.escaperoom);
	instance_destroy(obj_pizzaballblock);
}
else
{
	instance_destroy(obj_pizzaball_golfhit);
	with obj_golfhoop
		instance_change(obj_hoop, false);
}
