function vertex_build_quad(_buffer, _x, _y, _width, _height, _color, _alpha, _u, _v, _p, _q)
{
	vertex_build_point(_buffer, _x         , _y          , _color, _alpha, _u     , _v); // 0
	vertex_build_point(_buffer, _x + _width, _y          , _color, _alpha, _u + _p, _v); // 1
	vertex_build_point(_buffer, _x         , _y + _height, _color, _alpha, _u     , _v + _q); // 2
	
	vertex_build_point(_buffer, _x + _width, _y          , _color, _alpha, _u + _p, _v); // 1
	vertex_build_point(_buffer, _x + _width, _y + _height, _color, _alpha, _u + _p, _v + _q); // 3
	vertex_build_point(_buffer, _x         , _y + _height, _color, _alpha, _u     , _v + _q); // 2
}
