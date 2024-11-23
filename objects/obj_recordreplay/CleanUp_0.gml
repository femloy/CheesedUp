live_auto_call;

var file = get_save_filename("Replay|*.bin", "data.bin")
if file != ""
	buffer_save(buffer, file);

buffer_delete(buffer);
