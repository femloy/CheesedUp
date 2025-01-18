image_speed = 0;
content = noone;
refresh = 20;
depth = 1;

baddie_max = 5;
baddieid = [];

_object_exists = global.in_afom ? cyop_object_exists : object_exists;
_instance_create = global.in_afom ? cyop_instance_create : instance_create;
