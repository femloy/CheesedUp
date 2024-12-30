#macro instance_destroy_base instance_destroy
#macro instance_destroy instance_destroy_hook

function instance_destroy_hook(_id = self.id, execute_event_flag = true)
{
	with _id
	{
		if object_index == obj_gmlive
			exit;
		
		stored_result = true;
		scr_modding_hook_callback("instance/destroy", function()
		{
			if live_result == false
				stored_result = false;
		}, [execute_event_flag]);
		
		if stored_result == false
			exit;
		
		if execute_event_flag
			event_perform(ev_destroy, 0);
	}
	instance_destroy_base(_id, false);
}

#macro instance_create_depth_base instance_create_depth
#macro instance_create_depth instance_create_depth_hook

function instance_create_depth_hook(x, y, depth, obj, var_struct = {})
{
	if is_instanceof(obj, ModObject)
	{
		var m = global.processing_mod ?? noone;
		if m == noone return noone;
		var_struct.__OBJECT = obj;
		var o = instance_create_depth_base(x, y, depth, obj_mod_object, var_struct);
		global.processing_mod = m;
		return o;
	}
	else
		return instance_create_depth_base(x, y, depth, obj, var_struct);
}
