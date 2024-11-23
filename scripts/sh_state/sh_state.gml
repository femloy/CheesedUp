function sh_state(args)
{
	if !WC_debug
		return "You do not have permission to use this command";
	if !instance_exists(obj_player1)
		return safe_get(obj_pause, "pause") ? "Can't do this while paused" : "The player is not in the room";
	
	if array_length(args) < 2
	{
		var statename = "", keys_array = variable_struct_get_names(states);
		for (var i = array_length(keys_array) - 1; i >= 0; i -= 1)
		{
		    if variable_struct_get(states, keys_array[i]) == obj_player1.state
			{
				statename = keys_array[i];
				break;
			}
		}
		return string("The current player state is {0} ({1})", statename, obj_player1.state);
	}
	
	var _state = args[1];
	if string_is_number(_state)
	{
		with obj_player1
			state = real(_state);
		return string("Set the player's state to {0}", _state);
	}
	else
	{
		if string_starts_with(_state, "states.")
			_state = string_replace(_state, "states.", "");
		
		if variable_global_exists("states") && is_struct(states) && variable_struct_exists(states, _state)
		{
			with obj_player1
				state = variable_struct_get(states, _state);
			return string("Set the player's state to {0} ({1})", args[1], obj_player1.state);
		}
		else
			return string("The state {0} doesn't exist", args[1]);
	}
}
function meta_state()
{
	return {
		description: "change the player's state",
		arguments: ["state"],
		suggestions: [
			function()
			{
				var state_array = variable_struct_get_names(states);
				array_sort(state_array, true);
				return state_array;
			},
		],
	}
}
