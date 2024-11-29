live_auto_call;

destroy_sounds([song]);
sound_pause_all(false);
scr_pause_activate_objects(false);
instance_activate_object(obj_globaltimer);
ds_list_destroy(instance_list);
