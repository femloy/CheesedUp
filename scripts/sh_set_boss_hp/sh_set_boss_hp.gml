function sh_set_boss_hp(args)
{
	if !WC_debug
		return "You do not have permission to use this command";
	if array_length(args) < 2
		return "Missing int argument";
	
	var int = args[1];
	if !string_is_number(int)
		return "Not a number";
	
	with obj_baddie
		elitehit = real(int);
}
function meta_set_boss_hp()
{
	return {
		description: "base game command",
		arguments: ["int"]
	}
}
