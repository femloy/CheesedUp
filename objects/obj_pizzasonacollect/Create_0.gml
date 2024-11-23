idlespr = spr_pizzasona1;
throwspr = spr_pizzasona1throw;
transitionspr = spr_pizzasona1trans;
collectID = noone;
onebyoneID = noone;
index = 0;
showtext = false;
state = states.normal;
image_speed = 0.35;
depth = 0;

var r = -1;
while (r == -1 or r == 8)
	r = irandom_range(1, 55);

idlespr = SPRITES[? concat("spr_pizzasona", r)];
throwspr = SPRITES[? concat("spr_pizzasona", r, "throw")];
transitionspr = SPRITES[? concat("spr_pizzasona", r, "trans")];
