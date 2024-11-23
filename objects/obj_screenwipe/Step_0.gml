if state == 0
{
	image_alpha = Approach(image_alpha, 1, 0.2);
	if image_alpha >= 1
		state = 1;
}
if state == 1
{
	if playerid.state != states.backbreaker
		state = 2;
}
if state == 2
{
	image_alpha = Approach(image_alpha, 0, 0.1);
	if image_alpha <= 0
		instance_destroy();
}
