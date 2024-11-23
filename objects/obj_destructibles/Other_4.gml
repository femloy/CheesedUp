if (!escape && in_saveroom()) or (escape && in_saveroom(id, global.escaperoom))
	instance_destroy();
else if escape && !global.panic
	instance_deactivate_object(id);
