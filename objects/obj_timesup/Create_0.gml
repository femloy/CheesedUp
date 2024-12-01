live_auto_call;

init_collision();
grav = 0;
image_speed = 0;
alarm[0] = 40;
global.panic = false;
alarm[1] = 600;

global.combo = 0;
global.comboscore = 0;

instance_destroy(obj_comboend);
instance_destroy(obj_snickexe);

if REMIX
	instance_destroy(obj_lap2visual);

if global.modifier_failed or (DEATH_MODE && MOD.DeathMode)
	sprite_index = spr_modfailed;
if SUGARY_SPIRE && check_sugary()
	sprite_index = spr_timesup_ss;

snd = fmod_event_create_instance("event:/music/timesup");
fmod_event_instance_play(snd);

do_wait = global.sandbox && global.leveltorestart != noone;
wait = room_speed;
wait_fade = 0;

if do_wait
{
	draw_set_font(lfnt("creditsfont"));
	tip1 = scr_compile_icon_text(is_struct(global.checkpoint_data) ? lstr("deathcheckpoint") : lstr("deathrestart"), 1, true);
	tip2 = scr_compile_icon_text(lstr("deathexit"), 1, true);
}
