title_index = (title_index + 0.35) % 2;
paletteselect = 0;
vsp -= 1;

if SUGARY_SPIRE
{
	if sugary
	{
		if title <= 24
		{
			if image_alpha > 0
			    image_alpha -= 0.05;
			else
			    instance_destroy();
		
			switch type
			{
				default:
					if image_alpha > 1
					{
						image_xscale = Approach(image_xscale, 1, .1)
						image_yscale = Approach(image_yscale, 1, .1)
					}
					else
					{
						image_xscale = Approach(image_xscale, 5, .05)
						image_yscale = Approach(image_xscale, 5, .05)
					}
					break;
			
				case 0:
					if image_alpha > 1
					{
						image_xscale = Approach(image_xscale, 1, .1)
						image_yscale = Approach(image_yscale, 1, .1)
					}
					else
					{
						image_xscale = image_alpha
						image_yscale = image_alpha	
					}
					break

				case 3:
					image_xscale = Approach(image_xscale, 1, .1)
					image_yscale = Approach(image_yscale, 1, .1)
					if image_angle != 360
						image_angle = Approach(image_angle, 360, 30)
					break;
			}
		}
		else
			visible = false;
		exit;
	}
}
if BO_NOISE
{
	if bo
	{
		if image_alpha > 0
		    image_alpha -= 0.05;
		else
		    instance_destroy();
	
		if image_xscale < 1
		    image_xscale = Approach(image_xscale, 1, 0.1);
		if image_angle != 360 && type == 2
		    image_angle += 30;
	
		if image_alpha < 1
		{
		    image_xscale = Approach(image_xscale, 5, 0.05);
		    image_yscale = Approach(image_yscale, 5, 0.05);
		}
		exit;
	}
}

if REMIX && alarm[1] <= 0
{
	image_alpha -= 0.1;
	if image_alpha <= 0
		instance_destroy();
}
