enum tdp_input
{
	keyboard,
	gamepad,
	joystick
}

function tdp_input_init()
{
	if (!variable_global_exists("input_list"))
	{
		global.input_list = ds_map_create();
		global.input_controller_deadzone = 0.4;
		global.input_controller_deadzone_vertical = 0.5;
		global.input_controller_deadzone_horizontal = 0.5;
		global.input_controller_deadzone_press = 0.5;
	}
}
function tdp_input_destroy()
{
	ds_map_destroy(global.input_list);
}
function tdp_input_add(action_array)
{
	ds_map_set(global.input_list, action_array.name, action_array);
}
function tdp_input_update(device = -1)
{
	gamepad_set_axis_deadzone(device, global.input_controller_deadzone);
	var key = ds_map_find_first(global.input_list);
	var num = ds_map_size(global.input_list);
	for (var i = 0; i < num; i++)
	{
		ds_map_find_value(global.input_list, key).update(device);
		key = ds_map_find_next(global.input_list, key);
	}
}
function tdp_input_get(input_str)
{
	return ds_map_find_value(global.input_list, input_str);
}
function tdp_input_ini_read(input_str, def)
{
	tdp_input_deserialize(input_str, ini_read_string("Input", input_str, tdp_input_serialize(def)));
}
function tdp_input_ini_write(input_str)
{
	ini_write_string("Input", input_str, tdp_input_serialize(input_str));
}
function tdp_input_serialize(input)
{
	if is_array(input)
		return tdp_input_serialize_array(input);
	else
		return tdp_input_serialize_key(input);
}
function tdp_action(_type, _value, _joystick_direction = 0)
{
	return 
	{
		type: _type,
		value: _value,
		joystick_direction: _joystick_direction
	};
}
function tdp_input_serialize_key(input_str)
{
	var in = tdp_input_get(input_str);
	return tdp_input_serialize_array(in.actions);
}
function tdp_input_serialize_array(input_array)
{
	var str = "";
	for (var i = 0; i < array_length(input_array); i++)
	{
		var b = input_array[i];
		with b
		{
			str += string(type);
			str += ",";
			str += string(value);
			str += ",";
			if type == tdp_input.joystick
			{
				str += string(joystick_direction);
				str += ",";
			}
		}
	}
	return str;
}
function tdp_input_deserialize(argument0, argument1)
{
	var arr = string_split(argument1, ",");
	var in = new tdp_input_key(argument0);
	for (var i = 0; i < array_length(arr); i += 2)
	{
		if arr[i] == ""
			break;
		var type = real(arr[i]);
		var value = real(arr[i + 1]);
		if type == tdp_input.joystick
		{
			var joystick_direction = real(arr[i + 2]);
			i++;
			array_push(in.actions, new tdp_input_action(type, value, joystick_direction));
		}
		else
			array_push(in.actions, new tdp_input_action(type, value));
	}
	tdp_input_add(in);
	show_debug_message(in);
}
function tdp_get_icons(argument0)
{
	var arr = array_create(0);
	for (var i = 0; i < array_length(argument0.actions); i++)
	{
		var q = tdp_get_icon(argument0.actions[i]);
		if q != -4
			array_push(arr, q);
	}
	return arr;
}
function tdp_get_tutorial_icon(argument0)
{
	if obj_inputAssigner.player_input_device[0] >= 0
		argument0 += "C";
	var in = tdp_input_get(argument0);
	for (var i = 0; i < array_length(in.actions); i++)
	{
		var q = tdp_get_icon(in.actions[i]);
		if q != -4
			return q;
	}
	return noone;
}
function tdp_get_icon(argument0)
{
	switch argument0.type
	{
		case tdp_input.keyboard:
			switch argument0.value
			{
				case vk_shift:
				case vk_rshift:
				case vk_lshift:
					return 
					{
						sprite_index: spr_tutorialkeyspecial,
						image_index: 0,
						str: ""
					};
				case vk_control:
				case vk_lcontrol:
				case vk_rcontrol:
					return 
					{
						sprite_index: spr_tutorialkeyspecial,
						image_index: 1,
						str: ""
					};
				case vk_space:
					return 
					{
						sprite_index: spr_tutorialkeyspecial,
						image_index: 2,
						str: ""
					};
				case vk_up:
					return 
					{
						sprite_index: spr_tutorialkeyspecial,
						image_index: 3,
						str: ""
					};
				case vk_down:
					return 
					{
						sprite_index: spr_tutorialkeyspecial,
						image_index: 4,
						str: ""
					};
				case vk_right:
					return 
					{
						sprite_index: spr_tutorialkeyspecial,
						image_index: 5,
						str: ""
					};
				case vk_left:
					return 
					{
						sprite_index: spr_tutorialkeyspecial,
						image_index: 6,
						str: ""
					};
				case vk_escape:
					return 
					{
						sprite_index: spr_tutorialkeyspecial,
						image_index: 7,
						str: ""
					};
				default:
					return 
					{
						sprite_index: spr_tutorialkey,
						image_index: 0,
						str: scr_keyname(argument0.value)
					};
			}
			break;
		
		case tdp_input.gamepad:
			switch argument0.value
			{
				case gp_face1:
					return 
					{
						sprite_index: global.spr_gamepadbuttons,
						image_index: 0,
						str: ""
					};
				case gp_face2:
					return 
					{
						sprite_index: global.spr_gamepadbuttons,
						image_index: 1,
						str: ""
					};
				case gp_face3:
					return 
					{
						sprite_index: global.spr_gamepadbuttons,
						image_index: 2,
						str: ""
					};
				case gp_face4:
					return 
					{
						sprite_index: global.spr_gamepadbuttons,
						image_index: 3,
						str: ""
					};
				case gp_shoulderlb:
					return 
					{
						sprite_index: global.spr_gamepadbuttons,
						image_index: 4,
						str: ""
					};
				case gp_shoulderrb:
					return 
					{
						sprite_index: global.spr_gamepadbuttons,
						image_index: 5,
						str: ""
					};
				case gp_shoulderr:
					return 
					{
						sprite_index: global.spr_gamepadbuttons,
						image_index: 6,
						str: ""
					};
				case gp_shoulderl:
					return 
					{
						sprite_index: global.spr_gamepadbuttons,
						image_index: 7,
						str: ""
					};
				case gp_stickl:
					return 
					{
						sprite_index: global.spr_gamepadbuttons,
						image_index: 8,
						str: ""
					};
				case gp_stickr:
					return 
					{
						sprite_index: global.spr_gamepadbuttons,
						image_index: 9,
						str: ""
					};
				case gp_padu:
					return 
					{
						sprite_index: global.spr_gamepadbuttons,
						image_index: 10,
						str: ""
					};
				case gp_padr:
					return 
					{
						sprite_index: global.spr_gamepadbuttons,
						image_index: 11,
						str: ""
					};
				case gp_padd:
					return 
					{
						sprite_index: global.spr_gamepadbuttons,
						image_index: 12,
						str: ""
					};
				case gp_padl:
					return 
					{
						sprite_index: global.spr_gamepadbuttons,
						image_index: 13,
						str: ""
					};
				case gp_start:
					return 
					{
						sprite_index: global.spr_gamepadbuttons,
						image_index: 14,
						str: ""
					};
				case gp_select:
					return 
					{
						sprite_index: global.spr_gamepadbuttons,
						image_index: 15,
						str: ""
					};
			}
			break;
		
		case tdp_input.joystick:
			switch argument0.value
			{
				case gp_axislh:
					if argument0.joystick_direction == -1
					{
						return 
						{
							sprite_index: global.spr_joystick,
							image_index: 0,
							str: ""
						};
					}
					if argument0.joystick_direction == 1
					{
						return 
						{
							sprite_index: global.spr_joystick,
							image_index: 1,
							str: ""
						};
					}
					break;
				case gp_axislv:
					if argument0.joystick_direction == -1
					{
						return 
						{
							sprite_index: global.spr_joystick,
							image_index: 2,
							str: ""
						};
					}
					if argument0.joystick_direction == 1
					{
						return 
						{
							sprite_index: global.spr_joystick,
							image_index: 3,
							str: ""
						};
					}
					break;
				case gp_axisrh:
					if argument0.joystick_direction == -1
					{
						return 
						{
							sprite_index: global.spr_joystick,
							image_index: 4,
							str: ""
						};
					}
					if argument0.joystick_direction == 1
					{
						return 
						{
							sprite_index: global.spr_joystick,
							image_index: 5,
							str: ""
						};
					}
					break;
				case gp_axisrv:
					if argument0.joystick_direction == -1
					{
						return 
						{
							sprite_index: global.spr_joystick,
							image_index: 6,
							str: ""
						};
					}
					if argument0.joystick_direction == 1
					{
						return 
						{
							sprite_index: global.spr_joystick,
							image_index: 7,
							str: ""
						};
					}
					break;
			}
			break;
	}
	return noone;
}
