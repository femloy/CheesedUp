live_auto_call;

if menu != 1
	exit;

// downloads
for(var i = 0; i < array_length(downloads) && i < array_length(remote_towers); i++)
{
	var this = downloads[i], tower = remote_towers[i];
	if downloads[i] == noone
		continue;
	if async_load[? "id"] != this.request
		continue;
	
	// got download list
	if this.state == 0
	{
		if !is_string(async_load[? "result"])
		{
			message_show(lstr("cyop_error_generic"));
			done_download(i);
			exit;
		}
		
		var data = json_parse(async_load[? "result"], undefined, false);
		if !is_array(data) or array_length(data) == 0
		{
			tower.corrupt = true;
			message_show(lstr("cyop_error_empty"));
			done_download(i);
			exit;
		}
		
		download_choices = data;
		array_sort(download_choices, function(elm1, elm2)
		{
			// latest uploads first
			return (elm1._tsDateAdded < elm2._tsDateAdded) && string_ends_with(elm1._sFile, ".zip");
		});
		
		/*
		array_sort(data, function(elm1, elm2)
		{
			// latest uploads first
			return (elm1._tsDateAdded < elm2._tsDateAdded) && string_ends_with(elm1._sFile, ".zip");
		});
		
		this.file = data[0];
		//show_message(this.file);
			
		if !string_ends_with(this.file._sFile, ".zip")
		{
			tower.corrupt = true;
			if string_ends_with(this.file._sFile, ".rar")
				message_show(lstr("cyop_error_rar"));
			else if string_ends_with(this.file._sFile, ".json")
				message_show(lstr("cyop_error_json"));
			else
				message_show(embed_value_string(lstr("cyop_error_nonzip"), [filename_ext(this.file._sFile)]));
			done_download(i);
			exit;
		}
			
		this.file.path = $"{towers_folder}\\temp_{tower.modid}\\download.zip";
		this.request = http_get_file(this.file._sDownloadUrl, this.file.path);
		this.state = 1;
		*/
	}
		
	// download progress
	else if this.state == 1
	{
		if async_load[? "status"] == 0
		{
			// finished downloading
			this.file.path = async_load[? "result"];
			
			var buffer = buffer_load(this.file.path);
			var file = buffer_read(buffer, buffer_string);
			
			if string_starts_with(file, "<html>")
			{
				folder_destroy(filename_dir(this.file.path));
				message_show(lstr("cyop_error_generic"));
				done_download(i);
			}
			else
			{
				this.request = zip_unzip_async(this.file.path, filename_dir(this.file.path));
				this.state = 2;
				this.progress = 1;
			}
		}
		else if async_load[? "status"] == 1
		{
			this.progress = async_load[? "sizeDownloaded"] / async_load[? "contentLength"];
			trace("Download: ", this.progress * 100, "%");
		}
		else
		{
			message_show(lstr("cyop_error_generic"));
			done_download(i);
		}
	}
	exit;
}

// listing
if async_load[? "status"] != 0
	exit;
if async_load[? "id"] != request
	exit;

if state == 0
{
	sel.y = -1;
	
	var data = json_parse(async_load[? "result"], undefined, false);
	if !variable_struct_exists(data, "_aRecords") or array_length(data._aRecords) == 0
	{
		message_show(search == "" ? lstr("cyop_error_page") : lstr("cyop_error_search"));
		state = 1;
		exit;
	}
	last_page = data._aMetadata._bIsComplete;
	
	for(var i = 0; i < array_length(data._aRecords); i++)
	{
		var this = data._aRecords[i];
		
		var likes = 0, posts = 0, views = 0;
		if variable_struct_exists(this, "_nLikeCount")
			likes = this._nLikeCount;
		if variable_struct_exists(this, "_nPostCount")
			posts = this._nPostCount;
		if variable_struct_exists(this, "_nViewCount")
			views = this._nViewCount;
		
		var name = this._sName;
		/*
		if string_pos("cyop", string_lower(name)) != 0
		{
			name = string_replace(name, "(cyop)", "");
			name = string_replace(name, "(CYOP)", "");
			name = string_replace(name, "(Cyop)", "");
			name = string_replace(name, "[CYOP]", "");
			name = string_replace(name, "(CYOP Level)", "");
			name = string_replace(name, "(CYOP level)", "");
			name = string_replace(name, "(CYOP Tower)", "");
			name = string_replace(name, "(CYOP tower)", "");
			name = string_replace(name, "CYOP, ", "");
			name = string_replace(name, "CYOP: ", "");
		}
		*/
		name = string_trim(name, [" "]);
		
		var downloaded = false;
		if directory_exists(concat(towers_folder, "\\", (filter == gb_filter.WIP ? "WIP-" : ""), this._idRow, "\\levels"))
			downloaded = true;
		
		var base_image = this._aPreviewMedia._aImages[0];
		var struct = {
			name: name,
			imagelink: base_image._sBaseUrl + "/" + base_image._sFile530,
			author: this._aSubmitter._sName,
			image: noone,
			image_loaded: false, // TODO https://manual.gamemaker.io/monthly/en/The_Asset_Editors/Object_Properties/Async_Events/Image_Loaded.htm
			modid: this._idRow,
			url: this._sProfileUrl,
			likes: likes,
			posts: posts,
			views: views,
			downloaded: downloaded,
			corrupt: false
		}
		
		array_push(remote_towers, struct);
		fetch_tower_image(array_length(remote_towers) - 1);
	}
	
	// done
	state = 1;
}
