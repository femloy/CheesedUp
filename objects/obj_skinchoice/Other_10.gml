palettes = [];
mixables = [];
sel.pal = 0;

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

/*
var map = global.skin_map[? global.lang];
if is_undefined(map)
	map = global.skin_map[? "en"];

try
{
	var arr = map[$ character];
	for(var i = 0, n = array_length(arr); i < n; i++)
	{
		var pal = struct_get(arr[i], "palette") ?? "";
		var entry = struct_get(arr[i], "entry") ?? "";
		var prefix = struct_get(arr[i], "prefix");
		var pattern = noone;
		
		if is_string(pal)
		{
			pattern = asset_get_index(pal);
			pal = 12;
		}
		
		add_palette(pal, entry, pattern, arr[i].name, arr[i].description, prefix);
	}
	sel.pal = min(characters[sel.char].default_palette, array_length(palettes) - 1);
}
catch (e)
{
	trace(e);
	add_palette(0, "", noone, "FAILSAFE", "Palette json is missing or broken!");
	sel.pal = 0;
}
*/

/*
case "SP":
	if SUGARY_SPIRE
	{
		add_palette(1, "Pizzelle", "It's the Candy-making patisje!").set_prefix("");
		add_palette(2, "Sugar", "Because sugar is green-- oh. I get it.");
		add_palette(3, "Familiar Gremlin", "Something's wrong...");
		add_palette(4, "Massacre", "SUGARY SPIRE 2: A Patisje's Genocide.");
		add_palette(5, "Rivals", "Pizzelle for Smash!");
		add_palette(6, "Gum", "Don't actually chew them, please.");
		add_palette(7, "Old School", "Also known as... grayscale.").set_prefix("GRAYSCALE");
		add_palette(8, "Zombified", "Ricochet, eh? I sense some inspiration-ception.");
		add_palette(9, "Forestation", "Made of sugarcane plants.");
		add_palette(10, "Lamda", "I have nothing to say about this.").set_prefix("LAMDA");
		add_palette(11, "Gnome Wizard", "Really diving deep into the gremlin persona.").set_prefix("GNOME");
		add_palette(13, "Oversweetened", "Get that candy off-a there!").set_prefix("SWEETENED");
		add_palette(14, "Candy Cane", "It's the Candy        !").set_prefix("CANDY");
		add_palette(15, "Pumpkin", "Now with 30% less fiber.").set_prefix("PUMPKIN");
		add_palette(16, "SAGE", "Do upside down slopes make it a Sonic game?");
		add_palette(17, "DOOM", "It's the rip-n-tearing patisje!").set_prefix("SLAYER");
		add_palette(18, "Annie", "It's ball-busting time.").set_prefix("BALL-BUSTING");
		add_palette(19, "Scooter", "I-- ... wh... what?").set_prefix("SCOOTER");
		add_palette(20, "Blurple", "Also known as \"test\".");
		add_palette(21, "Paintlad", "Very original name there.").set_prefix("PAINTLAD");
		add_palette(22, "Cotton Candy", "Delicious colors. I love them.").set_prefix("COTTON");
		add_palette(23, "Green Apple", "The least favorite candy flavor.").set_prefix("COATED");
		add_palette(24, "Secret", "Lookie! You've found a pretty sweet surprise.").set_prefix("SECRET");
		add_palette(25, "Stupid Rat", "An otherwordly creature in this case.").set_prefix("RAT");
		add_palette(26, "Pastel", "Soft on the eyes.").set_prefix("PASTEL");
		add_palette(27, "Burnt", "But what went wrong?").set_prefix("BURNT");
		add_palette(28, "Crazy Frog", "Ding ding!").set_prefix("CRAZY");
		add_palette(29, "Factory", "PLEASE. I BEG YOU.").set_prefix("INDUSTRIAL");
		add_palette(30, "Harsh Pink", "Bismuth subsalicylate.").set_prefix("PINK");
		add_palette(31, "Shadow", "SHUT UP! My dad works at Sugary Spire and can give you PREGNANT.").set_prefix("SHADOW");
	}
	break;
	
case "SN":
	if SUGARY_SPIRE
	{
		add_palette(1, "Pizzano", "The voice of the people.").set_prefix("");
		add_palette(2, "Familiar Gremlin", "Close enough, but not quite.");
		add_palette(3, "Familiar Chef", "A somewhat overweight Italian accident.");
		add_palette(4, "Lasagna", "Mondays.");
		add_palette(5, "Spice", "The secret ingredient to all candy.");
		add_palette(6, "Plumber", "As seen on TV!");
		add_palette(7, "Green Apple", "Blue orange.");
		add_palette(8, "Grape Soda", "Grape? Like the").set_prefix("GRAPE");
		add_palette(9, "Antipathic", "Isn't it anti-pathetic?").set_prefix("PATHIC");
		add_palette(10, "Gummy Bear", "Tastes like... blood?").set_prefix("GUMMY");
		add_palette(11, "Lime", "With just a slight hint of sweetness.").set_prefix("LIME");
		add_palette(13, "Crystalized", "You're the goddamn iron chef!").set_prefix("CRYSTAL");
		add_palette(14, "Virtual Boy", "Ultimate classic system!").set_prefix("VB");
		add_palette(15, "Sucrose Snowstorm", "A little sweetness never hurts.").set_prefix("SWEET");
		add_palette(16, "Classic Plumber", "This is so retro, right guys? Please laugh! I'm funny!").set_prefix("CLASSIC");
		add_palette(17, "Massacre", "This time, the chainsaw is built-in.");
	}
	break;
	
case "BN":
	if BO_NOISE
	{
		add_palette(0, "Bo Noise", "The Bo-Ginning of The End.").set_prefix("");
		add_palette(2, "Familiar Chef", "The one and only...?");
		add_palette(3, "Familiar Porcupine", "It's him...?").set_prefix("PURPLE");
		add_palette(4, "Grinch", "IIIIIIT'S CHRIMMAAAAAAAA").set_prefix("GRINCH");
		add_palette(5, "Inverted", "Ooo... scary...!");
		add_palette(6, "Naked", "Wow. Yikes.");
		add_palette(7, "The Groise", "Piss Chuggers Association.");
		add_palette(8, "ARG", "I got the key piece!").set_prefix("VILE");
		add_palette(10, "Spicy", "This adds a whole new layer to the heat meter.").set_prefix("SPICED");
		add_palette(11, "Mad Milk", "That's not milk.").set_prefix("MILKY");
		add_palette(13, "Minted", "Scraped from under the table.").set_prefix("MINTY");
		add_palette(14, "Ralsei", "The prince of darkness.\n... cutest boy.").set_prefix("DARKNER");
		add_palette(15, "Snoid", "Snot really funny when it happens to you, is it?").set_prefix("SNOTTY");
		add_palette(16, "Mr. Orange", "I'm seeing double! Four Noise!");
		add_palette(17, "Inkplot", "Straight outta the 1920's.").set_prefix("INKY");
		add_palette(18, "Eggplant", "Have we, uh, set those ranks yet...?").set_prefix("EGGPLANT");
		add_palette(19, "Hardoween", "When the ween is hard!");
		add_palette(20, "The Doise", "Do not steal.").set_prefix("DOISE");
		add_palette(21, "Noisette", "Can you out-noise The Noise?");
		add_palette(22, "The Noid", "Better avoid him.").set_prefix("NOID");
		add_palette(23, "Galaxy", "Wow it is Just like the Samsung Galaxy S23").set_prefix("GALACTIC");
		add_palette(24, "Concept", "The original.");
		add_palette(25, "Pink Hat", "I'm getting so VIRDESERT V2 right now.");
	}
	break;

if SUGARY_SPIRE
{
	if character == "SP" or character == "SN"
	{
		add_palette(spr_pattern_alright, "Alright", "That combo was...");
	    add_palette(spr_pattern_smooth, "Smooth", "How do you call this smooth?");
	    add_palette(spr_pattern_lookingood, "Lookin' Good", "Why, thank you!");
	    add_palette(spr_pattern_fruity, "Fruity", "I love fruits! I'm very fruity with other men.");
	    add_palette(spr_pattern_mesmerizing, "Mesermizing", "Truly, a sight to behold.");
	    add_palette(spr_pattern_carpet, "Solid", "Go instance_destroy() yourself.");
	    add_palette(spr_pattern_striking, "Striking", "Keep your cool with these shades!");
	    add_palette(spr_pattern_soulcrushing, "Soul Crushing", "Ouch...");
	    add_palette(spr_pattern_awesome, "Awesome", "Incredible, incredible.");
	    add_palette(spr_pattern_wtf, "WTF!!!", "Stop saying cuss words, guys!");
	}
}
*/
