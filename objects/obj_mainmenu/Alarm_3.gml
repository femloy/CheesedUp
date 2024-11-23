with instance_create(x, y, obj_sausageman_dead)
{
	sprite_index = spr_titlepep_punch;
	image_speed = 0;
	image_index = irandom(sprite_get_number(sprite_index) - 1);
	if other.currentselect != -1
	{
		var pal = 1, tex = noone;
		if other.game.character == "P" or other.game.character == "G"
		{
			var pal = other.game.palette;
			var tex = other.game.palettetexture;
		}
		if other.game.character == "V"
		{
			hsp = abs(hsp);
			image_index = 5;
			image_xscale = -1;
			shake_camera(5);
		}
		
		use_palette = true;
		spr_palette = spr_peppalette;
		paletteselect = pal;
		oldpalettetexture = tex;
		pattern_color = scr_color_array("P");
	}
}
pep_debris = true;
