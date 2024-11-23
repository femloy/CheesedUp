/// @description Creates an instance of a given object at a given position.
/// @param x The x position the object will be created at.
/// @param y The y position the object will be created at.
/// @param obj The object to create an instance of.
function instance_create(x, y, obj, var_struct = {})
{
	var obj_final = obj;
	/*
	if is_string(obj) && global.in_cyop
	{
		switch obj
		{
			
		}
	}
	*/
	var myDepth = object_get_depth( obj_final );
	return instance_create_depth( x, y, myDepth ?? 0, obj_final, var_struct );
}
