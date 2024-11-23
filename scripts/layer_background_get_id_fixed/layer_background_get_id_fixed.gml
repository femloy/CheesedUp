function layer_background_get_id_fixed(layer)
{
	var bwah = layer_background_get_id(layer);
	if bwah > -1
		return bwah;
	
	if layer_exists(layer)
	{
		var els = layer_get_all_elements(layer);
		for (var i = 0, n = array_length(els); i < n; ++i)
		{
			if layer_get_element_type(els[i]) == layerelementtype_background
				return els[i];
		}
		return -1;
	}
	return -1;
}
