ds_list_destroy(transformation);
ds_list_destroy(hitlist);
ds_list_destroy(animlist);

ds_list_destroy(global.saveroom);
ds_list_destroy(global.escaperoom);
ds_list_destroy(global.instancelist);
ds_list_destroy(global.followerlist);
ds_list_destroy(global.baddieroom);

player_destroy_sounds();

destroy_sounds([
	global.snd_escaperumble,
	global.snd_johndead,
	global.snd_fakesanta,
	global.snd_rankup,
	global.snd_pizzafacemoving,
	global.snd_rankdown,
	global.snd_breakblock,
	global.snd_bellcollect,
	global.snd_cardflip,
	global.snd_explosion,
	global.snd_cheesejump,
	global.snd_ventilator,
	global.snd_trashjump1,
	global.snd_thunder,
	global.snd_captaingoblinshoot,
	global.snd_golfjingle,
	global.snd_mrstickhat,
	global.snd_alarm,
	global.snd_slidersfx,
	global.snd_slidermusic,
	global.snd_slidermaster,
	global.snd_bossbeaten
]);
