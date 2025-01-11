function scr_achievements()
{
	scr_achievements_rank();
	scr_achievements_boss();

	scr_achievements_peppino();
	scr_achievements_halloween();
	scr_achievements_noise();

	scr_achievements_trickytreat();

	scr_achievements_entrance();
	scr_achievements_medieval();
	scr_achievements_ruin();
	scr_achievements_dungeon();

	scr_achievements_badland();
	scr_achievements_graveyard();
	scr_achievements_farm();
	scr_achievements_saloon();

	scr_achievements_plage();
	scr_achievements_forest();
	scr_achievements_space();
	scr_achievements_minigolf();

	scr_achievements_street();
	scr_achievements_sewer();
	scr_achievements_industrial();
	scr_achievements_freezer();

	scr_achievements_chateau();
	scr_achievements_kidsparty();
	scr_achievements_war();

	scr_achievements_pto();
}

enum notifs
{
	bodyslam_start,
	bodyslam_end,
	baddie_kill,
	enemies_dead, // obj_achievement_enemiesdead
	parry,
	end_level,
	mort_block,
	hurt_player,
	fall_outofbounds,
	beer_destroy,
	timedgateclock,
	flush,
	baddie_hurtboxkill, // parrying back a projectile
	treasureguy_unbury,
	levelblock_break, // asteroids, forest blocks and dead johns
	destroyed_area, // space was gonna use this for a piledriving achievement
	pizzaball,
	pizzaball_killenemy,
	pizzaball_goal,
	brickball,
	hungrypillar_dead,
	brick_killenemy,
	pigcitizen_photo,
	pizzaboy_dead,
	mrpinch_launch,
	priest_collect,
	secret_enter,
	secret_exit,
	destroy_iceblock,
	monster_dead,
	monster_activate,
	monster_jumpscare,
	knightpep_bump,
	cheeseblock_activate,
	ratblock_explode,
	rattumble_dead,
	ratblock_dead,
	boilingsauce,
	cow_kick,
	cow_kick_count,
	corpsesurf,
	johnghost_collide,
	priest_ghost,
	superjump_timer,
	shotgunblast_start,
	shotgunblast_end,
	block_break,
	bazooka_explode,
	wartimer_endlevel,
	totem_revive, // machslideboost for a bit in front of it
	boss_dead,
	combo_end,
	unlocked_achievement,
	crawl_in_shit, // crawl in shit for 10 seconds
	firsttime_ending, // beat the game for the first time
	taunt,
	johnresurrection, // with all treasures
	knighttaken,
	mrmooney_donated,
	UNKNOWN_59,
	pumpkin_collect,
	trickytreat_enter,
	trickytreat_fail,
	trickytreat_leave,
	cancel_noisedrill,
	gate_taunt,
	player_explosion,
	endingrank,
	breakdance,
	slipbanan,
	close_call, // do rank with pizzaface on screen
	antigrav,
	seen_ptg,
	interact_granny,
	
	// PTO
	msdos_marior,
}
