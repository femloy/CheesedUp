function draw_set_align(halign = fa_left, valign = fa_top)
{
	draw_set_halign(halign);
	draw_set_valign(valign);
}
function tdp_draw_set_align(halign = fa_left, valign = fa_top)
{
	tdp_draw_set_halign(halign);
	tdp_draw_set_valign(valign);
}
function array_unfold(array, delim = ", ")
{
	var _string = buffer_create(64, buffer_grow, 1);
	for (var i = 0, n = array_length(array); i < n; ++i)
	{
		buffer_write(_string, buffer_text, string(array[i]));
		if i < n - 1
			buffer_write(_string, buffer_text, delim);
	}
	
	buffer_seek(_string, buffer_seek_start, 0);
	var s = buffer_read(_string, buffer_string);
	
	buffer_delete(_string);
	return s;
}
function trace()
{
	if !DEBUG exit;
	
	var _buffer = buffer_create(64, buffer_grow, 1);
	for (var i = 0; i < argument_count; i++)
	{
		var _this = argument[i];
		buffer_write(_buffer, buffer_text, stringify(_this, false, 2));
	}
	
	buffer_seek(_buffer, buffer_seek_start, 0);
	show_debug_message(buffer_read(_buffer, buffer_string));
	buffer_delete(_buffer);
}
function stringify_code_entry(str)
{
	return str;
}
function stringify(value, include_quotes = false, detailed = 1, __recursion = [], __context = self)
{
	var detail = detailed > 1 ? 2 : 0;
	if array_contains(__recursion, value)
		return "recursive struct";
	
	switch typeof(value)
	{
		default: return $"Unknown type {typeof(value)} (\"{value}\")";
		
		case "ref":
			var type = string_split(value, " ")[1];
			if real(value) < 0
				return "none";
			switch type
			{
				case "sprite":
					if !sprite_exists(value)
						return $"(DEAD) Sprite {real(value)}";
					var result = $"{sprite_get_name(value)} (Sprite {real(value)})";
					if detailed
						result += $" - {stringify(sprite_get_info(value), true, detail)}";
					return result;
				case "sequence":
					if !sequence_exists(value)
						return $"(DEAD) Sequence {real(value)}";
					var result = $"{sequence_get(value).name} (Sequence {real(value)})";
					if detailed
						result += $" - {stringify(sequence_get(value), true, detail)}";
					return result;
				case "animcurve":
					if !animcurve_exists(value)
						return $"(DEAD) Animation curve {real(value)}";
					var result = $"{animcurve_get(value).name} (Curve {real(value)})";
					if detailed
						result += $" - {stringify(animcurve_get(value), true, detail)}";
					return result;
				case "tileset":
					var result = $"{tileset_get_name(value)} (Tileset {real(value)})";
					if detailed
						result += $" - {stringify(tileset_get_info(value), true, detail)}";
					return result;
				case "sound":
					if !audio_exists(value)
						return $"(DEAD) Sound {real(value)}";
					var result = $"{audio_get_name(value)} (Sound {real(value)})";
					if detailed
					{
						var type = "error";
						switch audio_get_type(value)
						{
							case 1: type = "streamed"; break;
							case 0: type = "in memory"; break;
						}
						result += $" - {audio_is_playing(value) ? "Playing" : "Not playing"}, {audio_is_paused(value) ? "paused" : "unpaused"}, {type}, {audio_group_name(audio_sound_get_audio_group(value))} ({audio_sound_get_audio_group(value)})";
					}
					return result;
				case "path":
					if !path_exists(value)
						return $"(DEAD) Path {real(value)}";
					var result = $"{path_get_name(value)} (Path {real(value)})";
					if detailed
						result += $" - {path_get_closed(value) ? "Closed" : "Open"}, {path_get_kind(value) ? "smooth" : "straight"}, {path_get_length(value)}px long, {path_get_number(value)} points";
					return result;
				case "script":
					if !script_exists(value)
						return $"(DEAD) Script {real(value)}";
					if variable_global_exists(script_get_name(value))
						return $"{script_get_name(value)} (Function {real(value)})";
					return $"{script_get_name(value)} (Script {real(value)})";
				case "shader":
					return $"{shader_get_name(value)} (Shader {real(value)})";
				case "font":
					if !font_exists(value)
						return $"(DEAD) Font {real(value)}";
					var result = $"{font_get_name(value)} (Font {real(value)})";
					if detailed
						result += $" - {stringify(font_get_info(value), true, detail)}";
					return result;
				case "timeline":
					if !timeline_exists(value)
						return $"(DEAD) Timeline {real(value)}";
					return $"{timeline_get_name(value)} (Timeline {real(value)})";
				case "object":
					if real(value) < 0
						return "none";
					if !object_exists(value) 
						return $"(DEAD) Object {real(value)}";
					var result = $"{object_get_name(value)} (Object {real(value)})";
					if detailed
						result += $" - {object_get_persistent(value) ? "Persistent" : "Not persistent"}, {object_get_solid(value) ? "solid" : "not solid"}, {object_get_visible(value) ? "visible" : "invisible"}, parent: {stringify(object_get_parent(value), true, 0)}, sprite: {stringify(object_get_sprite(value), true, 0)}, mask: {stringify(object_get_mask(value), true, 0)}, {object_get_physics(value) ? "has physics" : "no physics"}";
					return result;
				case "room":
					if !room_exists(value)
						return $"(DEAD) Room {real(value)}";
					var result = $"{room_get_name(value)} (Room {real(value)})";
					if detailed
						result += $" - {stringify(room_get_info(value), true, detail)}"
					return result;
				case "instance":
					if !instance_exists(value)
						return $"(DEAD) Instance {real(value)}";
					return $"{object_get_name(value.object_index)} (Instance {real(value)})";
				
				case "particle_system_instance":
					if !part_system_exists(value)
						return $"(DEAD) Particle system {real(value)}";
					var result = $"Particle system {real(value)}";
					if detailed
						result += $" - {stringify(part_system_get_info(value), true, detail)}";
					return result;
				case "particle_emitter":
					return $"Particle emitter {real(value)}";
				case "particle_type":
					if !part_type_exists(value)
						return $"(DEAD) Particle type {real(value)}";
					return $"Particle type {real(value)}";
				
				case "buffer":
					if !buffer_exists(value) // never happens
						return $"(DEAD) Buffer {real(value)}";
					var result = $"Buffer {real(value)}";
					if detailed
					{
						var pos = buffer_tell(value);
						buffer_seek(value, buffer_seek_start, 0);
						var result2 = "";
						for(var i = 0; i < buffer_get_size(value); i++)
							result2 += string(buffer_peek(value, i, buffer_u8)) + " ";
						buffer_seek(value, buffer_seek_start, pos);
						result += $" - ({buffer_get_size(value)} bytes) {result2}";
					}
					return result;
				case "vertex_buffer":
					var result = $"Vertex buffer {real(value)}";
					if detailed
					{
						var buffer;
						try // sigh
						{
							buffer = buffer_create_from_vertex_buffer(value, buffer_fixed, 1);
						}
						catch (buffer)
						{
							return $"(DEAD) Vertex buffer {real(value)}";
						}
						buffer_seek(buffer, buffer_seek_start, 0);
						var result = "";
						for(var i = 0; i < buffer_get_size(buffer); i++)
							result += string(buffer_peek(buffer, i, buffer_u8)) + " ";
						var size = buffer_get_size(buffer);
						buffer_delete(buffer);
						result += $" - ({size} bytes) {result}";
					}
					return result;
				case "vertex_format":
					var info = vertex_format_get_info(value);
					if is_undefined(info)
						return $"(DEAD) Vertex format {real(value)}";
					var result = $"Vertex format {real(value)}";
					if detailed
						result += $" - {stringify(info, true, detail)}";
					return result;
				
				case "surface":
					if !surface_exists(value)
						return $"(DEAD) Surface {real(value)}";
					var result = $"Surface {real(value)}";
					if detailed
					{
						var format = "unknown";
						switch surface_get_format(value)
						{
							case surface_rgba8unorm: format = "rgba8unorm"; break;
							case surface_r8unorm: format = "r8unorm"; break;
							case surface_rg8unorm: format = "rg8unorm"; break;
							case surface_rgba4unorm: format = "rgba4unorm"; break;
							case surface_rgba16float: format = "rgba16float"; break;
							case surface_r16float: format = "r16float"; break;
							case surface_rgba32float: format = "rgba32float"; break;
							case surface_r32float: format = "r32float"; break;
						}
						result += $" - {surface_get_width(value)}x{surface_get_height(value)} {format}";
					}
					return result;
				
				case "ds_list":
					var result = "";
					for(var i = 0, n = ds_list_size(value); i < n; ++i)
					{
						result += stringify(value[| i], true, detail, __recursion, __context);
						if i < n - 1
							result += ", ";
					}
					return $"List {real(value)} - [| {result}]";
				case "ds_grid":
					var result = "[";
					for(var yy = 0, ht = ds_grid_height(value); yy < ht; ++yy)
					{
						for(var xx = 0, wd = ds_grid_width(value); xx < wd; ++xx)
						{
							result += stringify(value[# xx, yy], true, detail, __recursion, __context);
							if yy < ht - 1 or xx < wd - 1
								result += ", ";
						}
						if yy < ht - 1
							result += "\n ";
					}
					result += "]";
					return $"Grid {real(value)} - {result}";
				case "ds_map":
					var result = "";
					
					var key = ds_map_find_first(value);
					while !is_undefined(key)
					{
						result += $"{stringify(key, true, detail)}: {stringify(value[? key], true, detail, __recursion, __context)}";
						
						key = ds_map_find_next(value, key);
						if !is_undefined(key)
							result += ", ";
					}
					return $"Map {real(value)} - [? {result}]";
				case "ds_queue":
					var array = [];
					while !ds_queue_empty(value)
						array_push(array, ds_queue_dequeue(value));
					
					var result = "";
					for(var i = 0, n = array_length(array); i < n; ++i)
					{
						result += stringify(array[i], true, detail, __recursion, __context);
						if i < n - 1
							result += " -> ";
						
						ds_queue_enqueue(value, array[i]);
					}
					return $"Queue {real(value)} - [{result}]";
				case "ds_priority":
					var values = [];
					var priors = [];
					
					var result = "";
					while !ds_priority_empty(value)
					{
						var val = ds_priority_find_min(value);
						var prior = ds_priority_find_priority(value, val);
						
						array_push(values, val);
						array_push(priors, prior);
						
						result += $"{stringify(val, true, detail, __recursion, __context)}: {prior}";
						ds_priority_delete_min(value);
						
						if !ds_priority_empty(value)
							result += ", ";
					}
					
					while array_length(values)
						ds_priority_add(value, array_shift(values), array_shift(priors));
					return $"Priority Queue {real(value)} - [{result}]";
				case "ds_stack":
					var array = [];
					while !ds_stack_empty(value)
						array_insert(array, 0, ds_stack_pop(value));
					
					var result = "";
					for(var i = 0, n = array_length(array); i < n; ++i)
					{
						result += stringify(array[i], true, detail, __recursion, __context);
						if i < n - 1
							result += " <- ";
						
						ds_stack_push(value, array[i]);
					}
					return $"Stack {real(value)} - [{result}]";
			}
			return string(value);
		
		case "struct":
			if value == global
				return "global";
			
			var vars = struct_get_names(value);
			array_push(__recursion, value);
			
			var result = "";
			for(var i = 0, n = array_length(vars); i < n; ++i)
			{
				result += $"{vars[i]}: {stringify(value[$ vars[i]], true, detail, __recursion, value)}";
				if i < n - 1
					result += ", ";
			}
			return $"\{{result}\}";
		
		case "method":
			var type = string_split(value, " ");
			var method_self = method_get_self(value);
			var result = string(value);
			
			if array_length(type) > 1
			{
				var func = string_split(string_split(value, " ")[1], "@");
				if func[0] == "gml_Script_anon"
					result = $"anon function @ {stringify_code_entry(func[2])}";
			}
			else // method of a builtin function
				result = script_get_name(method_get_index(value));
			
			if method_self != __context
				return $"method( {stringify(method_self, true, detail)}, {result} )";
			return result;
		
		case "bool":
			return value ? "true" : "false";
		
		case "array":
			var result = "";
			for(var i = 0, n = array_length(value); i < n; ++i)
			{
				result += stringify(value[i], true, detail, __recursion, __context);
				if i < n - 1
					result += ", ";
			}
			return $"[{result}]";
		
		case "int32": case "int64":
			return $"({value} << 0)";
		
		case "string":
			if include_quotes
				return $"\"{value}\"";
			return value;
		
		case "number": case "ptr": case "undefined": case "null":
			return string(value);
	}
}
