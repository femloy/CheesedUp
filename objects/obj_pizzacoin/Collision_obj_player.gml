sound_play_3d("event:/modded/sfx/pizzacoin", x, y);
global.pizzacoinOLD += 1;
instance_create_unique(0, 0, obj_pizzacoinindicator);
with obj_pizzacoinindicator
	show = 50;
add_saveroom();
instance_destroy();
