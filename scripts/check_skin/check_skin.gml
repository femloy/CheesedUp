enum SKIN
{
	p_peter,
	n_chungus,
	n_paper,
	
	supreme,
	cosmic,
	
	enum_size
}
function check_skin(check, char = obj_player1.character, pal = obj_player1.paletteselect, pattern = global.palettetexture)
{
	switch check
	{
		case SKIN.p_peter: return char == "P" && pal == 55;
		case SKIN.n_paper: return char == "N" && pal == 29;
		case SKIN.supreme: return pattern == spr_pattern_supreme;
		case SKIN.cosmic: return pattern == spr_pattern_cosmic;
	}
	return false;
}
