image_angle = Wave(shake, -shake, 0.1, pi / 2);
shake = Approach(shake, 0, 0.75);
if shake == 0
	instance_destroy();
