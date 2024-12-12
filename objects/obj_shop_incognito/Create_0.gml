if !DEBUG
	instance_destroy();

hitbox = instance_create(x, y, obj_uparrowhitbox);
hitbox.ID = id;
