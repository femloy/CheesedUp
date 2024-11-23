/// @desc Build a point vertex with a position, color, and texcoords, in that order
function vertex_build_point3D(_vertex_buffer, _x, _y, _z, _color, _alpha, _u, _v)
{
	vertex_position_3d(_vertex_buffer, _x, _y, _z);
	vertex_color(_vertex_buffer, _color, _alpha);
	vertex_texcoord(_vertex_buffer, _u, _v);
}