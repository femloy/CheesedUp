image_speed = 0;
baddieid = obj_null;
refresh = 20;
depth = 1;
init_collision();
mask_index = spr_baddiespawner;
countdown = 50;

_object_exists = global.in_afom ? cyop_object_exists : object_exists;
_instance_create = global.in_afom ? cyop_instance_create : instance_create;
