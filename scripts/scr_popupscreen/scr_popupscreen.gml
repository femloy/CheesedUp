function popup_net_reconnect(callback)
{
	//var normally_paused = (instance_exists(obj_pause) && obj_pause.pause);
	with obj_popupscreen
	{
		if type == 0
		{
			callback();
			exit;
		}
	}
	with instance_create(0, 0, obj_popupscreen, { pause: true })
	{
		type = 0;
		self.callback = callback;
	}
}
