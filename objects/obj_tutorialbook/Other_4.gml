if !instance_exists(self)
	exit;
if is_undefined(text)
{
	instance_destroy();
	exit;
}

if global.panic && global.leveltosave != "tutorial"
{
	instance_destroy();
	exit;
}
event_user(0);
