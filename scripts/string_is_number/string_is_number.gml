function string_is_number(str)
{
	if !string_length(str)
		return false;
	if is_real(str)
		return true;
	
	var count = 0;
	for(var i = 1; i <= string_length(str); i++)
	{
		var char = string_char_at(str, i);
		if char == "." or char == "-" or (ord(char) >= ord("0") && ord(char) <= ord("9"))
			count++;
	}
	return string_length(str) == count;
}
function number_in_range(num, _min, _max)
{
	return _min <= num && num <= _max;
}
