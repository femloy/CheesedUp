/// @desc		Creates a vertex format for passing tilemap data to the GPU
/// @returns	{ID.Vertexformat}
function cyop_tilemap_create_vertex_format()
{
	vertex_format_begin();
	vertex_format_add_position_3d();
	vertex_format_add_color();
	vertex_format_add_texcoord();
	return vertex_format_end();
}
