function find_files_recursive(folder, func, ext = "")
{
	static recursive_func = function(folder, prefix = "", ext = "", func = noone)
	{
		if directory_exists(folder)
		{
			// files
			if !string_ends_with(folder, "/") or !string_ends_with(folder, "\\")
				folder += "\\";
			var recursion = [];
			
			var file = file_find_first(concat(folder, "*"), fa_directory);
			while file != ""
			{
				var filepath = concat(folder, file);
				if directory_exists(filepath)
					array_push(recursion, file);
				else
				{
					if ext == "" or string_ends_with(file, ext)
					{
						if is_callable(func) && func(filepath)
						{
							recursion = [];
							break;
						}
					}
				}
				file = file_find_next();
			}
			file_find_close();
			
			// look through subfolders
			while array_length(recursion) > 0
			{
				var bwah = array_pop(recursion);
				find_files_recursive.recursive_func(concat(folder, "\\", bwah), concat(bwah, "\\"), ext, func);
			}
			return true;
		}
		return false;
	}
	return recursive_func(folder, "", ext, func);
}
