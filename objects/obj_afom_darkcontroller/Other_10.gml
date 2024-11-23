with obj_drawcontroller
{
	switch other.kidsparty
	{
		case "DMAS":
			kidsparty_lightning = true;
            dark_lightning = false;
			break;
		case "Chateau":
			kidsparty_lightning = false;
            dark_lightning = true;
			break;
		case "Bloodsauce":
	        use_dark = true;
	        dark_alpha = 1;
			break;
	}
}
