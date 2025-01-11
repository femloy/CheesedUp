function seq_afterimages_uppersnd()
{
	sound_play_centered(sfx_uppercut);
}
function seq_afterimages_landsnd()
{
	sound_play_centered(sfx_playerstep);
}
function seq_secretwall_sound()
{
	// very annoying actually so dont do that
	
	//if REMIX
	//	sound_play(global.snd_secretwall);
}
function seq_kungfu_sound()
{
	sound_play_centered("event:/modded/sfx/kungfu");
}
function seq_grab_sound()
{
	sound_play_centered(sfx_suplexdash);
}
function seq_grab_stop()
{
	sound_stop(sfx_suplexdash, true);
}
function seq_punch_sound()
{
	sound_play_centered(sfx_punch);
}
function seq_kill_sound()
{
	sound_play_centered(sfx_killenemy);
}
function seq_killingblow_sound()
{
	sound_play_centered(sfx_punch);
	sound_play_centered(sfx_killingblow);
}
function seq_dive_sound()
{
	sound_play_centered("event:/sfx/pep/dive");
}
function seq_step_sound()
{
	sound_play_centered(sfx_playerstep);
}
function seq_jump_sound()
{
	sound_play_centered(sfx_jump);
}
function seq_groundpound_sound()
{
	seq_stop_freefall_sound();
	sound_play_centered(sfx_groundpound);
}

global.seq_freefallsnd = undefined;
function seq_freefall_sound()
{
	if global.seq_freefallsnd == undefined
		global.seq_freefallsnd = fmod_event_create_instance(sfx_freefall);
	sound_play_centered(global.seq_freefallsnd);
}
function seq_stop_freefall_sound()
{
	if global.seq_freefallsnd != undefined
	{
		destroy_sounds([global.seq_freefallsnd]);
		global.seq_freefallsnd = undefined;
	}
}
