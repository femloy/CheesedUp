var muffle = audio_effect_create(AudioEffectType.LPF2);
muffle.bypass = true;
audio_bus_main.effects[0] = muffle;

secret = false;
secretend = false;
pillar_on_camera = false;
prevpillar_on_camera = false;
music_map = ds_map_create();
music = noone;
savedpillarpause = false;
savedpanicpause = false;
savedmusicpause = false;
savedsecretpause = false;
savedpanicpos = 0;
savedmusicpos = 0;
pillarmusicID = fmod_event_create_instance("event:/music/pillarmusic");
panicmusicID = fmod_event_create_instance("event:/music/pizzatime");
panicmusicIDswap = noone; // TODO that
kidspartychaseID = fmod_event_create_instance("event:/music/w5/kidspartychase");
panicstart = false;
warstart = false;

global.jukebox = noone;
custom_music = [];
current_custom = noone;
custom_panic = -1;
waiting = false;
cached_music = undefined;

#region PIZZA TOWER

add_music(Endingroom, "event:/music/ending", noone, false);
add_music(Creditsroom, "event:/music/credits", noone, false);
add_music(Johnresurrectionroom, "event:/music/ending", noone, false);
add_music(Longintro, "event:/music/intro", noone, false, function(room, parameter)
{
	fmod_event_instance_set_parameter(parameter, "state", 0, true);
});
add_music(Mainmenu, "event:/music/title", noone, false, function(room, parameter)
{
	fmod_event_instance_set_parameter(parameter, "state", 0, true);
});

add_music(tower_tutorial1, "event:/music/tutorial", "event:/music/pillarmusic", false)
add_music(tower_tutorial1N, "event:/music/tutorial", "event:/music/pillarmusic", false);
add_music(tower_entrancehall, "event:/music/hub", "event:/music/pillarmusic", false, hub_state)
add_music(tower_johngutterhall, "event:/music/hub", "event:/music/pillarmusic", false, hub_state)
add_music(tower_1, "event:/music/hub", "event:/music/pillarmusic", false, hub_state)
add_music(tower_2, "event:/music/hub", "event:/music/pillarmusic", false, hub_state)
add_music(tower_3, "event:/music/hub", "event:/music/pillarmusic", false, hub_state)
add_music(tower_4, "event:/music/hub", "event:/music/pillarmusic", false, hub_state)
add_music(tower_5, "event:/music/hub", "event:/music/pillarmusic", false, hub_state)
add_music(tower_finalhallwaytitlecard, "event:/music/pillarmusic", noone, false)
add_music(tower_pizzafacehall, "event:/music/w5/finalhallway", noone, false)
add_music(tower_outside, "event:/sfx/misc/windloop", noone, false)
add_music(tower_peppinohouse, "event:/music/peppinohouse", noone, false);
add_music(tower_soundtest, "event:/music/pillarmusic", noone, false)
add_music(trickytreat_1, "event:/music/halloween2023", noone, false, function(room, parameter)
{
    if room == trickytreat_1
        fmod_event_instance_set_parameter(parameter, "state", 0, true)
    else
        fmod_event_instance_set_parameter(parameter, "state", 1, true)
})
add_music(secret_entrance, "event:/music/secretworld", noone, false)
add_music(tower_1up, "event:/music/pillarmusic", noone, false)
add_music(tower_2up, "event:/music/pillarmusic", noone, false)
add_music(tower_3up, "event:/music/pillarmusic", noone, false)
add_music(tower_4up, "event:/music/pillarmusic", noone, false)
add_music(boss_vigilante, "event:/music/boss/vigilante", noone, false)
add_music(boss_fakepep, "event:/music/boss/fakepep", noone, false)
add_music(boss_fakepephallway, "event:/music/boss/fakepepambient", noone, false)
add_music(boss_fakepepkey, "event:/music/pillarmusic", noone, false)
add_music(boss_noise, "event:/music/boss/noise", noone, false)
add_music(boss_pepperman, "event:/music/boss/pepperman", noone, false)
add_music(boss_funny, "event:/music/boss/pepperman", noone, false)

add_music(boss_pizzaface, "event:/music/boss/pizzaface", noone, false, function(room, event)
{
	if room == boss_pizzaface
		fmod_event_instance_set_parameter(event, "state", 0, true);
	else if room == boss_pizzafacehub
		fmod_event_instance_set_parameter(event, "state", 5, false);
});

var entrance_func = function(room, event, event_secret)
{
	var s = 0, t = 0;
	
	var char = "P";
	if instance_exists(obj_player)
		char = obj_player1.character;
	
	switch char
	{
		case "P": t = 1; break;
		case "N": t = 2; break;
		case "V": s = 2; t = 3; break;
		case "SP": s = 3; t = 4; break;
	}
	
	fmod_event_instance_set_parameter(event, "state", s, true);
	fmod_event_instance_set_parameter(event_secret, "state", REMIX or char == "SP" ? t : 0, true);
}
add_music(entrance_1, "event:/music/w1/entrance", "event:/music/w1/entrancesecret", false, entrance_func);

add_music(medieval_1, "event:/music/w1/medieval", "event:/music/w1/medievalsecret", false, function(room, event, event_secret)
{
	var s = -1;
	switch room
	{
		case medieval_1:
		case medieval_2:
			s = 0
			break
		case medieval_3:
		case medieval_5:
			s = 0
			break
		case medieval_6:
			s = 2
			break
	}

	if s != -1
		fmod_event_instance_set_parameter(event, "state", s, true)
});

add_music(ruin_1, "event:/music/w1/ruin", "event:/music/w1/ruinsecret", false, function(room, event)
{
	var s = -1;
	switch room
	{
		case ruin_1:
		case ruin_5:
			s = 0
			break
		case ruin_6:
			s = 1
			break
	}

	if (s != -1)
		fmod_event_instance_set_parameter(event, "state", s, true)
});

add_music(dungeon_1, "event:/music/w1/dungeon", "event:/music/w1/dungeonsecret", false)
add_music(badland_1, "event:/music/w2/desert", "event:/music/w2/desertsecret", false, function(room, event)
{
	var s = -1;
	switch room
	{
		case badland_1:
		case badland_8b:
		case badland_10:
			s = 0
			break
		case badland_9:
		case badland_mart4:
			s = 1
			break
	}

	if (s != -1)
		fmod_event_instance_set_parameter(event, "state", s, true)
});

add_music(farm_2, "event:/music/w2/farm", "event:/music/w2/farmsecret", false, function(room, event)
{
	var s = -1;
	switch room
	{
		case farm_2:
		case farm_6:
			s = 0
			break
		case farm_9:
			s = 1
			break
	}

	if (s != -1)
		fmod_event_instance_set_parameter(event, "state", s, true)
});

add_music(graveyard_1, "event:/music/w2/graveyard", "event:/music/w2/graveyardsecret", false)
add_music(saloon_1, "event:/music/w2/saloon", "event:/music/w2/saloonsecret", false)
add_music(plage_entrance, "event:/music/w3/beach", "event:/music/w3/beachsecret", false)
add_music(forest_1, "event:/music/w3/forest", "event:/music/w3/forestsecret", false, function(room, event, event_secret)
{
	var s = -1//, t = 0;
	switch room
	{
		case forest_1:
		case forest_3:
			s = 0;
			break;
		case forest_G1b:
			s = 1;
			break;
		case forest_G1:
			if obj_player1.isgustavo or obj_player1.noisecrusher
				s = 2;
			break
	}
	
	if s != -1
		fmod_event_instance_set_parameter(event, "state", s, true);
	//fmod_event_instance_set_parameter(event_secret, "state", t, true);
});

add_music(minigolf_1, "event:/music/w3/golf", "event:/music/w3/golfsecret", false)
add_music(space_1, "event:/music/w3/space", "event:/music/w3/spacesecret", false)
add_music(freezer_1, "event:/music/w4/freezer", "event:/music/w4/freezersecret", false, function(room, event, event_secret)
{
	var s = -1;
	switch room
	{
		case freezer_1:
		case freezer_9:
			s = 0
			break
		case freezer_12:
			s = 1
			break
	}

	if (s != -1)
		fmod_event_instance_set_parameter(event, "state", s, true)
});

add_music(industrial_1, "event:/music/w4/industrial", "event:/music/w4/industrialsecret", false, function(room, event, event_secret)
{
	var s = -1;
	switch room
	{
		case industrial_1:
		case industrial_2:
			s = 0
			break
		case industrial_3:
			s = 1
			break
	}

	if (s != -1)
		fmod_event_instance_set_parameter(event, "state", s, true)
});

add_music(sewer_1, "event:/music/w4/sewer", "event:/music/w4/sewersecret", false)
add_music(street_1, "event:/music/w4/street", "event:/music/w4/streetsecret", false, function(room, event)
{
	if (room == street_1 || room == street_house3)
		fmod_event_instance_set_parameter(event, "state", 0, true)
	else if (room == street_bacon)
		fmod_event_instance_set_parameter(event, "state", 2, true)
	if (room == street_jail)
		fmod_set_parameter("musicmuffle", 1, 0)
	else
		fmod_set_parameter("musicmuffle", 0, 0)
});

add_music(chateau_1, "event:/music/w5/chateau", "event:/music/w5/chateausecret", false)
add_music(kidsparty_1, "event:/music/w5/kidsparty", "event:/music/w5/kidspartysecret", false)
add_music(war_1, "event:/music/w5/war", "event:/music/w5/warsecret", false)
add_music(war_lap, "event:/music/w5/war", "event:/music/w5/warsecret", false)

#endregion
#region PTO

add_music(editor_entrance, "event:/modded/editor", "event:/music/pillarmusic", false)
add_music(tower_extra, "event:/music/hub", "event:/music/pillarmusic", false, hub_state)
add_music(tower_basement, "event:/music/hub", "event:/music/pillarmusic", false, hub_state)
add_music(tower_freerun, "event:/music/hub", "event:/music/pillarmusic", false, hub_state)
add_music(tower_hubroomE, "event:/music/hub", "event:/music/pillarmusic", false, hub_state)
add_music(tower_sage, "event:/music/hub", "event:/music/pillarmusic", false, hub_state)
add_music(tower_sugary, "event:/music/hub", "event:/music/pillarmusic", false, hub_state)
add_music(tower_shop, "event:/modded/shop", "event:/music/pillarmusic", false)

add_music(tutorialV_1, "event:/music/tutorial", "event:/music/pillarmusic", false)
add_music(characterselect, "event:/music/characterselect", noone, false)

if BO_NOISE
	add_music(midway_1, "event:/music/w1/entrance", "event:/music/w1/entrancesecret", false, entrance_func);

#endregion
if SUGARY_SPIRE
{
	#region SUGARY
	
	add_music(sugarytut_1, "event:/modded/sugary/tutorial", noone, false);
	
	add_music(entryway_1, "event:/music/w1/entrance", "event:/music/w1/entrancesecret", false, entrance_func);
	add_music(steamy_1, "event:/modded/sugary/cotton", "event:/modded/sugary/cottonsecret", false, function(room, event, event_secret)
	{
		var s = -1;
		switch room
		{
			case steamy_1:
			case steamy_7:
				s = 0;
				break;
			
			case steamy_8:
				s = 1;
				break;
		}
		if s != -1
			fmod_event_instance_set_parameter(event, "state", s, false);
	});
	//add_music(rm_geyser_test, "event:/modded/sugary/molasses", "event:/modded/sugary/molassessecret", false);
	add_music(molasses_1, "event:/modded/sugary/molasses", "event:/modded/sugary/molassessecret", false, function(room, event, event_secret)
	{
		var s = -1;
		switch room
		{
			case molasses_1:
			case molasses_6:
				s = 0;
				break;
		
			case molasses_6b:
				s = 1;
				break;
		}
		if s != -1
			fmod_event_instance_set_parameter(event, "state", s, false);
	});
	add_music(sucrose_1, "event:/modded/sugary/sucrose", "event:/modded/sugary/sucrosesecret", false);
	
	#endregion
}
#region OLD LEVELS

add_music(medieval_1_OLD, "event:/music/w1/medieval", "event:/music/w1/medievalsecret", false, function(room, event, event_secret)
{
	var s = -1;
	switch room
	{
		case medieval_1:
		case medieval_2:
			s = 0;
			break;
		case medieval_3:
		case medieval_5:
			s = 1;
			break;
		case medieval_6:
			s = 2;
			break;
	}

	if (s != -1)
		fmod_event_instance_set_parameter(event, "state", s, true)
});
add_music(ruin_1_OLD, "event:/music/w1/ruin", "event:/music/w1/ruinsecret", false, function(room, event)
{
	var s = -1;
	switch room
	{
		case ruin_1:
		case ruin_5:
			s = 0;
			break;
		case ruin_6:
			s = 1;
			break;
	}

	if (s != -1)
		fmod_event_instance_set_parameter(event, "state", s, true)
});
add_music(dungeon_1_OLD, "event:/music/w1/dungeon", "event:/music/w1/dungeonsecret", false)

add_music(grinch_1, "event:/modded/level/grinch", "event:/music/w1/medievalsecret", false);
add_music(dragonlair_1, "event:/modded/level/dragonlair", "event:/modded/level/dragonsecret", false);
add_music(hiddenlair_1, "event:/modded/level/dragonlair", "event:/modded/level/dragonsecret", false);
add_music(beach_1, "event:/music/w3/beach", "event:/music/w3/beachsecret", false);
add_music(golf_room1, "event:/music/w3/golf", "event:/music/w3/golfsecret", false);
add_music(mansion_1, "event:/modded/level/mansion", "event:/modded/level/mansionsecret", false);
add_music(mansion_weird2, "event:/modded/level/mansion", "event:/modded/level/mansionsecret", false);
add_music(PP_room1, "event:/modded/level/oldtutorial", "event:/music/pillarmusic", false);
add_music(etb_1, "event:/modded/level/oldtutorial", "event:/music/w1/ruinsecret", false, function(room, event, event_secret)
{
	var s = room == etb_1 ? 0 : 1;
	if s == 1 && check_skin(SKIN.p_peter)
		s = 2;
	fmod_event_instance_set_parameter(event, "state", s, false);
});

add_music(strongcold_10, "event:/modded/level/strongcold", "event:/modded/level/strongcoldsecret", false, function(room, event, event_secret)
{
	var s = 1;
	switch room
	{
		case strongcold_10:
		case strongcold_9:
		case strongcold_lap:
			s = 0;
			break;
		
		case strongcold_1:
			s = 2;
			break;
		
		case strongcold_secret1:
		case strongcold_secret4:
		case strongcold_secret5:
			s = -1;
			break;
	}
	if s != -1
		fmod_event_instance_set_parameter(event, "state", s, true);
});
add_music(oldfreezer_1, "event:/music/w4/freezer", "event:/music/w4/freezersecret", false, noone);
add_music(oldfactory_0, "event:/music/w4/industrial", "event:/music/w4/industrialsecret", false, noone);

add_music(factory_1, "event:/music/w4/industrial", "event:/music/w4/industrialsecret", false, function(room, event, event_secret)
{
	var s = -1;
	switch room
	{
		case factory_1:
			s = 0;
			break;
		case factory_2:
			s = 1;
			break;
	}

	if s != -1
		fmod_event_instance_set_parameter(event, "state", s, true);
});
add_music(desert_1, "event:/music/w2/desert", "event:/music/w2/desertsecret", false, function(room, event)
{
	var s = -1;
	switch room
	{
		case badland_1:
		case badland_8b:
		case badland_10:
			s = 0;
			break;
		case badland_9:
		case badland_mart4:
			s = 1;
			break;
	}
	
	if s != -1
		fmod_event_instance_set_parameter(event, "state", s, true);
});

#endregion
#region ENCORE

add_music(e_medieval_1, "event:/modded/encore/w1/medieval", "event:/music/w1/medievalsecret", false, function(room, event, event_secret)
{
	var s = -1;
	switch room
	{
		case e_medieval_1:
			s = 0
			break
	}

	if (s != -1)
		fmod_event_instance_set_parameter(event, "state", s, true)
});

#endregion
