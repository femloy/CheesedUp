function scr_collectspr(obj = object_index, player = obj_player1, set = true)
{
	var char = player.character;
	var spr = spr_shroomcollect;
	
	if global.snickchallenge
		char = "S";
	
	switch obj
	{
		default:
			if global.timeattack
			{
				if set
					sprite_index = (((x / 32) + (y / 32)) % 2) ? spr_collect_timeattack1 : spr_collect_timeattack2;
				return spr_collect_timeattack1;
			}
			switch char
			{
				default:
					spr = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect);
					if global.blockstyle == BLOCK_STYLES.old
					{
						if char == "N"
							spr = choose(spr_halloweencollectibles1, spr_halloweencollectibles2, spr_halloweencollectibles3, spr_halloweencollectibles4, spr_halloweencollectibles5);
						else
							spr = SPRITES[? sprite_get_name(spr) + "_old"];
					}
					break;
				
				/*case "N":
					spr = choose(spr_halloweencollectibles1, spr_halloweencollectibles2, spr_halloweencollectibles3, spr_halloweencollectibles4, spr_halloweencollectibles5);
					break;*/
				 
				case "SP":
					if SUGARY_SPIRE
					{
						spr = choose(spr_collect1SP, spr_collect2SP, spr_collect3SP, spr_collect4SP, spr_collect5SP);
						if global.blockstyle == BLOCK_STYLES.old
							spr = SPRITES[? sprite_get_name(spr) + "_old"];
					
						spr_palette = spr_collectSP_palette;
						paletteselect = choose(1, 2, 3, 4, 5);
					}
					break;
				
				case "S":
					spr = spr_snickcollectible1;
					break;
			}
			break;
		
		case obj_bigcollect:
			switch char
			{
				default:
					spr = choose(spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5);
					if global.blockstyle == BLOCK_STYLES.old
					{
						if char == "N"
							spr = choose(spr_pizzacollect1halloween, spr_pizzacollect2halloween, spr_pizzacollect3halloween);
						else
							spr = choose(spr_pizzacollect1_old, spr_pizzacollect2_old, spr_pizzacollect3_old);
					}
					break;
				
				case "SP":
					if SUGARY_SPIRE
					{
						spr = choose(spr_bigcollect1SP, spr_bigcollect2SP, spr_bigcollect3SP, spr_bigcollect4SP, spr_bigcollect5SP, spr_bigcollect6SP);
						if global.blockstyle == BLOCK_STYLES.old
							spr = choose(spr_bigcollect1SP_old, spr_bigcollect2SP_old, spr_bigcollect3SP_old);
					}
					break;
				
				case "SN":
					if SUGARY_SPIRE
						spr = choose(spr_bigcollect1SN, spr_bigcollect2SN, spr_bigcollect3SN);
					break;
				
				case "S":
					spr = spr_snickcollectible2;
					break;
			}
			break;
		
		case obj_giantcollect:
			switch char
			{
				default:
					spr = spr_giantpizza;
					if global.blockstyle == BLOCK_STYLES.old && char == "N"
						spr = spr_giantpizzahalloween;
					break;
				
				case "SP":
					if SUGARY_SPIRE
					{
						spr = choose(spr_giantcollect1SP, spr_giantcollect2SP, spr_giantcollect3SP, spr_giantcollect4SP);
						if global.blockstyle == BLOCK_STYLES.old
							spr = spr_giantcollectSP_old;
					}
					break;
				
				case "S":
					spr = spr_snickcollectible3;
					break;
			}
			break;
	}
	
	if set
		sprite_index = spr;
	return spr;
}
