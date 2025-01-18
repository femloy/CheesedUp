if !instance_exists(self)
	exit;

if global.in_afom
{
	if self[$ "idlespr"] != undefined
		spr_sleep = idlespr;
	if self[$ "talkspr"] != undefined
		spr_talk = talkspr;
	if self[$ "silent"] != undefined && silent
		snd_voice = noone;
}

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
