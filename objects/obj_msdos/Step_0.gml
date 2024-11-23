live_auto_call;

if queued_exit
{
	obj_player1.state = states.normal;
	instance_create(0, 0, obj_genericfade);
	instance_destroy();
}

if keyboard_check_pressed(vk_escape)
	queued_exit = true;

// input
var lastchar = ord(keyboard_lastchar);
if (lastchar == 127 or lastchar == 3)
&& allow_break
{
	// cancel command
	output += input + "^C";
	input_mode = 0;
	
	instructions = [];
	instructionF = noone;
	instructionT = -1;
	DOS_instruct(3, DOS_initstate);
	
	keyboard_string = "";
	keyboard_lastchar = "";
	input = "";
}

if input_mode == 0
{
	blink = 0;
	input = "";
	
	if !safe_get(obj_shell, "isOpen")
		keyboard_string = "";
}
else
{
	if input_mode == 2 && keyboard_lastchar != ""
		queued_exit = true;
	else
	{
		input = string_copy(keyboard_string, 1, 75);
		input = string_replace_all(input, "^", "");
		
		if keyboard_string != input
			keyboard_string = input;
		
		// go
		if lastchar == 13
		{
			output += input;
			DOS_command();
			
			keyboard_string = "";
			keyboard_lastchar = "";
			input = "";
		}
		
		// tab
		if lastchar == vk_tab
		{
			keyboard_string += "\t";
			keyboard_lastchar = "";
			input = keyboard_string;
		}
	}
}

// instructions
if instructionT > 0
	instructionT--;
else
{
	if is_callable(instructionF)
	{
		instructionF();
		instructionF = -1;
	}
	
	var pop = array_shift(instructions);
	if pop != undefined
	{
		instructionT = pop[0];
		instructionF = pop[1];
		trace(pop);
	}
}
