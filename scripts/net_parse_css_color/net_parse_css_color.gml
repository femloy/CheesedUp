ptt {

function net_parse_css_color(text, error_string = false)
{
	if string_char_at(text, 1) == "#"
	    text = string_delete(text, 1, 1);
	
	var len = string_length(text);
	var hex = array_create(len);
	
	for (var i = 0; i < len; i += 1)
	    hex[i] = string_char_at(text, i + 1);
	
	len = array_length(hex);
	var r = 0;
	var g = 0;
	var b = 0;

	for (i = 0; i < len; i++)
	{
	    switch string_upper(hex[i])
		{
	        case "A": case "B": case "C": case "D": case "E": case "F":
	            hex[i] = ord(string_upper(hex[i])) - ord("A") + 10;
	            break;
	        case "0": case "1": case "2": case "3": case "4": case "5": case "6": case "7": case "8": case "9":
	            hex[i] = real(hex[i]);
				break;
			default:
				return error_string ? concat("Invalid HEX character \"", hex[i], "\" at ", i + 1) : c_white;
	    }
	}

	if len == 6
	{
	    r = hex[0] * 16 + hex[1];
	    g = hex[2] * 16 + hex[3];
	    b = hex[4] * 16 + hex[5];
	}
	else
		return error_string ? "HEX code must be #RRGGBB" : c_white;
	
	return make_color_rgb(r, g, b);
}

}
