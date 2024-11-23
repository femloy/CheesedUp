image_speed = 0.35;
init_collision();
image_xscale = sign(obj_player.x - x);
instance_create(x, y, obj_bangeffect);
drop = false;
alarm[0] = 50;
