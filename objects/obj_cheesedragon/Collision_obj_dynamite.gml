instance_create(x, y, other.obj_explosion);
instance_destroy(other);
event_perform(ev_collision, obj_junkNEW);
