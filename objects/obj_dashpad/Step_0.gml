scr_collide();
if (buffer > 0)
	buffer--;
if (rail)
	scr_rail_phy();

if panic_flip && global.panic && initial_xscale == image_xscale
	image_xscale *= -1;
