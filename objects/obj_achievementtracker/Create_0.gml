if instance_number(object_index) > 1
{
	instance_destroy();
	exit;
}

achievements_update = [];
achievements_notify = [];
notify_queue = ds_queue_create();
unlock_queue = ds_queue_create();
character = "P";
scr_achievements();
