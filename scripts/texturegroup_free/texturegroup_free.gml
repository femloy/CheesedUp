function texturegroup_free(_texturegroup)
{
	trace($"Freeing Texturegroup: \"{_texturegroup}\"");
	
	var textures = texturegroup_get_textures(_texturegroup);
	for (var i = 0, n = array_length(textures); i < n; ++i)
		texture_flush(textures[i]);
	
	trace($"Finished freeing Texturegroup: \"{_texturegroup}\"");
}
