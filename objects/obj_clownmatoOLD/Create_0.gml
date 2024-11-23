event_perform_object(obj_clownmato, ev_create, 0);
instance_change(obj_clownmato, false);
exit;

depth = 0;
init_collision();
movespeed = 4;
jumpspeed = 5;
grounded = false;
state = states.walk;
deadspr = spr_banditochicken_dead;
walkspr = spr_clownmato_fall;
stunspr = spr_banditochicken_stun;
stunbuffer = 0;
stuntouchbuffer = 0;
stunmax = 50;
image_speed = 0.35;
