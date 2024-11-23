function sh_bind(args)
{
	if array_length(args) < 2
		return "Missing argument: key";
	if array_length(args) < 3
		return "Missing argument: command";
	
	var key, str = string_replace(string_upper(args[1]), "VK_", "");
	key = scr_keyfromname(str);
	
	with obj_shell
	{
		WCscr_addbind(key, WCscr_allargs(args, 2));
		return $"Bound command to keycode {key}";
	}
}
function meta_bind()
{
	return {
		description: "bind a letter to a console command. certain commands will act differently outside the console.",
		arguments: ["key", "command"],
		suggestions: [
			["space", "up", "down", "left", "right", "tab", "enter", "add", "alt", "any", "backspace", "control", "decimal", "escape", "shift", "home", "end", "delete", "insert", "pageup", "pagedown", "pause", "printscreen", "f1", "f2", "f3", "f4", "f5", "f6", "f7", "f8", "f9", "f10", "f11", "f12", "numpad0", "numpad1", "numpad2", "numpad3", "numpad4", "numpad5", "numpad6", "numpad7", "numpad8", "numpad9", "multiply", "divide", "subtract",
			"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"],
			[] // command
		] 
	}
}

function sh_unbind(args)
{
	if array_length(args) < 2
		return "Missing argument: key";
	
	var key, str = string_replace(string_upper(args[1]), "VK_", "");
	key = scr_keyfromname(str);
	
	with obj_shell
	{
		if !ds_map_exists(WC_binds, string(key))
			return "A bind with that key has not been added";
	
		ds_map_delete(WC_binds, string(key));
		return $"Unbound command from keycode {key}";
	}
}
function meta_unbind()
{
	return {
		description: "unbind any command",
		arguments: ["key"],
		suggestions: [
			function()
			{
				// scr_keyname
				var arr = [];
				
				with obj_shell
				{
					var bind = ds_map_find_first(WC_binds);
					while !is_undefined(bind)
					{
						array_push(arr, string_replace_all(string_lower(scr_keyname(real(bind))), " ", ""));
						bind = ds_map_find_next(WC_binds, bind);
					}
				}
				
				return arr;
			}
		]
	}
}
