function object_get_depth(obj)
{
	/// @description Returns the depth of the specified object.
	/// @param {Number} obj The index of the object to check
	/// @return {Number} depth of the object
	if is_struct(obj) or !object_exists(obj)
		return 0;
	
	var objID = obj;
	var ret = 0;
	if (objID >= 0) && (objID < array_length(global.__objectID2Depth)) {
		ret = global.__objectID2Depth[objID];
	} // end if
	return ret;
}
