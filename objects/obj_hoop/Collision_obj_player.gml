var grace = global.in_cyop ? 40 : 74;
if other.y < y + grace && other.y > y - grace && other.hsp != 0
	instance_destroy();
