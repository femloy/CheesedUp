live_auto_call;

depth = -1000;

greendemon = false;
t = 0;
scr_sleep(200);

with obj_player
{
	instance_create(x, y, obj_bangeffect);
	sound_play_3d("event:/sfx/pep/hurt", x, y);
	fmod_event_instance_play(snd_voicehurt);
}
instance_destroy(obj_transfotip);
death = instance_create(0, 0, obj_bossplayerdeath);

instance_destroy(obj_hallway);
instance_destroy(obj_verticalhallway);
