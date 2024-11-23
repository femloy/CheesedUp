for(var i = 0; i < array_length(step_order); i++)
{
	with step_order[i]
		event_perform(ev_step, ev_step_normal);
}
