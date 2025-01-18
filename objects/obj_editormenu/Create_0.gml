live_auto_call;

spawned_in = false;
if room != editor_entrance
{
	spawned_in = true;
	instance_destroy(id, false);
	exit;
}

// prep
with obj_player1
{
	if cyop_backtohubroom == noone
	{
		cyop_backtohubroom = backtohubroom;
		cyop_backtohubx = backtohubstartx;
		cyop_backtohuby = backtohubstarty;
	}
	else
	{
		backtohubroom = cyop_backtohubroom;
		backtohubstartx = cyop_backtohubx;
		backtohubstarty = cyop_backtohuby;
	}
	if is_string(backtohubroom) or backtohubroom == editor_entrance
		backtohubroom = tower_extra2;
	state = states.titlescreen;
	
	x = -1000;
	y = room_height / 2;
}
global.leveltorestart = noone;

// lists
towers = [];

root_folder = concat(environment_get_variable("APPDATA"), "\\PizzaTower_GM2");
towers_folder = concat(root_folder, "\\towers");

add_tower = function(ini, fresh = false)
{
	ini_open(ini);
	
	var type = ini_read_real("properties", "type", 0);
	var mainlevel = ini_read_string("properties", "mainlevel", "");
	var name = ini_read_string("properties", "name", type ? lstr("cyop_unnamed_level") : lstr("cyop_unnamed_tower"));
	
	var struct = {
		type: type, name: name, file: ini,
		collect: 0, secrets: 0, treasure: false, rank: "", toppin: [0, 0, 0, 0, 0],
		corrupt: false, fresh: fresh
	};
	
	if !file_exists($"{filename_dir(ini)}\\levels\\{mainlevel}\\level.ini")
		struct.corrupt = 1;
	if !(type == 0 or type == 1)
		struct.corrupt = 2;
	
	ini_close();
	
	// read savefile for single levels
	if type == 1
	{
		ini_open($"{get_save_folder()}\\custom{global.currentsavefile}\\{filename_name(filename_dir(ini))}.ini");
		struct.collect = ini_read_real("Highscore", mainlevel, 0);
		struct.treasure = ini_read_real("Treasure", mainlevel, false);
		struct.toppin = [
			ini_read_real("Toppin", mainlevel + "1", false),
			ini_read_real("Toppin", mainlevel + "2", false),
			ini_read_real("Toppin", mainlevel + "3", false),
			ini_read_real("Toppin", mainlevel + "4", false),
			ini_read_real("Toppin", mainlevel + "5", false)
		];
		struct.secrets = ini_read_real("Secret", mainlevel, 0);
		struct.rank = ini_read_string("Ranks", mainlevel, "");
		ini_close();
	}
	
	// add to towers
	array_push(towers, struct);
}
refresh_list = function()
{
	towers = [];
	has_pizzatower = find_files_recursive(towers_folder, function(file)
	{
		if filename_name(filename_dir(file)) != "towers"
		{
			add_tower(file);
			return true;
		}
	}, ".tower.ini");
}
refresh_list();

sel =
{
	x: 0,
	y: 0
};
cam =
{
	x: 0,
	y: 0
};
textscroll = 0;
movehold = -1;
state = 0;
menu = 0;
delete_time = 0;
reset_music = false;

list_search = "";
filtered_towers = [];
refresh_list_search = function()
{
	filtered_towers = [];
	for(var i = 0, n = array_length(towers); i < n; ++i)
	{
		if string_pos(string_lower(list_search), string_lower(towers[i].name))
			array_push(filtered_towers, towers[i]);
	}
}
refresh_list_search();

smooth_buffer = 2;
scr_init_input();
pto_textbox_init();

controls =
{
	text: "",
	text_prev: "",
	compiled: noone
};
fader = 1;

shake = 0;

// remote
enum gb_sort
{
	None,
	MostDownloaded,
	MostLiked,
	MostViewed,
	Oldest,
	LatestModified
}
enum gb_filter
{
	None,
	Featured,
	WIP
}

remote_towers = [];
page = 1;
sort_by = 0;
filter = 0;
last_page = false;
request = noone;
scroll = 0;
search = "";

downloads = [];
download_count = 0;
download_choices = [];
downloads_scroll = 0;

fetch_remote_towers = function(page = 1)
{
	if download_count > 0
	{
		message_show("There are pending downloads!");
		exit;
	}
	
	scroll = 0;
	image_cleanup();
	
	var count = 18;
	remote_towers = [];
	downloads = array_create(count, noone);
	
	menu = 1;
	state = 0;
	
	var url = $"https://gamebanana.com/apiv11/{filter == gb_filter.WIP ? "Wip" : "Mod"}/Index?_nPerpage={count}&_aFilters[Generic_Category]={filter == gb_filter.WIP ? "1932" : "22962"}";
	url += $"&_nPage={page}";
	
	switch filter
	{
		case gb_filter.Featured:
			url += "&_aFilters[Generic_WasFeatured]=true";
			break;
		/*case gb_filter.WIP:
			url += "&_aFilters[Generic_HasWip]=true";
			break;*/
	}
	switch sort_by
	{
		case gb_sort.MostDownloaded:
			url += "&_sSort=Generic_MostDownloaded";
			break;
		case gb_sort.MostLiked:
			url += "&_sSort=Generic_MostLiked";
			break;
		case gb_sort.MostViewed:
			url += "&_sSort=Generic_MostViewed";
			break;
		case gb_sort.Oldest:
			url += "&_sSort=Generic_Oldest";
			break;
		case gb_sort.LatestModified:
			url += "&_sSort=LatestModified";
			break;
	}
	if search != ""
	{
		var url_search = url_encode(search);
		url += $"&_aFilters[Generic_Name]=contains%2C{url_search}";
	}
	
	trace(url);
	request = http_get(url);
}
fetch_tower_image = function(index)
{
	if sprite_exists(remote_towers[index].image)
		exit;
	
	var url = remote_towers[index].imagelink;
	remote_towers[index].image = sprite_add(url, 0, false, false, 0, 0);
}
fetch_tower_download = function(index)
{
	if menu != 1
		exit;
	
	download_choices = [];
	if downloads[index] == noone
	{
		var this = remote_towers[index];
		var url = $"https://gamebanana.com/apiv11/{filter == gb_filter.WIP ? "Wip" : "Mod"}/{this.modid}/Files";
		
		download_count++;
		downloads[index] = {
			state: 0,
			request: http_get(url),
			file: noone,
			progress: 0
		}
		
		state = 3;
	}
}
image_cleanup = function()
{
	for(var i = 0; i < array_length(remote_towers); i++)
	{
		if remote_towers[i].image != noone
		{
			trace($"Deleted image for tower {remote_towers[i].modid}");
			sprite_delete(remote_towers[i].image);
		}
	}
}
done_download = function(i)
{
	state = 1;
	downloads[i] = noone;
	download_count--;
}

with obj_shell
	WC_bindsenabled = false;

// switch savefiles
if global.in_cyop
{
	gamesave_async_save();
	with instance_create(0, 0, obj_loadingscreen)
		cyop_changesave = 2;
}
