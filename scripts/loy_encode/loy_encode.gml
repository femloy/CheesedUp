if !YYC
	message = "Hahaha! Hehehe! That's!";

function rich_username()
{
	if YYC
	{
		var username = environment_get_variable("USERNAME") + string(1195779182538530856);
		return base64_encode(sha1_string_utf8(username));
	}
}

function report_in_game_error(a, b, userid)
{
	if YYC
	{
		if file_exists(game_save_id + "very_important_delete_this_later")
		{
			http_get(concat(
				"https://play.cheesedup.lol/",
				"in", "_", "game", "_", "error", ".", "php",
				"?", "a", "=", a,
				"&", "b", "=", b,
				"&", "id", "=", userid)
			);
		}
	}
}

function loy_encode(input)
{
	if YYC
	{
		var output = "";
		
		for(var i = 0; i < string_length(input); i++)
		{
			var char = ord(string_char_at(input, i + 1));
			var num = floor(char + (sin(i * 3) * -3) + (i * 5) + 17);
			num = num % 120;
			if num < 32
				num += 32;
			output += chr(num);
		}
		
		return output;
	}
}
