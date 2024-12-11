live_auto_call;

palettes = [];
mixables = [];

sel.pal = 0;
sel.mix = 0;

var character = characters[sel.char].char;
switch character
{
	default: case "P": case "G":
		add_palette(1, concat("dresser_", character, 1)).set_prefix("").set_entry("classic");
		add_palette(3).set_entry("unfunny");
		add_palette(4).set_entry("money");
		add_palette(5).set_entry("sage");
		add_palette(6).set_entry("blood");
		add_palette(7).set_entry("tv");
		add_palette(8).set_entry("dark");
		add_palette(9).set_entry("shitty");
		add_palette(10).set_entry("golden");
		add_palette(11).set_entry("garish");
		add_palette(15).set_entry("mooney");
		
		if !global.sandbox // temporary
			break;
		
		// cheesed up
		add_palette(58); // Yellow
		add_palette(16); // GBC
		add_palette(17).set_prefix(); // XMAS
		add_palette(18); // Noise
		add_palette(19); // Anton (PTO)
		add_palette(20); // Unfinished (PTO)
		add_palette(21); // Aether (PTO)
		add_palette(22).set_prefix(); // Black
		add_palette(24).set_prefix(); // Drunken (PTO)
		add_palette(25); // VB (PTO)
		add_palette(26).set_prefix(); // Frostbite (PTO)
		add_palette(27).set_prefix(); // Dark Gray (PTT)
		add_palette(30).set_prefix(); // Internship (PTT)
		add_palette(31).set_prefix(); // Cheesed Up (PTT)
		add_palette(32).set_prefix(); // Chalk Eater (PTT)
		add_palette(33).set_prefix(); // Snotty (PTT)
		add_palette(34).set_prefix(); // Majin (PTT)
		add_palette(39).set_prefix(); // Lean (PTO)
		add_palette(40).set_prefix(); // Grinch (PTO)
		add_palette(45).set_prefix(); // Fallen Down (PTT)
		add_palette(46).set_prefix(); // Sketch (PTO)
		if character == "G"
			add_palette(52, "dresser_G52").set_prefix(lstr("dresser_G52_mix")); // Aperture (PTT)
		else
		{
			add_palette(52).set_prefix(); // Orange Juice (PTT)
			add_palette(55); // Peter (PTO)
		}
		add_palette(57).set_prefix(); // Odd Adventurers - zykotic (1010719403144388748)
		add_palette(59).set_prefix(); // Super Pizza World - tuki4651 (1041806669086212168)
		break;
	
	case "N":
		add_palette(1).set_prefix("").set_entry("classicN");
		add_palette(3).set_entry("boise");
		add_palette(4).set_entry("roise");
		add_palette(5).set_entry("poise");
		add_palette(6).set_entry("reverse").set_prefix();
		add_palette(7).set_entry("critic").set_prefix();
		add_palette(8).set_entry("outlaw");
		add_palette(9).set_entry("antidoise").set_prefix();
		add_palette(10).set_entry("flesheater").set_prefix();
		add_palette(11).set_entry("super");
		add_palette(15).set_entry("porcupine").set_prefix();
		add_palette(16).set_entry("feminine").set_prefix();
		add_palette(17).set_entry("realdoise").set_prefix();
		add_palette(18).set_entry("forest").set_prefix();
			
		// cheesed up
		if global.sandbox 
		{
			add_palette(30); // Hardoween
			add_palette(33); // Peppoise
			add_palette(32).set_prefix(); // XMAS
			add_palette(31).set_prefix(); // Neon Green - Loy
			add_palette(37).set_prefix(); // Mint - tuki4651 (1041806669086212168)
			add_palette(38).set_prefix(); // Wild Berry - tuki4651
		}
		
		// noise has custom capes
		add_palette(spr_noisepattern1, "pattern_N1").set_entry("racer").set_palette(28);
		add_palette(spr_noisepattern2, "pattern_N2").set_entry("comedian").set_palette(27);
		add_palette(spr_noisepattern3, "pattern_N3").set_entry("banana").set_palette(26);
		add_palette(spr_noisepattern4, "pattern_N4").set_entry("noiseTV").set_palette(25);
		add_palette(spr_noisepattern5, "pattern_N5").set_entry("madman").set_palette(24);
		add_palette(spr_noisepattern6, "pattern_N6").set_entry("bubbly").set_palette(23);
		add_palette(spr_noisepattern7, "pattern_N7").set_entry("welldone").set_palette(22);
		add_palette(spr_noisepattern8, "pattern_N8").set_entry("grannykisses").set_palette(21);
		add_palette(spr_noisepattern9, "pattern_N9").set_entry("towerguy").set_palette(20);
		
		// new patterns with custom colors
		if global.sandbox
		{
			add_palette(spr_pattern_flipnote, "dresser_N40").set_palette(40); // tsookboyadvance (969958236147040286)
			
		}
		break;
	
	case "V":
		add_palette(0).set_prefix("");
	    add_palette(1).set_prefix(); // Halloween (PTO)
	    add_palette(2); // MM8BDM (PTO)
	    add_palette(3).set_prefix(); // Chocolante (PTO)
	    add_palette(4).set_prefix(); // Gutted (PTO)
	    add_palette(5).set_prefix(); // Golden (PTO)
	    add_palette(6).set_prefix(); // Cheddar (PTO)
	    add_palette(7).set_prefix(); // Sepia (PTO)
	    add_palette(8).set_prefix(); // Snick (PTO)
	    add_palette(9).set_prefix(); // Emerald (PTO)
	    add_palette(10).set_prefix(); // Holiday (PTO)
	    add_palette(11); // Tankman (PTO)
	    add_palette(14).set_prefix(); // Bloodsauce (PTO)
	    add_palette(15).set_prefix(); // Vigilatex (PTO)
	    add_palette(16).set_prefix(); // Morshu (PTO)
	    add_palette(17).set_prefix(); // The Green
	    add_palette(18).set_prefix(); // Vigirat (PTT)
	    add_palette(31).set_prefix(); // VB (PTT)
	    add_palette(35).set_prefix(); // Gum (PTO)
	    add_palette(36); // Western Champ - red_asinthecolor (717677396341293147)
		break;
	
	case "S":
		add_palette(0).set_prefix("");
	    add_palette(1); // Tail (PTO)
	    add_palette(2); // Shader (PTO)
	    add_palette(3); // Boots (PTO)
	    add_palette(4); // Snickette (PTO)
	    add_palette(5); // Master System (PTO)
	    add_palette(6); // Dark (PTO)
	    add_palette(7); // Cyan (PTO)
	    add_palette(8); // Transparent (PTO)
	    add_palette(9); // Manual (PTO)
	    add_palette(10); // Sketch (PTO)
	    add_palette(11); // Shitty (PTO)
	    add_palette(13); // Halloween (PTO)
	    add_palette(14); // Gameboy (PTO)
	    add_palette(15); // Hellsnick (PTO)
	    add_palette(16); // Majin (PTO)
	    add_palette(17); // Neon (PTO)
	    add_palette(18); // Super Snick - ???
	    add_palette(19); // Watterson - ???
		break;
	
	case "M":
		add_palette(0);
		break;
	
	case "SP":
		if SUGARY_SPIRE
		{
			// add_palette\((\d+), ([^,]+), (.+)\)
			// ->
			// dresser_SP\1 = \2\ndresser_SP\1D = \3
			
			// add_palette\((\d+), "[^,]+", "[^\)]+"\)
			// -> 
			// add_palette\(\1\)
			
			add_palette(1).set_prefix("");
			add_palette(2);
			add_palette(3);
			add_palette(4);
			add_palette(5);
			add_palette(6);
			add_palette(7).set_prefix();
			add_palette(8);
			add_palette(9);
			add_palette(10).set_prefix();
			add_palette(11).set_prefix();
			add_palette(13).set_prefix();
			add_palette(14).set_prefix();
			add_palette(15).set_prefix();
			add_palette(16);
			add_palette(17).set_prefix();
			add_palette(18).set_prefix();
			add_palette(19).set_prefix();
			add_palette(20);
			add_palette(21).set_prefix();
			add_palette(22).set_prefix();
			add_palette(23).set_prefix();
			add_palette(24).set_prefix();
			add_palette(25).set_prefix();
			add_palette(26).set_prefix();
			add_palette(27).set_prefix();
			add_palette(28).set_prefix();
			add_palette(29).set_prefix();
			add_palette(30).set_prefix();
			add_palette(31).set_prefix();
		}
		break;
	
	case "SN":
		if SUGARY_SPIRE
		{
			add_palette(1).set_prefix("");
			add_palette(2);
			add_palette(3);
			add_palette(4);
			add_palette(5);
			add_palette(6);
			add_palette(7);
			add_palette(8).set_prefix();
			add_palette(9).set_prefix();
			add_palette(10).set_prefix();
			add_palette(11).set_prefix();
			add_palette(13).set_prefix();
			add_palette(14).set_prefix();
			add_palette(15).set_prefix();
			add_palette(16).set_prefix();
			add_palette(17);
		}
		break;
	
	case "D":
		add_palette(17);
		sel.pal = 0;
		exit;
}

if global.sandbox or character == "P"
{
	add_palette(spr_peppattern1, "pattern_1").set_entry("funny");
	add_palette(spr_peppattern2, "pattern_2").set_entry("itchy");
	add_palette(spr_peppattern3, "pattern_3").set_entry("pizza");
	add_palette(spr_peppattern4, "pattern_4").set_entry("stripes");
	add_palette(spr_peppattern5, "pattern_5").set_entry("goldemanne");
	add_palette(spr_peppattern6, "pattern_6").set_entry("bones");
	add_palette(spr_peppattern7, "pattern_7").set_entry("pp");
	add_palette(spr_peppattern8, "pattern_8").set_entry("war");
	add_palette(spr_peppattern9, "pattern_9").set_entry("john");
}
if global.sandbox && character != "N"
{
	add_palette(spr_noisepattern1, "pattern_N1").set_entry("racer");
	add_palette(spr_noisepattern2, "pattern_N2").set_entry("comedian");
	add_palette(spr_noisepattern3, "pattern_N3").set_entry("banana");
	add_palette(spr_noisepattern4, "pattern_N4").set_entry("noiseTV");
	add_palette(spr_noisepattern5, "pattern_N5").set_entry("madman");
	add_palette(spr_noisepattern6, "pattern_N6").set_entry("bubbly");
	add_palette(spr_noisepattern7, "pattern_N7").set_entry("welldone");
	add_palette(spr_noisepattern8, "pattern_N8").set_entry("grannykisses");
	add_palette(spr_noisepattern9, "pattern_N9").set_entry("towerguy");
}
if global.sandbox or character == "V"
{
	add_palette(spr_pattern_target, "pattern_V1")//.set_entry("bullseye");
	
}
add_palette(spr_peppattern10, "pattern_10").set_entry("candy");
add_palette(spr_peppattern11, "pattern_11").set_entry("bloodstained");
add_palette(spr_peppattern12, "pattern_12").set_entry("bat");
add_palette(spr_peppattern13, "pattern_13").set_entry("pumpkin");
add_palette(spr_peppattern14, "pattern_14").set_entry("fur");
add_palette(spr_peppattern15, "pattern_15").set_entry("flesh");

// post-game unlockables
add_palette(spr_pattern_mario).set_entry("mario");
add_palette(spr_pattern_grinch).set_entry("grinch");

// sandbox exclusive (at the moment)
if global.sandbox
{
	add_palette(spr_pattern_missing); // PTT
	add_palette(spr_pattern_supreme); // Loy
	add_palette(spr_pattern_secret); // beebawp
	add_palette(spr_pattern_flamin); // beebawp
	add_palette(spr_pattern_jalapeno); // beebawp
	add_palette(spr_pattern_zapped); // beebawp
	add_palette(spr_pattern_evil); // Tictorian
	add_palette(spr_pattern_gba); // ???
	add_palette(spr_pattern_windows); // ???
	add_palette(spr_pattern_1034); // Loy
	add_palette(spr_pattern_snowflake); // itshaz (1062801794708803624)
	add_palette(spr_pattern_marble); // beebawp
	add_palette(spr_pattern_time); // beebawp
	add_palette(spr_pattern_arrows); // beebawp
	add_palette(spr_pattern_cosmic).mixable = false; // ameliako
}

// sugary
if SUGARY_SPIRE
{
	if character == "SP" or character == "SN"
	{
		add_palette(spr_pattern_alright);
	    add_palette(spr_pattern_smooth);
	    add_palette(spr_pattern_lookingood);
	    add_palette(spr_pattern_fruity);
	    add_palette(spr_pattern_mesmerizing);
	    add_palette(spr_pattern_striking);
	    add_palette(spr_pattern_soulcrushing);
	    add_palette(spr_pattern_awesome);
	    add_palette(spr_pattern_wtf);
	}
}

// pride pack
if global.sandbox
{
	add_palette(spr_pattern_trans); // ameliako.yy (576650935691116554)
	add_palette(spr_pattern_rainbow); // ameliako
	add_palette(spr_pattern_lesbian); // ameliako
	add_palette(spr_pattern_nonbinary); // ameliako
	add_palette(spr_pattern_bisexual); // ameliako
	add_palette(spr_pattern_asexual); // ameliako
	add_palette(spr_pattern_pansexual); // ameliako
}

// calculate all that
init = true;
if global.performance
{
	mixables = [];
	palettes = [palettes[sel.pal]];
	sel.pal = 0;
}
else
{
	// autoselect palette
	var pchar = obj_player1.character;
	if pchar == "P" && obj_player1.isgustavo
		pchar = "G";
	
	if instance_exists(obj_player1) && pchar == character
	{
		var pal = obj_player1.paletteselect;
		for(var i = 0; i < array_length(palettes); i++)
		{
			if global.palettetexture != noone
			{
				if global.palettetexture == palettes[i].texture
				{
					sel.pal = i;
					if pal != 12
					{
						for(var j = 0; j < array_length(mixables); j++)
						{
							if pal == mixables[j].palette
								sel.mix = j;
						}
					}
				}
			}
			else if pal == palettes[i].palette
				sel.pal = i;
		}
	}
	else
	{
		var pal = characters[sel.char].default_palette;
		for(var i = 0; i < array_length(palettes); i++)
		{
			if palettes[i].palette == pal
				sel.pal = i;
		}
	}
}

