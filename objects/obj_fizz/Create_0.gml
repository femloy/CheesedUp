SS_CODE_START;

event_inherited();
stunfallspr = spr_snowcloudstun;
walkspr = spr_snowcloudwalk;
scaredspr = spr_snowcloudscared;
spr_dead = spr_snowclouddead;

sprite_index = walkspr;
sugary = true;

state = states.float;
substate = 0;
bombreset = 0;

SS_CODE_END;
