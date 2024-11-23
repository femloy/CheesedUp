function sh_set_combo(args)
{
	if array_length(args) < 2
		return "Combo parameter missing";
	if !string_is_number(args[1])
		return "Invalid combo";
		
	var combo = real(args[1]);
	var combotime = 60;
		
	if array_length(args) > 2
	{
		if string_is_number(args[2])
			combotime = real(args[2]);
		else
			return "Invalid combotime";
	}
		
	global.combo = combo;
	global.combotime = combotime;
		
	with obj_player
		supercharge = 10;
}
function meta_set_combo()
{
	return
	{
		description: "set the combo",
		arguments: ["combo", "<combotime>"],
	}
}
