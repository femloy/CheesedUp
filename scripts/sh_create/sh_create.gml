function sh_create(args)
{
	if YYC
	{
		if instance_exists(obj_disclaimer) or room == Initroom
			return WC_FUCK_YOU;
	}
	if !WC_debug
		return WC_NODEBUG;
	if array_length(args) < 2
		return "Missing argument: object";
	
	// parse object
	var object = args[1];
	if string_is_number(object)
	{
		object = real(object);
		if !object_exists(object)
			return $"Object with index {object} doesn't exist";
	}
	else
	{
		if asset_get_type(object) == asset_object
			object = asset_get_index(object);
		else
			return $"Object with name {object} doesn't exist";
	}
	if array_contains(asset_get_tags(object, asset_object), "hidden")
		return $"Object with index {object} doesn't exist";
	if array_contains(asset_get_tags(object, asset_object), "protected")
		return "Can't create protected object";
	
	// parse extras
	var xx, yy, props;
	if array_length(args) >= 3 && args[2] != ""
	{
		if array_length(args) < 4 or args[3] == ""
			return "Missing argument: y";
		
		// position
		xx = WCscr_getvalue(args[2]);
		yy = WCscr_getvalue(args[3]);
		
		if !is_real(xx)
			return "\"x\" parameter must be a number";
		if !is_real(yy)
			return "\"y\" parameter must be a number";
		
		// create
		var inst = instance_create(xx, yy, object);
		
		// properties {}
		if array_length(args) >= 5 && args[4] != ""
		{
			props = WCscr_allargs(args, 4);
			try {
				props = json_parse(props);
			}
			catch (e) {
				trace(props);
				return e.message;
			}
			scr_wc_apply_props(inst, props);
		}
		
		return "Created " + args[1] + " at x" + args[2] + " y" + args[3];
	}
	else
	{
		isOpen = false;
		WC_select_mode = WC_select_modes.create;
		WC_select_inst = object;
	}
}
function meta_create()
{
	return {
		description: "creates an object",
		arguments: ["object", "<x>", "<y>", "<props>"],
		suggestions: [
			function()
			{
				var obj_array = [];
				
				var tags = tag_get_asset_ids("hidden", asset_object);
				for(var i = 0; object_exists(i); i++)
				{
					var name = object_get_name(i);
					if !array_contains(tags, i) && !string_starts_with(name, "__YY")
						array_push(obj_array, name);
				}
				
				array_sort(obj_array, true);
				return obj_array;
			},
			["mouse_x"],
			["mouse_y"],
			["{}"],
		],
		argumentDescriptions: [
			"name or index of the object to spawn",
			"x position to place the object in",
			"y position to place the object in",
			"properties, as json, for the object",
		],
	}
}
