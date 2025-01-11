live_auto_call;

open_menu();
con = 0;
fade = 0;

//720x400
surf = -1;
output = "";
input_mode = 0;
input = "";
blink = 0;
scroll = 0;
echo = true;
queued_exit = false;
allow_break = true;

bordersurf = -1;

instructions = [];
instructionT = 0;
instructionF = -1;

draw_set_font(fnt_dos);
lineh = string_height("A");
keyboard_string = "";

#region FUNCS

DOS_instruct = function(delay, func) {
	array_push(instructions, [delay, func]);
}
DOS_initstate2 = function()
{
	output += "\n";
	if echo
	{
		output += currentdir.ROOTNAME;
		output += ">";
	}
	input_mode = 1;
}
DOS_initstate = function()
{
	// C:\>
	output += "\n";
	DOS_instruct(3, DOS_initstate2);
}
DOS_allargs = function(args, input = "", after = 1, sep = " ")
{
	var ret = "";
	if input == ""
	{
		for(var i = after; i < array_length(args); i++)
		{
			ret += args[i];
			if i != array_length(args) - 1
				ret += sep;
		}
		return ret;
	}
	else
	{
		for(var i = 0; i < after; i++)
		{
			ret += args[i];
			if i != array_length(args) - 1
				ret += sep;
		}
		return string_replace_all(input, ret, "");
	}
}
DOS_paddedstring = function(str, length, right)
{
	var og_len = string_length(str);
	
	var padding = "";
	repeat length - og_len
		padding += " ";
	
	if right
		return padding + string_copy(str, 1, length);
	else
		return string_copy(str, 1, length) + padding;
}
DOS_dottednumber = function(num)
{
	var str = string(num);
	
	var result = "";
	for(var i = 0; i < string_length(str); i++)
	{
		result = string_char_at(str, string_length(str) - i) + result;
		if i % 3 == 2 && i < string_length(str) - 1
			result = "." + result;
	}
	return result;
}
DOS_command = function(IN = input)
{
	input_mode = 0;
	
	// process
	var args_raw = string_split_ext(IN, [" ", "\\", "/"], true, infinity);
	var args = [];
		
	for(var i = 0; i < array_length(args_raw); i++)
	{
		if string_pos(".", args_raw[i]) != 0
		{
			var fuck = string_split(args_raw[i], ".", false, infinity);
			for(var j = 0; j < array_length(fuck); j++)
			{
				if fuck[j] != ""
					array_push(args, fuck[j]);
				if j != array_length(fuck) - 1
					array_push(args, ".");
			}
		}
		else
			array_push(args, args_raw[i]);
	}
		
	if array_length(args) == 0
	{
		DOS_initstate2();
		exit;
	}
	else
		output += "\n";
		
	switch string_lower(args[0])
	{
		#region RUN
			
		default:
			var emptyhanded = true;
			for(var j = 0; j < array_length(currentdir.CONTENT); j++)
			{
				var file = currentdir.CONTENT[j];
				var filename = string_lower(file.NAME);
					
				var pos = string_pos(".", filename);
				if pos != 0
					filename = string_copy(filename, 1, string_pos(".", filename) - 1);
					
				if file.TYPE == 0 && filename == string_lower(args[0])
				{
					if is_method(file.FUNC)
					{
						input_mode = 0;
						file.FUNC();
					}
					emptyhanded = false;
				}
			}
				
			if emptyhanded
			{
				output += lstr("msdos_bad"); // Bad command or file name
				output += "\n";
				DOS_instruct(3, DOS_initstate2);
			}
			break;
			
		#endregion
		#region CLS
			
		case "cls":
			output = "";
			DOS_instruct(3, DOS_initstate2);
			break;
			
		#endregion
		#region CD
			
		case "cd":
		case "chdir":
			var revert = currentdir;
			if array_length(args) == 1
				output += revert.ROOTNAME + "\n";
			else
			{
				for(var i = 1; i < array_length(args); i++)
				{
					var cur = args[i], last = i == array_length(args) - 1;
					if cur == "." && !last && args[i + 1] == "."
					{
						if currentdir.DIR == -1
						{
							output += lstr("msdos_invalid");
							output += "\n";
							currentdir = revert;
							break;
						}
						else
							currentdir = currentdir.DIR;
						i++;
					}
					else if cur == "."
					{
						// do nothing
					}
					else
					{
						var emptyhanded = true;
						for(var j = 0; j < array_length(currentdir.CONTENT); j++)
						{
							var file = currentdir.CONTENT[j];
							if file.TYPE == 1 && string_upper(file.NAME) == string_upper(args[i])
							{
								currentdir = file;
								emptyhanded = false;
							}
						}
						
						if emptyhanded
						{
							output += lstr("msdos_invalid");
							output += "\n";
							currentdir = revert;
							break;
						}
					}
				}
			}
			DOS_instruct(3, DOS_initstate2);
			break;
			
		#endregion
		#region HELP
			
		case "help":
			DOS_instruct(15, function()
			{
				switch progression
				{
					default: output += lstr("msdos_help"); break;
					case 0: case 1: case 2: case 3: case 4: case 5:
					case 7: case 8: case 9: case 10:
						output += lstr(concat("msdos_help", progression));
						progression++;
						break;
					case 6:
					case 6.1:
						if currentdir.NAME == "1985"
						{
							output += lstr("msdos_help6");
							progression = 7;
						}
						else if currentdir.NAME != root.NAME
						{
							output += lstr("msdos_help90");
							progression = 6.1;
						}
						else
						{
							output += progression == 6 ? lstr("msdos_help91") : choose(lstr("msdos_help92"), lstr("msdos_help93"), lstr("msdos_help94"));
							progression = 6.1;
						}
						break;
					case 11:
						output += "marior";
						progression++;
						break;
					case 12:
						output += embed_value_string(lstr("msdos_help12"), ["marior"]);
						break;
				}
				output += "\n";
			});
			DOS_instruct(3, DOS_initstate2);
			break;
			
		#endregion
		#region ECHO
			
		case "echo":
			if array_length(args) == 2 && args[1] == "on"
				echo = true;
			else if array_length(args) == 2 && args[1] == "off"
				echo = false;
			else if array_length(args) > 1
			{
				for(var i = 1; i < array_length(args); i++)
					output += args[i] + " ";
				output += "\n";
			}
			else
				output += embed_value_string(lstr("msdos_echo"), [echo ? lstr("msdos_on") : lstr("msdos_off")]) + "\n";
			DOS_instruct(3, DOS_initstate2);
			break;
			
		#endregion
		#region CALL
			
		case "call":
			DOS_command(DOS_allargs(args, IN));
			break;
			
		#endregion
		#region EXIT
			
		case "exit":
			output += "\n";
			DOS_instruct(50, function()
			{
				queued_exit = true;
			});
			break;
			
		#endregion
		#region MKDIR
			
		case "mkdir":
		case "md":
			if array_length(args) == 1
			{
				output += lstr("msdos_short");
				output += "\n";
			}
			else
			{
				var emptyhanded = true;
				for(var j = 0; j < array_length(currentdir.CONTENT); j++)
				{
					var allargs = string_upper(DOS_allargs(args, IN));
						
					var file = currentdir.CONTENT[j];
					if file.TYPE == 1 && (file.NAME == allargs or file.ROOTNAME == allargs)
					{
						emptyhanded = false;
						break;
					}
				}
					
				if emptyhanded
				{
					var dir = DOS_directory(string_upper(DOS_allargs(args, IN)));
					dir.DATE = date_current_datetime();
					DOS_adddir(dir, currentdir);
				}
				else
				{
					output += lstr("msdos_exists");
					output += "\n";
				}
			}
			DOS_instruct(3, DOS_initstate2);
			break;
			
		#endregion
		#region RMDIR
			
		case "rmdir":
			if array_length(args) == 1
			{
				output += lstr("msdos_short");
				output += "\n";
			}
			else
			{
				var revert = currentdir;
					
				var emptyhanded = true;
				for(var j = 0; j < array_length(currentdir.CONTENT); j++)
				{
					var allargs = string_upper(DOS_allargs(args, IN));
						
					var file = currentdir.CONTENT[j];
					if file.TYPE == 1 && (file.NAME == allargs or file.ROOTNAME == allargs)
					{
						currentdir = file;
						emptyhanded = false;
					}
				}
				if !emptyhanded && array_length(currentdir.CONTENT) == 0
					currentdir.TYPE = -1; // mark as deleted
				else
				{
					output += lstr("msdos_invalid2");
					output += "\n";
				}
				currentdir = revert;
			}
			DOS_instruct(3, DOS_initstate2);
			break;
			
		#endregion
		#region DIR
			
		case "dir":
			output += $"\n " + embed_value_string(lstr("msdos_directory"), [currentdir.ROOTNAME]) + "\n\n";
                
			var bytes = 0;
			for(var i = 0; i < array_length(currentdir.CONTENT); i++)
			{
				var this = currentdir.CONTENT[i];
				if this.TYPE == -1
					continue;
				
                output += DOS_paddedstring(string_upper(this.NAME), 8, false);
					
				var filetype = "";
				switch this.TYPE
				{
					case 0:
						filetype = "EXE";
						break;
				}
					
				output += " ";
                output += DOS_paddedstring(filetype, 3, false);
					
				if this.TYPE == 1
				{
					output += " ";
	                output += DOS_paddedstring(lstr("msdos_type_dir"), 13, false);
				}
				else
				{
					output += " ";
	                output += DOS_paddedstring(DOS_dottednumber(this.SIZE), 13, true);
					bytes += this.SIZE;
				}
					
				var day = date_get_day(this.DATE);
				var month = date_get_month(this.DATE);
				var year = date_get_year(this.DATE);
					
				output += " ";
				if day < 10
					output += "0";
	            output += string(day);
	            output += "/";
				if month < 10
					output += "0";
	            output += string(month);
				output += "/";
	            output += string_copy(year, string_length(year) - 1, 2);
					
				var hour = date_get_hour(this.DATE);
				var minute = date_get_minute(this.DATE);
				if minute < 10
					minute = "0" + string(minute);
					
	            output += " ";
				output += DOS_paddedstring($"{hour}:{minute}", 7, true);
					
				output += "\n";
			}
				
			output += " ";
			output += DOS_paddedstring(string(array_length(currentdir.CONTENT)), 8, true);
			output += $" {lstr("msdos_files")} ";
				
			output += " ";
			output += DOS_paddedstring(DOS_dottednumber(bytes), 13, true);
			output += " bytes ";
				
			output += "\n";
			output += DOS_paddedstring(DOS_dottednumber(space_available), 32, true);
			output += $" {embed_value_string(lstr("msdos_free"), ["bytes"])} ";
				
			output += "\n";
			DOS_instruct(3, DOS_initstate2);
			break;
			
		#endregion
		#region UNSUPPORTED
			
		case "move":
		case "del":
		case "ren":
			output += lstr("msdos_ominous");
			output += "\n";
			DOS_instruct(3, DOS_initstate2);
			break;
			
		#endregion
	}
}
DOS_directory = function(name)
{
	return {TYPE: 1, NAME: name, CONTENT: [], DIR: -1, ROOTNAME: name, DATE: 0};
}
DOS_adddir = function(file, dir)
{
	if string_ends_with(dir.ROOTNAME, "\\")
		file.ROOTNAME = $"{dir.ROOTNAME}{file.ROOTNAME}";
	else
		file.ROOTNAME = $"{dir.ROOTNAME}\\{file.ROOTNAME}";
	file.DIR = dir;
	array_push(dir.CONTENT, file);
}
DOS_file = function(dir, name, func)
{
	var file = {TYPE: 0, NAME: name, FUNC: func,
		DATE: 0, SIZE: 0};
	array_push(dir.CONTENT, file);
	return file;
}

#endregion

DOS_instruct(50, function() {output = lstr("msdos_start1")});
DOS_instruct(100, function() {output += "\n"; output += embed_value_string(lstr("msdos_start2"), ["help"])});
DOS_instruct(10, DOS_initstate);

#region FOLDER STRUCTURE

var date = date_create_datetime(1985, 8, 13, 6, 22, 0);
space_available = 23_061_996;

root = DOS_directory("M:\\");
root.DATE = date;

var folder = DOS_directory("1985");
folder.DATE = date;
DOS_adddir(folder, root);

var mario = DOS_file(folder, "marior", function()
{
	allow_break = false;
	output = "";
	
	var lag = 3;
	DOS_instruct(lag, function() {output += "@@@@@@@@@@&&&@@@@@@@@@@@@@@%%%%#&%%%%##(((#%%%%%&%%%%%@@@@@@@@@@@@@@@&@@&@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@&&&@@@@@@@@@@@@@@%%%&((###############((%%%%@@@@@@@@@@@@@@@&@@&@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@&&&@@@@@@@@@@@@@@#(#######..	, *%######(%@@@@@@@@@@@@@@@&@@&@@@&@@@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@&&&@@@@@@@@@@@@/(#######. ,(#(/(#(...%%%%%####@@@@@@@@@@@@@&@@&@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@&&@&&&&&&&&&&/(########/./##  % .##*.%%%%%%%%##%@@@@@@@@@@@&@@&@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@&&&&&&&&&&&&(######%%%%%/.%.....,,%.%%%%%%%%%%%#(&&&&&&&&&&&@@&@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@&&&&&&&&&&&(#####%%%%%##((#############%%%%%%%%%#(&&&&&&&&&&&@&@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@%%%%%%%%%%%(####%%#%%%%%%%%%%%%%%%%%%%%%%%%%#&%%%%#(%%%%%%%%%%&&@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@%%%%%%%%%%#(##%#%%%%&@@@@@%/////////@@@@@@%%%%%#%%##%%%%%%%%%%%@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@%%%%%%%%%%(###%%%((/@*|***#@*******@|**//(@/((&%%%%#%%%%%%%%%%%@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@&&&&&&&&&&&(#%%#,,***/,..#%#,,,,,**%%#,*/|****%&&%%(%%%%%%%%%%&@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@@@@ ..,##,...,  %/# %*..,,,#% %//,*****&&%|**(&&&&&&&&&&@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@###########.***,##%....  #(%&*.......(%&|*,*,,*,&&#**///##########@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@&##########,,,**#% ....... ............,,,,,,*,,/&%(**/#%%%%%%%%%%@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@&&&&&&&&&&&..,.&../%%&@#,..........,,,,,*%&&&&**/#/|**&&&&&&&&&&&@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@@@@@,.....*&&&%%%*,,,,,,,,,,,**&@@&&&@**.***#@@@@@@@@@@@@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@@@@@@%#* .,,**&&&&&(*********&@@@@&*****.*%&@@@@@@@@@@@@@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@@@@@@%#&&.,,,,,,*/,%&@@@@@@@@(/(*******,&&&&@@@@@@@@@@@@@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@@@@@@@@@@@@**,,,,..,,,,,*************/&@@@@@@@@@@@@@@@@@@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@@@@@@&%%%%#%(&&|**,,,...,********(&%#%%%%%%&@@@@@@@@@@@@@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@@@@@@&%(########%@&&(***////#&&&&&%%%%%%%%%&@@@@@@@@@@@@@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@@@@@&############&#####%%&&&&&&&%%%%%%%%%%%#@@@@@@@@@@@@@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@@@%#######%######&############%%%%&%%%%%%%%%%%@@@@@@@@@@@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@@@@@########%%#.....(%##############....,(%&&&%%%%%%@@@@@@@@@@@@&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@&&&&&&&&&&%######%%%%(#....*#%##############%.,,,*%#&&&&%%%%%#&&&&&&&&&&&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@@@@@%######%%%%%(#####%&(################&##%%%%%&&&&%%##%%#@@@@@@@@@@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@@@@#%&#######%%%&@#(###############################%%&&&%%###%%%(@#%@@@@@@@\n";});
	DOS_instruct(lag, function() {output += "&&&&&&&@	  ##%%%&&@########################%%%%#%#####%&@&%%%##*	. @&&&&&&@@@\n";});
	DOS_instruct(lag, function() {output += "@@@@@%,	  ...,&&&&&##############################%%%%%%%@&%%(		  (&@&@@@@@@\n";});
	DOS_instruct(lag, function() {output += "@@@&		 ..,*/(@&&#######################%%%%%%%%%%%%%#&&@...		  .*#@@@\n";});
	DOS_instruct(lag, function() {output += "&&		 .....,(%&&&#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&@/.			..,&@@@@\n";});
	DOS_instruct(lag, function() {output += "%		 .......*%&%%%#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#%%&&,			 .../@@@\n";});
	DOS_instruct(lag, function() {output += "*	   ...*//,..,(&&%%(##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#%%##.  .*/,.	....,,@@\n";});
	DOS_instruct(lag, function() {output += "@ .........*/.,..,/%%&%#######%%%%%&%%%%%%%%%&%%%%%%%%%%%%&&#%...,	  ..**,***@@\n";});
	DOS_instruct(lag, function() {output += "@@@,,..,...,,//.**@@%%(#########%%%%&&&%%&&&&%%%%######%%%#&&@@,,*/. ...*|***(@@\n";});
	DOS_instruct(lag, function() {output += "&&&&&%(,**(%%%(###@%%%###########%%%&&%&&&&&%##########%%%%&&%@%###%%%|***(%&@@@\n";});
	DOS_instruct(lag, function() {output += "&&&&&%%%%%%%%%(##%%%%(###########%%%&&%&%%%%############%%%%%%%&###%%%%#%%%%&@@@\n";});
	DOS_instruct(lag, function() {output += "&&&&&%%%%%%%%%(%%%%%%(##########%%%%&%%%%%%%############%%%#&&&&&&#%%%%#%%%%&@@@\n";});
	DOS_instruct(lag, function() {output += "&@&&&%%%%%%%%%%%%%%%############%%%%&%&&%%%##############%%%%%%%%%%%%%%#%%%%&@&@\n";});
	DOS_instruct(lag, function() {output += "&@&@@#%%%%&&&&&&&&&&(##########%%%%%%&&&&&&%#############%%%#&&&&&&&&&%#%%%%@@%@\n";});
	DOS_instruct(lag, function() {output += "&@&@@@@@@&&&&&&&&&&############%%%%%%&&&%%%%##############%%#&&&&&&&&&&%@@@@@@%@\n";});
	DOS_instruct(lag, function() {output += "&@&@@@@@%%%%%%%%%%&(##########%%%%%%&&&&%%%%###############%%#&&&&&&&&&&&@@@@@%@\n";});
	DOS_instruct(lag, function() {output += "&@&@@@@@@@@@@@&@@@############%%%%%%&&&&&&&&&###############%%&@@@&@@@@@@@@@@@%@\n";});
	DOS_instruct(lag, function() {output += "&@&@@@@@@@@@@@&%(*//((###%%###%%%%%%&&&&&&&&&#########%###(((/|*%%&@@@@@@@@@@@%@\n";});
	DOS_instruct(lag, function() {output += "&@&@@@@@@@@@@(////////(((####%%%%%%%%%%%&&&&#####%#((((((///////(/(&@@@@@@@@@@%@\n";});
	DOS_instruct(lag, function() {output += "&@&&&&&&&&&&////|****/((((###%%%%%%#%%%%%%%%%((((((((((|***////(((((%&&&&&&&&&&@\n";});
	DOS_instruct(lag, function() {output += "&&&&&&&&&&&&/(((((///(((((####%####(&&&&&&&&&((((((((((((//(((((((##(%%%%%%%%%%&\n";});
	DOS_instruct(lag, function() {output += "&@&&&&&&&&&&#((((((((#######%#####/////////////####((((((((((#######&&&&&&&&&&&@\n";});
	DOS_instruct(lag, function() {output += "&@@#((((((((((/#%%%%%%%%%%%#(((&%%&&&&&&@@@@@@%%%#,*/#%%%%%%%%%%%#/((((((((((%@@\n";});
	repeat 10
		DOS_instruct(lag, function() {output += "\n";});
	DOS_instruct(lag, function() {output = "";});
	DOS_instruct(100, function()
	{
		notification_push(notifs.msdos_marior, []);
		output = lstr("msdos_congratulation");
		output += "\n";
	});
	DOS_instruct(100, function() {output += lstr("msdos_pause"); output += "\n"; input_mode = 2;});
});
mario.SIZE = 64;
mario.DATE = date;

trace(root);

#endregion

currentdir = root;
progression = 0;

with obj_shell
	WC_bindsenabled = false;
