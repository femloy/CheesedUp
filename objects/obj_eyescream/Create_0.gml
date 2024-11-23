SS_CODE_START;

event_inherited();

idlespr = spr_eyescreamsandwich;
stunfallspr = spr_eyescreamsandwich_dead;
walkspr = spr_eyescreamsandwich;
scaredspr = spr_eyescreamsandwich_dead;
spr_dead = spr_eyescreamsandwich_dead;

sprite_index = walkspr;
sugary = true;

state = states.wait;
lerpamt = 0.2;
substate = 0;
targety = 0;
randomx = irandom_range(50, 100);
randomy = irandom_range(100, 200);
timer = irandom_range(60, 180);
maxtime = timer;
use_collision = false;

SS_CODE_END;
