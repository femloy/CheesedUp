live_auto_call;

var spr = async_load[? "id"];
for(var i = 0; i < array_length(remote_towers); i++)
{
	if remote_towers[i].image == spr
	{
		trace("Loaded image for tower \"", remote_towers[i].name, "\"");
		remote_towers[i].image_loaded = (async_load[? "status"] >= 0 ? 1 : -1);
		break;
	}
}
