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

event_inherited();
image_speed = 0.35;

xoffset = 35;
yoffset = 0;
grav = 0.23;
state = states.normal;

spr_run = spr_toppinshroom_run;
spr_idle = spr_toppinshroom;
spr_panic = -1;
spr_panicrun = -1;
spr_taunt = -1;
spr_supertaunt = -1;

switch pet
{
	case PET.noiserat:
		spr_run = spr_playerN_cheesedmove;
		spr_idle = spr_playerN_cheesedidle;
		break;
	
	case PET.berry:
		spr_idle = spr_petberry_idle;
		spr_panic = spr_petberry_panic;
		spr_run = spr_petberry_run;
		spr_panicrun = spr_petberry_panicrun;
		spr_taunt = spr_petberry_taunt;
		spr_supertaunt = spr_petberry_supertaunt;
		break;
	
	/*
	case PET.boykiss:
		spr_idle = spr_petboykiss_idle;
		spr_run = spr_petboykiss_run;
		spr_taunt = spr_petboykiss_taunt;
		break;
	
	case PET.willigie:
		spr_idle = spr_petwilligie_idle;
		spr_run = spr_petwilligie_walk;
		spr_taunt = spr_petwilligie_taunt;
		break;
	*/
	
	/*
	case PET.rush:
		spr_idle = spr_petrush_idle;
		spr_run = spr_petrush_run;
		spr_panic = spr_petrush_panicidle;
		spr_panicrun = spr_petrush_panicrun;
		spr_taunt = spr_petrush_taunt;
		spr_supertaunt = spr_petrush_supertaunt;
		break;
	*/
	
	case PET.vivian:
		spr_idle = spr_petvivi_idle;
		spr_run = spr_petvivi_move;
		spr_taunt = spr_petvivi_taunt;
		break;
	
	case PET.gooch:
		spr_idle = spr_petgooch_idle;
		spr_run = spr_petgooch_move;
		spr_taunt = spr_petgooch_taunt;
		break;
}

xprev = x;
yprev = y;
