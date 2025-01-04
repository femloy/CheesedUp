function struct_expect_default(struct, variable, def)
{
	var value = struct[$ variable];
	if value == undefined
		return def;
	if typeof(value) != typeof(def)
	{
		show_message($"Entry \"{variable}\" is typeof {typeof(value)}, expected {typeof(def)}");
		return def;
	}
	return value;
}
