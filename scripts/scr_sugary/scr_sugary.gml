#macro SS_CODE_START if SUGARY_SPIRE {
#macro SS_CODE_END }

// either sugary level OR sugaryoverrides + pizzelle
function check_sugary(pure = false)
{
	if SUGARY_SPIRE
	{
		if pure return SUGARY;
		return SUGARY or (global.sugaryoverride && check_sugarychar());
	}
	return false;
}
