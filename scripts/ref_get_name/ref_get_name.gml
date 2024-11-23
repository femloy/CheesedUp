function ref_get_name(ref)
{
	if !is_handle(ref)
		return STRING_UNDEFINED;
	
	var type = string_split(string(ref), " ")[1];
	switch type
	{
		// Made this match order in the asset browser so it looks pretty
		
		case "object": return object_get_name(ref);
		case "room": return room_get_name(ref);
		case "shader": return shader_get_name(ref);
		case "sprite": return sprite_get_name(ref);
	}
}
