/// @description zip extraction
live_auto_call;

if menu != 1
	exit;

for(var i = 0; i < array_length(downloads); i++)
{
	var this = downloads[i], tower = remote_towers[i];
	if this == noone
		continue;
	if async_load[? "id"] != downloads[i].request
		continue;
	
	file_delete(this.file.path);
	if async_load[? "status"] < 0
	{
		message_show(lstr("cyop_error_corrupt"));
		done_download(i);
		exit;
	}
	
	// attempt to find
	var target = filename_dir(this.file.path);
	
	_found = "";
	find_files_recursive(target, function(file)
	{
		_found = file;
		return true;
	}, ".tower.ini");
	
	if _found == ""
		message_show(lstr("cyop_error_mod"));
	else
	{
		var finaltarget = concat(towers_folder, "\\", (filter == gb_filter.WIP ? "WIP-" : ""), tower.modid);
		folder_destroy(finaltarget);
		
		if folder_move(filename_dir(_found), finaltarget) == 0
			message_show(lstr("cyop_error_wtf"));
		
		tower.downloaded = true;
		sound_play("event:/modded/sfx/downloaded");
		
		add_tower($"{finaltarget}\\{filename_name(_found)}", true);
	}
	folder_destroy(target); // using dll, deletes all files too
	done_download(i);
	
	break;
}
