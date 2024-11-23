function sh_detail(args)
{
	if YYC
	{
		if instance_exists(obj_disclaimer) or room == Initroom
			return WC_FUCK_YOU;
	}
	if !WC_debug
		return "You do not have permission to use this command";
	if array_length(args) < 3
		return "Not enough arguments. Usage: detail <instance(:index) or global> <variable>";
	
	// get arguments
	var pretarget = args[1];
	var variable = args[2];
	
	// resolve target
	var target;
	if pretarget == "global"
		target = global;
	else
	{
		var obj = WCscr_findobj(pretarget);
		if is_array(obj)
		{
			target = obj[0];
			if !obj[1]
				return $"Must specify which one. Example: {object_get_name(target)}:0";
			if !instance_exists(target)
				return $"The instance of {pretarget} does not exist";
		}
		else
			return obj;
	}
	
	if YYC
	{
		if target != global && instance_exists(target) && array_contains(asset_get_tags(target.object_index, asset_object), "protected")
			return "Can't modify protected object";
	}
	
	// variable exists
	if target[$ variable] != undefined
		return stringify(target[$ variable], true, 2);
	else
		return "Variable doesn't exist";
}
function meta_detail()
{
	return
	{
		description: "display a variable's content in excruciating detail",
		arguments: ["instance", "variable"],
		suggestions: [
			function()
			{
				var obj_array = [];
				for(var i = 0; i < instance_count; i++)
				{
					var inst = instance_find(all, i);
					if !instance_exists(inst)
						continue;
					var obj = inst.object_index;
					
					for(var j = 0; j < instance_number(obj); j++)
					{
						if instance_find(obj, j).id == inst.id
							array_push(obj_array, $"{object_get_name(obj)}:{j}");
					}
				}
				array_sort(obj_array, true);
				array_insert(obj_array, 0, "global");
				return obj_array;
			},
			function()
			{
				// resolve target
				with obj_shell
				{
					if !WC_debug
						return [];
					
					var pretarget = inputArray[1];
					var target = noone;
					
					if pretarget == "global"
						target = global;
					else
					{
						var obj = WCscr_findobj(pretarget);
						if is_array(obj)
							target = obj[0];
					}
					
					if target != noone && target != all
						return variable_instance_get_names(target);
				}
			}
		],
		argumentDescriptions: [
			"either \"global\" or an instance",
			"the name of the variable",
		],
	}
}
