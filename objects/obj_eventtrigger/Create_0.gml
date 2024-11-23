inst_num = instance_number(obj_eventtrigger);
condition = noone;
output = noone;
reverse_output = noone;

// Condition
default_condition = function() 
{
	return place_meeting(x, y, obj_player);			
}

// Output
default_output = function() 
{		
	show_debug_message($"Event Trigger: {id} - Has missing Output")
}

// Config
flags = 
{
	do_once : true, // Destroy after triggering
	do_save : true, // Don't trigger again
	do_once_per_save : false, // Trigger at room start after saving instead
	saveroom : global.saveroom // Which ds_list to save to
}
activated = false;

condition = default_condition; // Condition
output = default_output; // True
reverse_output = noone; // False

/*
	Example
	
	flags.do_once = true;
	flags.do_save = true;
	flags.saveroom = global.baddieroom;
	condition = function() 
	{
		return (place_meeting(x, y, obj_player) && obj_player.state == states.groundpoundland);
	}

	output = function() 
	{
		with obj_secretteleporter
		{
			activate = true;
			image_index = 0;
		}
	}
*/
