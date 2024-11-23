if DEBUG
	show_message("Disclaimer destroyed");
else
{
	trace("FUNNYROOM - Disclaimer gone");
	instance_create(0, 0, obj_softlockcrash);
}
