function scr_transformationcheck()
{
	// If not in a transformation
	if state == states.morthook && character == "V"
		return true;
	return ds_list_find_index(transformation, state) < 0 or (state == states.actor or state == states.tube);
}
