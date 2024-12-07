if instance_exists(player)
{
	if check_skin(SKIN.cosmic, player.character, player.paletteselect)
		image_blend = COSMIC_PURPLE;
}
draw_self();
