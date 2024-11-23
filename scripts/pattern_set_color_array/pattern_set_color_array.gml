function pattern_set_color_array(color_array)
{
	if array_length(color_array) > 8
		throw $"Color array larger than 8 ({array_length(color_array)}) - {color_array}";
	
	var actual_array = array_create(8, -1);
	array_copy(actual_array, 0, color_array, 0, array_length(color_array));
	
    shader_set_uniform_f_array(global.Pattern_Color_Array, actual_array);
}
