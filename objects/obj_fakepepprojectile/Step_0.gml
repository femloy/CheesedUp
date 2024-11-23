if (check_solid(x, y + vsp))
	vsp *= -1;
if (check_solid(x + hsp, y))
	hsp *= -1;
x += hsp;
y += vsp;
