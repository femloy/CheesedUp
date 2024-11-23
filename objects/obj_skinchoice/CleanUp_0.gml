live_auto_call;

event_inherited();
with obj_player1
	visible = true;
if surface_exists(player_surface)
	surface_free(player_surface);
