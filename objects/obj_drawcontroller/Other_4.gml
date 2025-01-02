if room != kidsparty_entrance1
{
	var roomname = string_letters(room_get_name(room));
	if room == tower_pizzafacehall || room == tower_5 || room == boss_fakepephallway || roomname == "kidspartyfloor" || roomname == "kidspartyentrance" || roomname == "kidspartybasementsecret" || roomname == "kidspartysecret" || roomname == "streetbacon"
	{
		kidsparty_lightning = true;
		dark_lightning = false;
	}
	else
	{
		kidsparty_lightning = false;
		dark_lightning = false;
	}
}
else
{
	kidsparty_lightning = false;
	dark_lightning = false;
}

if (room == dungeon_5 || room == dungeon_6 or room == strongcold_10 or room == strongcold_9 or room == strongcold_lap or room == strongcold_secret6)
or (SUGARY_SPIRE && (room == sucrose_6 or room == sucrose_6_1 or room == sucrose_7 or room == sucrose_8))
{
	use_dark = true;
	dark_alpha = 1;
}
else
	use_dark = false;

if room == Mainmenu || room == Longintro
{
	use_dark = false;
	kidsparty_lightning = false;
	dark_lightning = false;
}

if room == tower_basement || room == tower_lap
	kidsparty_lightning = true;

with obj_afom_darkcontroller
	event_user(0);
