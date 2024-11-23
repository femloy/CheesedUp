event_inherited();
spr_intro = spr_toppincheese_intro;
spr_idle = spr_toppincheese;
spr_run = spr_toppincheese_run;
spr_panic = spr_toppincheese_panic;
spr_taunt = spr_toppincheese_taunt;
spr_intro_strongcold = spr_xmascheesetoppin_intro;
spr_idle_strongcold = spr_xmascheesetoppin_idle;
spr_run_strongcold = spr_xmascheesetoppin_walk;

if SUGARY
{
	spr_intro = spr_chocolate_intro;
	spr_idle = spr_chocolate_idle;
	spr_run = spr_chocolate_run;
	spr_panic = spr_chocolate_panic;
	spr_taunt = spr_chocolate_taunt;
	spr_supertaunt = spr_chocolate_supertaunt;
	spr_panicrun = spr_chocolate_panicrun;
	
	tv_do_expression(spr_tv_exprconfecti2);
}
