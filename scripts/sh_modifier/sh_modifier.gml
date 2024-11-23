function sh_modifier(args)
{
	if !WC_debug
		return "You do not have permission to use this command";
	if array_length(args) < 2
		return "Argument missing: modifier";
	
	var modifier = args[1];
	if !variable_struct_exists(MOD, modifier)
		return $"Modifier {modifier} not found";
	
	if array_length(args) >= 3 && string_trim(args[2]) != ""
	{
		if string_is_number(args[2])
			var value = real(args[2]);
		else
			return $"Value parameter is not a valid number";
	}
	else
		var value = !variable_struct_get(MOD, modifier);
	
	variable_struct_set(MOD, modifier, value);
	if value == 0 or value == 1
		return $"{modifier} modifier {value ? "ON" : "OFF"}";
	else
		return $"{modifier} modifier set to {value}";
}
function meta_modifier()
{
	return
	{
		description: "toggle a modifier",
		arguments: ["modifier", "<value>"],
		suggestions: [
			function()
			{
				var state_array = variable_struct_get_names(MOD);
				array_sort(state_array, true);
				return state_array;
			},
		],
	}
}
