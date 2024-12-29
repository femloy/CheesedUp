function ModObject(name, path, mod_struct) constructor
{
	self.name = name; // obj_object
	self.path = path; // mods/example/objects/obj_object
	parent_mod = mod_struct;
	
	if !is_instanceof(parent_mod, Mod)
		show_error("Provided mod_struct is not instance of Mod", true);
	
	code = {};
	
	cleanup = function()
	{
		var reactive = [];
		with obj_mod_object
			array_push(reactive, id);
		
		instance_activate_object(obj_mod_object);
		with obj_mod_object
		{
			if __OBJECT.path == other.path
				instance_destroy(id, false);
		}
		
		instance_deactivate_object(obj_mod_object);
		while array_length(reactive)
			instance_activate_object(array_pop(reactive));
		
		var code_names = struct_get_names(code);
		while array_length(code_names)
		{
			var snippet = code[$ array_pop(code_names)] ?? noone;
			if snippet != noone
				live_snippet_destroy(snippet);
		}
	}
}
