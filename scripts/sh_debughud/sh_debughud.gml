function sh_debughud(args)
{
	if !WC_debug
		return "You do not have permission to use this command";
	
	var inst = undefined;
	if array_length(args) > 1
	{
		if args[1] == "global"
			inst = global;
		else if args[1] == "all"
			return "You can't debug all objects at once. Yeah I know, bummer, right?";
		else
		{
			var inst = WCscr_findobj(args[1]);
			if object_exists(inst[0]) && !inst[1]
				return $"Must specify instance index. Example: {object_get_name(inst[0])}:0";
			if !instance_exists(inst[0])
				return $"The instance of {args[1]} does not exist";
			inst = inst[0];
		}
	}
	
	if is_undefined(inst)
	{
		if !isOpen && keyboard_check(vk_control)
			WC_select_mode = WC_select_modes.debugview;
		else if !isOpen && keyboard_check(vk_shift)
		{
			WC_debugview = true;
			WC_debugview_target = global;
			WC_debugview_scroll = 0;
		}
		else
			WC_debugview = !WC_debugview;
	}
	else
	{
		WC_debugview = true;
		WC_debugview_target = inst;
		WC_debugview_scroll = 0;
	}
}
function meta_debughud()
{
	return
	{
		description: "toggle debug view. while it's on press PAGE UP or PAGE DOWN to scroll the variable list",
		arguments: ["<instance>"],
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
					
					for(var j = 0; j < instance_number(obj); ++j)
					{
						if instance_find(obj, j).id == inst.id
							array_push(obj_array, concat(object_get_name(obj), ":", j));
					}
				}
				array_sort(obj_array, true);
				array_insert(obj_array, 0, "global");
				return obj_array;
			}
		],
		argumentDescriptions: [
			"either just \"global\" or the instance to check",
		],
	}
}
