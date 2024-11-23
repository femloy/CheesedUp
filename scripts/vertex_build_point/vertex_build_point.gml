/// @desc Build a point vertex with a position, color, and texcoords, in that order
function vertex_build_point(_vertex_buffer, _x, _y, _color, _alpha, _u, _v)
{
	vertex_position(_vertex_buffer, _x, _y);
	vertex_color(_vertex_buffer, _color, _alpha);
	vertex_texcoord(_vertex_buffer, _u, _v);
}