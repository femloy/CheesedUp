instance_destroy(obj_pigtotal);
gameframe_caption_text = lstr("caption_mainmenu");
with (instance_create(0, 0, obj_loadingscreen))
{
	group_arr = ["menugroup", "baddiegroup"];
	offload_arr = ["introgroup"];
}
with (obj_player)
	state = states.titlescreen;
global.leveltorestart = noone;
global.leveltosave = noone;
global.startgate = false;
global.exitrank = false;

instance_destroy(obj_netclient);