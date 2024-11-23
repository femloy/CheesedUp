if (distance_to_object(obj_player1) < 50)
{
	var str = "message_file1";
	if obj_player1.state == states.bombdelete
		str = "message_file2";
	old_hud_message(embed_value_string(lstr(str), [other.file]), 2);
}
