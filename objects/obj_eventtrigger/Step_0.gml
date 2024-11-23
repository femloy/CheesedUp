if !instance_exists(obj_player) // pause crash prevention
	exit;

// If Condition is correct then output
if condition != noone
{
	var input = condition();
	if reverse_output != noone && !input && (activated || !flags.do_once) // Reverse of the Condition
	{
		reverse_output(input);
		activated = false;
	}
    else if input && (!activated || !flags.do_once)
    {
		output(input);
		if flags.do_save && !in_saveroom(id, flags.saveroom)
			ds_list_add(flags.saveroom, id);
		
		activated = true;
    }
}

// Activated
if activated && flags.do_once
	instance_destroy();
