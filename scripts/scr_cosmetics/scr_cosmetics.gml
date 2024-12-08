enum HAT
{
	cowboy,
	dunce,
	crown,
	uwunya,
	dougdimmadome,
	boobs,
	dunit
}
function scr_hat_sprites(entry)
{
	switch entry
	{
		default: return spr_nocosmetic;
		
		case HAT.cowboy: return spr_cowboyhat;
		case HAT.dunce: return spr_duncehat;
		case HAT.crown: return spr_crownhat;
		case HAT.uwunya: return spr_catearshat;
		case HAT.dougdimmadome: return spr_dougdimmadome;
		case HAT.boobs: return spr_boobshat;
		case HAT.dunit: return spr_dunithat
	}
}

enum PET
{
	noiserat,
	berry, // tictorian
	//boykiss, // mgvio
	//willigie, // nathan124fs
	//rush, // rush
	vivian, // pikin
	gooch, // terravery
	//maurice, // funiculiholiday.
}
function scr_pet_sprites(entry)
{
	var s = 
	{
		spr_run: spr_toppinshroom_run,
		spr_idle: spr_toppinshroom,
		spr_panic: -1,
		spr_panicrun: -1,
		spr_taunt: -1,
		spr_supertaunt: -1
	};
	switch entry
	{
		case PET.noiserat:
			s.spr_run = spr_playerN_cheesedmove;
			s.spr_idle = spr_playerN_cheesedidle;
			break;
	
		case PET.berry:
			s.spr_idle = spr_petberry_idle;
			s.spr_panic = spr_petberry_panic;
			s.spr_run = spr_petberry_run;
			s.spr_panicrun = spr_petberry_panicrun;
			s.spr_taunt = spr_petberry_taunt;
			s.spr_supertaunt = spr_petberry_supertaunt;
			break;
	
		case PET.vivian:
			s.spr_idle = spr_petvivi_idle;
			s.spr_run = spr_petvivi_move;
			s.spr_taunt = spr_petvivi_taunt;
			break;
	
		case PET.gooch:
			s.spr_idle = spr_petgooch_idle;
			s.spr_run = spr_petgooch_move;
			s.spr_taunt = spr_petgooch_taunt;
			break;
	}
	return s;
}
