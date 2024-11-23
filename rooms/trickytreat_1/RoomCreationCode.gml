pal_swap_init_system(shd_pal_swapper);
global.roommessage = "PIZZA TOWER AT HALLOWEEN";
gameframe_caption_text = lang_get_value("caption_halloween");
notification_push(notifs.trickytreat_enter, [room]);

var had_cosmic = MOD.CosmicClones;
reset_modifier();

if had_cosmic
{
	with obj_music
		event_perform(ev_other, ev_room_start);
}

ds_list_clear(global.saveroom);
ds_list_clear(global.baddieroom);
global.collect = 0;

with obj_pumpkincounter
{
	if counter <= 0
	{
		create_transformation_tip(lang_get_value("halloween"));
		old_hud_message(string_upper(lstr("halloween")));
	}
}

instance_destroy(obj_pumpkincounter);
if obj_player1.state == states.ghost
{
	trace("FUNNYROOM - Trickytreat");
	instance_create(0, 0, obj_softlockcrash);
}
