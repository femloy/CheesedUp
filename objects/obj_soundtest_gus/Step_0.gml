if instance_exists(obj_cyop_loader) && !instance_exists(obj_soundtest)
	exit;

if safe_get(obj_soundtest, "play") or global.jukebox != noone
	other.sprite_index = dancespr;
else
	other.sprite_index = idlespr;
