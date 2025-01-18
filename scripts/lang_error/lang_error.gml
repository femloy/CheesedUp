function lang_error(str)
{
	with obj_langerror
	{
		array_push(text,
		{
			text: str,
			alpha: 5
		});
	}
}
