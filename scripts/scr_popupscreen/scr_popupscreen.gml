function popup_net_reconnect(on_open, on_close)
{
	//var normally_paused = (instance_exists(obj_pause) && obj_pause.pause);
	with obj_popupscreen
	{
		if type == 0
		{
			on_open();
			exit;
		}
	}
	with instance_create(0, 0, obj_popupscreen, { pause: true })
	{
		type = 0;
		self.on_open = on_open;
		self.on_close = on_close;
	}
}

function popup_net_login(on_open, on_close)
{
	//var normally_paused = (instance_exists(obj_pause) && obj_pause.pause);
	with obj_popupscreen
	{
		if type == 1
		{
			on_open();
			exit;
		}
	}
	with instance_create(0, 0, obj_popupscreen, { pause: true })
	{
		type = 1;
		self.on_open = on_open;
		self.on_close = on_close;
	}
}
