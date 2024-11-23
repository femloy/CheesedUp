event_inherited();
spr_intro = spr_toppinpineapple_intro;
spr_idle = spr_toppinpineapple;
spr_run = spr_toppinpineapple_run;
spr_panic = spr_toppinpineapple_panic;
spr_taunt = spr_toppinpineapple_taunt;
spr_intro_strongcold = spr_xmaspineappletoppin_intro;
spr_idle_strongcold = spr_xmaspineappletoppin_idle;
spr_run_strongcold = spr_xmaspineappletoppin_walk;

if SUGARY
{
	spr_intro = spr_candy_intro;
	spr_idle = spr_candy_idle;
	spr_run = spr_candy_run;
	spr_panic = spr_candy_panic;
	spr_taunt = spr_candy_taunt;
	spr_supertaunt = spr_candy_supertaunt;
	spr_panicrun = spr_candy_panicrun;
	
	tv_do_expression(spr_tv_exprconfecti5);
}
