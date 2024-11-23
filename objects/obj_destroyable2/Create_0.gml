event_inherited();

particlespr = spr_pizzadebris;
spr_dead = spr_pizzablockdead;

if global.blockstyle == blockstyles.old
{
	// old
	sprite_index = spr_destroyable2_old;
	particlespr = spr_pizzadebris;
	particlespd = 0;
	spr_dead = -1;
}

/*
switch obj_player1.character
{
	case "SP":
		break;
	case "BN":
		break;
}
if obj_player1.character == "SP"
{
	sprite_index = spr_candydestroyable2;
	particlespr = -1;
	spr_dead = spr_candyblockdead;
	
	if global.blockstyle == blockstyles.old
	{
		// old
		sprite_index = spr_destroyable2SP_old;
		particlespr = spr_candydebris;
	}
}
else if obj_player1.character == "BN"
{
	sprite_index = spr_destroyable2_bo;
	particlespr = -1;
	spr_dead = spr_pizzablockdead_bo;
}
*/

image_index = random_range(0, image_number - 1);
depth = 1;
