x = SCREEN_WIDTH / 2;
y = SCREEN_HEIGHT + sprite_get_height(spr_gustavo_intro);
movespeed = 8;
state = states.transition;
depth = -600;
sprite_index = spr_tvstatic;
image_index = 0;
image_speed = 0.35;
spr = spr_gustavo_intro;
obj_camera.lock = true;
sound_play("event:/sfx/ui/tvswitch");
shakey = 0;
stable = instance_exists(obj_peppinoswitch) && instance_exists(obj_gustavoswitch);
