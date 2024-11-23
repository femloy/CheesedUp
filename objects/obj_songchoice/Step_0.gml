live_auto_call;
event_inherited();

if move_ver != 0
{
	var length = array_length(sections[sel.game].songs) - 1;
	
	scroll = -50;
	sel.song += move_ver;
	sel.song = wrap(sel.song, 0, length);
	
	while !is_array(sections[sel.game].songs[sel.song])
	{
		sel.song += move_ver;
		sel.song = wrap(sel.song, 0, length);
	}
	
	charshift[1] = move_ver * 50;
	charshift[2] = 0;
	sound_play(sfx_step);
}
if move_hor != 0
{
	var selprev = sel.game;
	sel.game = clamp(sel.game + move_hor, 0, array_length(sections) - 1);
	
	if sel.game != selprev
	{
		if global.jukebox != noone && global.jukebox.sel.game == sel.game
			sel.song = global.jukebox.sel.song;
		else
			sel.song = 0;
		
		charshift[0] = move_hor * 25;
		charshift[2] = 0;
		sound_play(sfx_angelmove);
	}
}
charshift[0] = lerp(charshift[0], 0, 0.25);
charshift[1] = lerp(charshift[1], 0, 0.25);
charshift[2] = lerp(charshift[2], 1, 0.25);

var alt = noone;
var song_real = sections[sel.game].songs[sel.song];
var song = song_real;

if !is_string(song[0])
{
	alt = song[0];
	song = song[alt];
}

if key_jump
{
	image_index = 8;
	xo = 10;
	
	if !dumbass && (global.option_music_volume == 0 or global.option_master_volume == 0)
	{
		dumbass = true;
		create_transformation_tip(lstr("songchoicetip"));
	}
	
	if global.jukebox != noone
	{
		fmod_event_instance_stop(global.jukebox.instance, true);
		fmod_event_instance_release(global.jukebox.instance);
		
		if song[0] != global.jukebox.name
			global.jukebox = noone;
	}
	if global.jukebox == noone
	{
		var inst = fmod_event_create_instance(song[0]);
		if inst != noone
		{
			fmod_event_instance_play(inst);
		
			global.jukebox = {
				instance: inst,
				name: song[0],
				sel: {song: sel.song, game: sel.game, alt: alt},
				name_pause: song[1]
			};
		}
		else
			show_message(concat("Event ", song[0], " does not exist"));
	}
	else
		global.jukebox = noone;
}
xo = lerp(xo, 0, 0.25);

if alt != noone && array_length(song_real) > 2
{
	create_transformation_tip(lstr("secretstyletip"), "secretstyletip");
	if key_taunt2
	{
		var prev = song_real[0];
		if ++song_real[0] >= array_length(song_real)
			song_real[0] = 1;
		
		if song_real[0] != prev
		{
			image_index = 8;
			xo = 10;
			sound_play_centered(sfx_stompenemy);
			discanim = 1;
		}
	}
}
discanim = Approach(discanim, 0, .1);
