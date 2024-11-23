function sh_hidetiles(args)
{
	if array_length(args) < 2
		global.hidetiles = !global.hidetiles;
	else
	{
		if args[1] == "true" or args[1] == "1"
			args[1] = true;
		else if args[1] == "false" or args[1] == "0"
			args[1] = false;
		else
			return "Invalid bool";
		
		global.hidetiles = args[1];
	}
	
	var layers = layer_get_all();
	for (var i = 0; i < array_length(layers); i++)
	{
		var lay = layers[i];
		if layer_tilemap_get_id(lay) != -1
			layer_set_visible(lay, !global.hidetiles);
	}
	
	return $"Tile visibility {global.hidetiles ? "OFF" : "ON"}";
}
function meta_hidetiles()
{
	return
	{
		description: "",
		arguments: ["bool"],
	}
}
