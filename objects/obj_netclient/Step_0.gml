with obj_player1
{
	other.paletteselect = paletteselect;
	other.spr_palette = spr_palette;
}

if pending_room_change && instance_exists(obj_player1)
{
	net_send_room_change();
	pending_room_change = false;
}
