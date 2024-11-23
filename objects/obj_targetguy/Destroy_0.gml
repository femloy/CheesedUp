repeat 8
{
	with create_debris(x, y, snotty ? spr_targetguy_snottydebris : spr_targetguy_debris)
		vsp = -irandom_range(5, 11);
}
