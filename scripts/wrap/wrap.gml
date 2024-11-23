function wrap(_val, _min, _max)
{
	if frac(_val) == 0
	{
		while _val > _max || _val < _min
		{
			if _val > _max
				_val = ((_min + _val) - _max) - 1
			else if _val < _min
				_val = ((_max + _val) - _min) + 1
		}
		return _val;
	}
	else
	{
		var _old = _val + 1
		while _val != _old
		{
			_old = _val
			if _val < _min
				_val = _max - (_min - _val)
			else if _val > _max
				_val = _min + (_val - _max)
		}
		return _val;
	}
}
