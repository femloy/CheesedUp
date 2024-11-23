if array_length(sprites_to_unload) > 0
{
	text = embed_value_string(lstr("unloading_language"), [old_name]);
	
	sprite_delete(array_pop(sprites_to_unload));
	tex_cur++;
}
else if array_length(sprites_to_load) > 0
{
	text = embed_value_string(lstr("loading_language"), [new_name]);
	
	lang_sprite_parse(lang, root, array_pop(sprites_to_load));
	tex_cur++;
}
else
	instance_destroy();

global.lang = lang;
alarm[0] = 1;
