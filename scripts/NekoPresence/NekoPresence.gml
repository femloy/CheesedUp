function np_get_avatar_url(user_id, avatar_hash)
{
	if (!is_string(user_id) || !is_string(avatar_hash) || !string_length(user_id) || !string_length(avatar_hash)) return "";
	return "https://cdn.discordapp.com/avatars/" + user_id + "/" + avatar_hash + ".png";
}
