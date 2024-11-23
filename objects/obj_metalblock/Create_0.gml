escape = false;
momentum = {x: 0, y: 0};

depth = 1;
particlespr = spr_metalblockdebris;
superjumpable = false; // AFOM

if global.blockstyle == blockstyles.september
{
	// september
	sprite_index = spr_metalb;
	particlespr = spr_harddoughblockdead;
}

/*
if SUGARY
{
	sprite_index = spr_metalblock_ss;
	particlespr = spr_metaldebris_ss;
	superjumpable = true;
}
*/