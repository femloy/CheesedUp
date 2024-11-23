if (obj_player1.character != "G")
{
	x = xstart;
	y = ystart;
	image_index = 0;
	
	layer_set_visible("Tiles_G", false);
	layer_set_visible("Tiles_P", true);
}
else
{
	x = -100;
	y = -100;
	image_index = 1;
	
	layer_set_visible("Tiles_G", true);
	layer_set_visible("Tiles_P", false);
}
