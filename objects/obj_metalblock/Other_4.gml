if (!escape && in_saveroom()) or (escape && in_saveroom(id, global.escaperoom))
	instance_destroy();
if escape && !global.panic
	instance_deactivate_object(id);
