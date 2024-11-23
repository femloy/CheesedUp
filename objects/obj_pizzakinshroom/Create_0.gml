event_inherited();
spr_intro = spr_toppinshroom_intro;
spr_idle = spr_toppinshroom;
spr_run = spr_toppinshroom_run;
spr_panic = spr_toppinshroom_panic;
spr_taunt = spr_toppinshroom_taunt;
spr_intro_strongcold = spr_xmasshroomtoppin_intro;
spr_idle_strongcold = spr_xmasshroomtoppin_idle;
spr_run_strongcold = spr_xmasshroomtoppin_walk;

if SUGARY
{
	spr_intro = spr_marshmellow_intro;
	spr_idle = spr_marshmellow_idle;
	spr_run = spr_marshmellow_run;
	spr_panic = spr_marshmellow_panic;
	spr_panicrun = spr_marshmellow_panicrun;
	spr_taunt = spr_marshmellow_taunt;
	spr_supertaunt = spr_marshmellow_supertaunt;
	
	tv_do_expression(spr_tv_exprconfecti1);
}
