#macro instance_destroy_base instance_destroy
#macro instance_destroy instance_destroy_hook

function instance_destroy_hook(_id = self.id, execute_event_flag = true)
{
	with _id
	{
		destroy_modifier_hook();
		if execute_event_flag
			event_perform(ev_destroy, 0);
	}
	instance_destroy_base(_id, false);
}
