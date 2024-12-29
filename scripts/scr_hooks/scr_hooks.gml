#macro instance_destroy_base instance_destroy
#macro instance_destroy instance_destroy_hook

function instance_destroy_hook(_id = self.id, execute_event_flag = true)
{
	with _id
	{
		if object_index == obj_gmlive
			exit;
		
		if execute_event_flag
		{
			destroy_modifier_hook();
			event_perform(ev_destroy, 0);
		}
	}
	instance_destroy_base(_id, false);
}

#macro instance_create_depth_base instance_create_depth
#macro instance_create_depth instance_create_depth_hook

function instance_create_depth_hook(x, y, depth, obj, var_struct = {})
{
	if is_instanceof(obj, ModObject)
	{
		if global.processing_mod == noone
			return noone;
		var_struct.__OBJECT = obj;
		obj = obj_mod_object;
	}
	return instance_create_depth_base(x, y, depth, obj, var_struct);
}
