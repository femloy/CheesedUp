if ((other.instakillmove == 1 || other.state == states.handstandjump || other.state == states.mach2) && !death)
{
	image_xscale = other.xscale;
	event_user(0);
}
