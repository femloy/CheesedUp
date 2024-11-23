live_auto_call;
event_inherited();

// init
sel = {
	game: 0,
	song: 0
};

charshift = [0, 0, 1];
discrot = 0;
dumbass = false;

discanim = 0;

// sections
sections = [];
function JukeboxSection(game_name) constructor
{
	name = game_name;
	songs = [];
	
	add_multisong = function()
	{
		if argument_count % 2 == 1 or argument_count == 0
			exit;
		
		var song = [1];
		for(var i = 0; i < argument_count / 2; i++)
		{
			var path = argument[i * 2];
			var name = argument[(i * 2) + 1];
			array_push(song, [path, name, ""]);
		}
		array_push(songs, song);
	}
	add_song = function(path, name, trivia = "")
	{
		array_push(songs, [path, name, trivia]);
	}
	add_secretsong = function(path, name, sugary_author = "Loy", bo_author = "Loy")
	{
		var song = [1];
		array_push(song, [path, name, ""]);
		
		var parsed = string_split(name, " - ", true, 1);
		
		if SUGARY_SPIRE
			array_push(song, [path + " SP", parsed[0] + " (Sugary) - " + sugary_author, ""]);
		if BO_NOISE
			array_push(song, [path + " BN", parsed[0] + " (Bo) - " + bo_author, ""]);
		
		array_push(songs, song);
	}
	add_separator = function()
	{
		array_push(songs, 0);
	}
	
	array_push(obj_songchoice.sections, self);
}

// do it
with new JukeboxSection("Pizza Tower")
{
	add_song("event:/soundtest/base/intro", "Time For A Smackdown - MrSauceman");
	add_song("event:/soundtest/base/pizzadeluxe", "Pizza Deluxe - PostElvis");
	add_song("event:/soundtest/base/funiculi", "funiculi holiday - ClascyJitto");
	add_song("event:/soundtest/base/pizzatime", "It's Pizza Time! - MrSauceman");
	add_song("event:/soundtest/base/lap", "The Death That I Deservioli - MrSauceman");
	add_song("event:/soundtest/base/mondays", "Mondays - MrSauceman");
	add_song("event:/soundtest/base/unearthly", "Unearthly Blues - MrSauceman");
	add_song("event:/soundtest/base/hotspaghetti", "Hot Spaghetti - MrSauceman");
	add_song("event:/soundtest/base/coldspaghetti", "Cold Spaghetti - MrSauceman");
	add_song("event:/soundtest/base/theatrical", "Theatrical Shenanigans - MrSauceman");
	add_song("event:/soundtest/base/putonashow", "Put On A Show!! - ClascyJitto");
	add_song("event:/soundtest/base/dungeon", "Dungeon Freakshow - ClascyJitto");
	add_song("event:/soundtest/base/pepperman", "Pepperman Strikes! - MrSauceman");
	add_song("event:/soundtest/base/tuesdays", "Tuesdays - MrSauceman");
	add_song("event:/soundtest/base/oregano", "Oregano Mirage - ClascyJitto");
	add_song("event:/soundtest/base/ufo", "Oregano UFO - ClascyJitto");
	add_song("event:/soundtest/base/tombstone", "Tombstone Arizona - MrSauceman");
	add_song("event:/soundtest/base/mort", "Mort's Farm - ClascyJitto");
	add_song("event:/soundtest/base/kidsmenu", "What's On The Kid's Menu? - ClascyJitto");
	add_song("event:/soundtest/base/yeehaw", "Yeehaw Deliveryboy - ClascyJitto");
	add_song("event:/soundtest/base/vigilante", "Calzonification - MrSauceman");
	add_song("event:/soundtest/base/wednesdays", "Wednesdays - ClascyJitto");
	add_song("event:/soundtest/base/tropical", "Tropical Crust - MrSauceman");
	add_song("event:/soundtest/base/forest1", "mmm yes put the tree on my pizza - ClascyJitto");
	add_song("event:/soundtest/base/gustavo", "gustavo - ClascyJitto");
	add_song("event:/soundtest/base/forest2", "Wudpecker - ClascyJitto");
	add_song("event:/soundtest/base/goodeatin", "Good Eatin' - ClascyJitto");
	add_song("event:/soundtest/base/extraterrestial", "Extraterrestial Wahwahs - MrSauceman");
	add_song("event:/soundtest/base/noise", "Pumpin' Hot Stuff - MrSauceman");
	add_song("event:/soundtest/base/thursdays", "Thursdays - ClascyJitto");
	add_song("event:/soundtest/base/tubular", "Tubular Trash Zone - MrSauceman");
	add_song("event:/soundtest/base/engineer", "Pizza Engineer - MrSauceman");
	add_song("event:/soundtest/base/saucemachine", "Peppino's Sauce Machine - MrSauceman");
	add_song("event:/soundtest/base/bitethecrust", "Bite The Crust - MrSauceman");
	add_song("event:/soundtest/base/wayoftheitalian", "Way Of The Pig - MrSauceman");
	add_song("event:/soundtest/base/preheat", "Don't Preheat Your Oven Because If You Do The Song Won't Play - ClascyJitto");
	add_song("event:/soundtest/base/celsius", "Celsius Troubles - ClascyJitto");
	add_song("event:/soundtest/base/plains", "On The Rocks - MrSauceman");
	add_song("event:/soundtest/base/fakepep", "Pizza Time Never Ends - ClascyJitto");
	add_song("event:/soundtest/base/fridays", "Fridays - MrSauceman");
	add_song("event:/soundtest/base/chateau", "There's A Bone In My Spaghetti! - MrSauceman");
	add_song("event:/soundtest/base/tunnely", "Tunnely Shimbers - MrSauceman");
	add_song("event:/soundtest/base/thousand", "Thousand March - MrSauceman");
	add_song("event:/soundtest/base/unexpectancy1", "Unexpectancy, Part 1 - MrSauceman");
	add_song("event:/soundtest/base/unexpectancy2", "Unexpectancy, Part 2 - MrSauceman");
	add_song("event:/soundtest/base/unexpectancy3", "Unexpectancy, Part 3 - MrSauceman");
	add_song("event:/soundtest/base/bye", "Bye Bye There! - MrSauceman");
	add_song("event:/soundtest/base/hip", "Hip To Be Italian - MrSauceman");
	add_song("event:/soundtest/base/notime", "Receding Hairline Celebration Party - MrSauceman");
	add_song("event:/soundtest/base/meatphobia", "Meatophobia - MrSauceman");
	add_song("event:/soundtest/base/mayhem", "Pizza Mayhem Instrumental - MrSauceman");
	add_song("event:/soundtest/base/mayhem2", "Pizza Mayhem - MrSauceman");
	
	add_separator();
	
	add_song("event:/soundtest/base/entrancenoise", "The Noise's Jam-Packed Radical Anthem - MrSauceman");
	add_song("event:/soundtest/base/doise", "Impasta Syndrome - MrSauceman");
	add_song("event:/soundtest/base/pizzatimenoise", "Distasteful Anchovi - ClascyJitto");
	add_song("event:/soundtest/base/lap2noise", "World Wide Noise - ClascyJitto");
	add_song("event:/soundtest/base/pizzaheadnoise", "Unexpectancy, Part 3 (Remix) - ClascyJitto");
	add_song("event:/soundtest/base/noisefinalescape", "I Need A Noise - MrSauceman");
	add_song("event:/soundtest/base/creditsnoise", "New Noise Resolutionz - ClascyJitto");
	
	add_separator();
	
	var e = [
		1,
		["event:/soundtest/base/secretentrance", "An Entrance Secret - ClascyJitto", ""]
	]
	if SUGARY_SPIRE
	{
		array_push(e, 
			["event:/soundtest/base/secretentrance SP", "there's a secret inside my breakfast? - RodMod", ""],
			["event:/soundtest/base/secretentrance SN", "lol funny - Loy"]
		);
	}
	if BO_NOISE
		array_push(e, ["event:/soundtest/base/secretentrance BN", "how bo unlock the secret - Jessie Productions"]);
	array_push(songs, e);
	
	add_secretsong("event:/soundtest/base/secretpizzascape", "hmmm look what u done did you found a secret :) - ClascyJitto", SUGARY_SPIRE ? "RodMod" : "", BO_NOISE ? "Jessie Productions" : "");
	add_secretsong("event:/soundtest/base/secretruin", "A Secret Under The Debris - ClascyJitto");
	add_secretsong("event:/soundtest/base/secretdungeon", "A Hidden Pepperoni In The Cage - ClascyJitto");
	add_secretsong("event:/soundtest/base/secretdesert", "A Grain of Bread in a Grain of Sand - ClascyJitto");
	add_secretsong("event:/soundtest/base/secretgraveyard", "An Undead Secret - ClascyJitto");
	add_secretsong("event:/soundtest/base/secretsaloon", "A Secret In My Boot - ClascyJitto");
	add_secretsong("event:/soundtest/base/secretfarm", "A Secret In The Chicken - ClascyJitto");
	add_secretsong("event:/soundtest/base/secretbeach", "A Secret In The Sands - ClascyJitto");
	add_secretsong("event:/soundtest/base/secretforest", "Everybody Wants To Be A Secret - ClascyJitto");
	add_secretsong("event:/soundtest/base/secretspace", "An Interstellar Secret - ClascyJitto");
	add_secretsong("event:/soundtest/base/secretgolf", "A Secret Hole in One - ClascyJitto");
	add_song("event:/soundtest/base/secretstreet", "A Secret In The Streets - ClascyJitto");
	add_song("event:/soundtest/base/secretsewer", "A Fecal Secret - ClascyJitto");
	add_secretsong("event:/soundtest/base/secretfactory", "An Industry Secret - ClascyJitto");
	add_secretsong("event:/soundtest/base/secretfreezer", "A Frozen Secret - ClascyJitto");
	add_secretsong("event:/soundtest/base/secretkidsparty", "A Secret You Don't Want To Find - ClascyJitto");
	add_secretsong("event:/soundtest/base/secretwar", "My Secret War Crimes - ClascyJitto");
	
	add_separator();
	
	add_song("event:/soundtest/base/secretworld", "Secret Lockin' - ClascyJitto");
	add_song("event:/soundtest/base/halloweenpause", "Spacey Pumpkins - MrSauceman");
	add_song("event:/soundtest/base/halloweenstart", "The Bone Rattler - MrSauceman");
	add_song("event:/soundtest/base/halloweenrace", "The Runner - PostElvis");
}

with new JukeboxSection("Cheesed Up")
{
	add_song("event:/soundtest/pto/saturdays", "Saturdays - Loy",
		"The remix in the latter half of this song was taken from PT Online's ARCADE song.");
	
	add_song("event:/soundtest/pto/sundays", "Sundays - Loy");
	
	add_song("event:/soundtest/pto/shop", "Weekend Delight - Loy",
		"The bassline is taken from PT Online's \"Credits\" song.");
	
	add_song("event:/soundtest/pto/credits", "Credits - Loy");
	
	add_multisong("event:/soundtest/pto/cosmicclone", "Cosmic Chaos - Loy",
		"event:/soundtest/pto/cosmiccloneescape", "Cosmic Chaos (Escape) - Loy",
		"event:/soundtest/pto/cosmiccloneN", "Cosmic Chaos (Noise) - Loy",
		"event:/soundtest/pto/cosmiccloneescapeN", "Cosmic Chaos (Noise, Escape) - Loy");
	
	add_song("event:/soundtest/pto/editor", "Choosing The Toppings - MrSauceman");
	
	add_song("event:/soundtest/pto/quintessence", "Quintessence - ClascyJitto",
		"This was supposed to be one of the hub songs, judging by the filename \"pt-hub-world-draft-2\".");
	
	add_song("event:/soundtest/pto/strongcold", "Teeth Dust In The Strongcold - ClascyJitto",
		"Strongcold was gonna have a remix of Grinch's Ultimatum instead, but they didn't get permission.");
	
	add_song("event:/soundtest/pto/mansion", "Ground Bound - MrSauceman",
		"In an old version of this song, instead of saying \"Bring me ravioli\", it would say \"Suck my D\"...");
	
	add_song("event:/soundtest/pto/snickchallenge", "Spooky Apartment Escape - ClascyJitto",
		"This was supposed to be the escape song for a scrapped Spooky Apartment level. It was reused for Snick's Challenge.");
	
	add_song("event:/soundtest/pto/dragonlair", "Tarragon Pizza - ClascyJitto",
		"This song has a time signature of 9/8. Try to track the beat!");
	
	add_song("event:/soundtest/pto/hallelujah", "Hallelujah Mama-Mia - ClascyJitto",
		"This song was never finished. This is a WIP, apparently.");
	
	add_song("event:/soundtest/pto/funiculario", "Funiculario - Dim Widdy",
		"This song was commissioned by McPig all the way back in 2018. He posted this high quality version on the Discord.");
	
	add_song("event:/soundtest/pto/oldruin", "One Pizza At A Time - MrSauceman");
	
	add_song("event:/soundtest/pto/grinch", "Grinch's Ultimatum - PilotRedSun",
		"PilotRedSun never gave anyone permission to use his music.");
	
	add_song("event:/soundtest/pto/forafewtoppings", "For A Few Toppings More - MrSauceman",
		"This is Vigilante's trailer theme, first heard in 2020. This full version was released 3 years later.");
	
	add_song("event:/soundtest/pto/leaningnightmare", "Leaning Nightmare - ClascyJitto",
		"Deep-Dish-9's escape theme. Wish I was joking.");
	
	if BO_NOISE
	{
		add_song("event:/soundtest/pto/midway", "bad to the bo - Jessie Productions");
		add_song("event:/soundtest/pto/escapeBN", "bo noise escape theme 1 - Jessie Productions");
		add_song("event:/soundtest/pto/lapBN", "bo noise rap - Fuckface",
			"Vir is a fuckface.");
	}
	
	add_song("event:/soundtest/pto/lap3", "Pillar John's Revenge - Vozaxhi");
	add_song("event:/soundtest/pto/italianpredicament", "Italian Predicament - Loy");
	add_song("event:/soundtest/pto/thevigilantesfavoritesongthathelistenstowhenhedoesit", "THE VIGILANTE'S FAVORITE SONG THAT HE LISTENS TO WHEN HE DOES IT - Loy");
	//add_song("event:/soundtest/pto/familyguy", "FAMILY GUY COOL WHIP REMIX - Tha J-Squad");
	
	add_separator();
	
	add_secretsong("event:/soundtest/pto/secretmansion", "A Pepperoni Secret - Loy");
	add_secretsong("event:/soundtest/pto/secretstrongcold", "Teeth Dust In The Secret - Loy");
	add_secretsong("event:/soundtest/pto/secretsky", "A Secret In The Skies - Loy");
	add_secretsong("event:/soundtest/pto/secretdragon", "why is there an eye in my CHEESE!? - Loy");
	add_secretsong("event:/soundtest/pto/secretentrance", "An Entrance Secret - Loy");
	add_secretsong("event:/soundtest/pto/secretentranceN", "A Noisy Secret - Loy");
	add_secretsong("event:/soundtest/pto/secretentranceV", "The Secret West - Loy");
	add_song("event:/soundtest/pto/secretforest", "Everybody Wanna Be A Secret - Loy");
	add_secretsong("event:/soundtest/pto/secretstreet", "A Secret In These Streets - Loy");
	add_secretsong("event:/soundtest/pto/secretsewer", "A Fecal Secret - Loy");
	add_secretsong("event:/soundtest/pto/secretchateau", "A Secret In My Spaghetti - Loy");
}

with new JukeboxSection("Encore Tower")
{
	add_song("event:/soundtest/encore/ghoulscape", "Rotten Spaghetti - Loy");
	add_song("event:/soundtest/encore/ghoulscapesecret", "A Hidden Noodle - Loy");
}

if SUGARY_SPIRE
{
	with new JukeboxSection("Sugary Spire")
	{
		add_song("event:/soundtest/sugary/hub", "Welcome Back! - 101Undertale");
		add_song("event:/soundtest/sugary/crunchy", "Down-To-Noise - RodMod");
		add_song("event:/soundtest/sugary/entranceSN", "Pizzano's Obligatory Orchestral Play - PaperKitty");
		add_song("event:/soundtest/sugary/cottontown", "Steamy Cotton Candy - RodMod");
		add_song("event:/soundtest/sugary/clock", "Around The Gateau's Gears - RodMod");
		add_song("event:/soundtest/sugary/glucose", "Glucose Getaway - RodMod");
		add_song("event:/soundtest/sugary/escapeSN", "Blue Licorice - PaperKitty");
		add_song("event:/soundtest/sugary/lap2", "Sweet Release of Death - RodMod");
		add_song("event:/soundtest/sugary/lostchocolate", "Lost Chocolate - RodMod, Jessie Productions");
		add_song("event:/soundtest/sugary/foundchocolate", "Found Chocolate - Jessie Productions");
		add_song("event:/soundtest/sugary/sucrose", "Sugarcube Hailstorm - PaperKitty");
		add_song("event:/soundtest/sugary/pause", "Paused - Jessie Productions");
	
		add_separator();
	
		add_secretsong("event:/soundtest/sugary/secretcotton", "you've found a steamy surprise. - Loy", "RodMod");
		add_secretsong("event:/soundtest/sugary/secretswamp", "man's lost secret. - Loy", "Jessie Productions");
		add_secretsong("event:/soundtest/sugary/secretsucrose", "Sucrose Secret - Loy", "Unknown");
	}
}

// select automatically
if global.jukebox != noone
{
	sel.game = global.jukebox.sel.game;
	sel.song = global.jukebox.sel.song;
	
	var alt = global.jukebox.sel.alt;
	if alt >= 0
		sections[sel.game].songs[sel.song][0] = alt;
	
	create_transformation_tip(lstr("songchoicestop"), "songchoicestop");
}

scroll = -50;
textx = 0;

draw = function(curve)
{
	// background and disc
	var talpha = 1;
	
	draw_set_colour(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
	draw_set_alpha(1);
	draw_set_colour(c_white);
	
	var xscale = 2;
	if discanim >= .5
	{
		discrot = 0;
		xscale = lerp(0, 2, (discanim * 2) - 1);
	}
	else
		xscale = lerp(2, 0, discanim * 2);
	
	draw_sprite_ext(bg_jukeboxdisc, sel.game, 640, 280, xscale, 2, discrot, c_white, talpha * 0.8);
	
	// current song
	var song = sections[sel.game].songs[sel.song];
	if !is_string(song[0])
		song = song[song[0]];
	
	//trace(song);
	
	var ballsack = string_split(song[1], " - ", false, 1);
	var _palname = string_upper(ballsack[0]);
	var _paldesc = array_length(ballsack) > 1 ? ballsack[1] : "???";
	
	draw_set_alpha(charshift[2]);
	draw_set_align(fa_center, fa_bottom);
	draw_set_font(global.bigfont);
	draw_text_ext((SCREEN_WIDTH / 1.5) + random_range(-1, 1), SCREEN_HEIGHT - 250 + charshift[1], _palname, 32, 540);
	
	draw_set_valign(fa_top);
	draw_set_font(global.font_small);
	draw_text_ext(SCREEN_WIDTH / 1.5, SCREEN_HEIGHT - 240 + charshift[1], _paldesc, 16, 960 - 32);
	
	//draw_text_ext(SCREEN_WIDTH / 1.5, SCREEN_HEIGHT - 100 + charshift[1], concat("TRIVIA: ", song[2]), 16, 400);
	
	draw_set_alpha(1);
	
	// game names
	var sep = 640 / array_length(sections);
	var lerpish = 0.5;
	
	for(var i = 0; i < array_length(sections); i++)
	{
		if array_length(sections) > 1
			lerpish = i / (array_length(sections) - 1)
		
		draw_set_colour(sel.game == i ? c_white : c_gray);
		draw_text(lerp(sep, SCREEN_WIDTH - sep, i / (array_length(sections) - 1)), 32, sections[i].name);
	}
	
	// song list
	draw_set_halign(fa_left);
	draw_set_bounds(64 + charshift[0], 0, 364 + charshift[0], SCREEN_HEIGHT);
	
	var scroller = max((sel.song - 8) * 16, 0);
	for(var i = 0; i < array_length(sections[sel.game].songs); i++)
	{
		var yy = 128 + i * 16;
		yy -= scroller;
	
		if yy < 0
			continue;
		if yy > 540
			break;
	
		if yy <= 128
			draw_set_alpha((yy / 128) * talpha);
		if yy > 540 - 128
			draw_set_alpha(((540 - yy) / 128) * talpha);
		
		var temp_song = sections[sel.game].songs[i];
		if is_array(temp_song)
		{
			draw_set_colour(c_white);
			if !is_string(temp_song[0])
			{
				if array_length(temp_song) > 2
					draw_set_colour(c_yellow);
				temp_song = temp_song[temp_song[0]];
			}
			if sel.song != i
				draw_set_colour(merge_color(draw_get_colour(), c_black, 0.5));
			
			var ballsack = string_split(temp_song[1], " - ", false, 1);
			var str = string_replace_all(ballsack[0], "\n", " ");
			
			var textwidth = round(string_width(str) - 300);
			if sel.song == i
			{
				scroll++;
				if scroll >= textwidth + 50
					scroll = -50;
			}
			
			draw_text(64 + charshift[0] - (clamp(scroll, 0, max(textwidth, 0)) * (sel.song == i)), yy + textx, str);
		}
		else
		{
			// section
			
		}
	}
	draw_remove_bounds();
	
	draw_set_alpha(talpha);
	draw_sprite(spr_cursor, image_index, 64 - 36 + xo + charshift[0], 128 + 10 - scroller + sel.song * 16 + textx);
	
	// song position
	var pussyboy = false;
	var john = spr_jukebox_john_idle;
	var len = 0;
	
	/*
	draw_set_colour(c_gray);
	draw_rectangle(400, 350 + charshift[1], 400 + 480, 350 + 15 + charshift[1], false);
	draw_set_colour(c_white);
	draw_rectangle(400, 350 + charshift[1], 400 + pos, 350 + 15 + charshift[1], false);
	draw_circle(400 + pos, 350 + 15 / 2 + charshift[1], 15, false);
	draw_set_colour(c_black);
	draw_circle(400 + pos, 350 + 15 / 2 + charshift[1], 15, true);
	*/
	
	// disc pos is 640 280, fill is bar y + 5
	static dragging = false, mouse_x_prev = 0, buffer = 0, len = 1, pos = 0;
	
	var bar_wd = sprite_get_width(spr_timer_bar);
	var bar_ht = sprite_get_height(spr_timer_bar);
	var bar_x = floor(640 - bar_wd / 2);
	var bar_y = 350 + charshift[1];
	
	if global.jukebox != noone && song[0] == global.jukebox.name
	{
		len = fmod_event_get_length(global.jukebox.name);
		if --buffer <= 0
		{
			pos = fmod_event_instance_get_timeline_pos(global.jukebox.instance) / len;
			if !is_holiday(holiday.loy_birthday)
				john = spr_jukebox_john_active;
		}
		pussyboy = true;
	}
	else
	{
		len = 1;
		pos = 0;
	}
	
	if pussyboy
	{
		// dragging
		if point_in_rectangle(mouse_x_gui, mouse_y_gui, bar_x, bar_y, bar_x + bar_wd, bar_y + bar_ht)
		&& mouse_check_button_pressed(mb_left)
			dragging = true;
		if !mouse_check_button(mb_left)
			dragging = false;
		
		if dragging
		{
			buffer = 15;
			
			var pos_raw = (mouse_x_gui - bar_x) / bar_wd;
			pos = clamp((mouse_x_gui - bar_x) / bar_wd, 0, 1);
			
			if mouse_x_prev != mouse_x_gui
			{
				fmod_event_instance_play(global.jukebox.instance);
				fmod_event_instance_set_timeline_pos(global.jukebox.instance, pos * len);
				
				if pos_raw >= 0 && pos_raw <= 1
					discrot -= (mouse_x_gui - mouse_x_prev) * 2;
			}
			mouse_x_prev = mouse_x_gui;
		}
		else
		{
			discrot -= 1;
			if is_holiday(holiday.loy_birthday)
				discrot += irandom_range(-10, 10);
		}
	}
	
	draw_set_alpha(charshift[2]);
	
	draw_set_bounds(bar_x + 6, bar_y + 6, lerp(bar_x + 6, bar_x + bar_wd - 6, pos), bar_y + bar_ht - 6, true);
	draw_sprite_tiled(spr_jukebox_barfill, 0, -current_time / 100, bar_y);
	draw_remove_bounds();
	
	toggle_alphafix(false);
	
	draw_sprite(spr_timer_bar, 0, bar_x, bar_y);
	draw_sprite(john, image_index, lerp(bar_x + 6, bar_x + bar_wd - 6, pos), bar_y + 13);
	
	draw_set_alpha(1);
	
	draw_set_align(1, 1);
	draw_set_colour(c_white);
	draw_set_font(global.bigfont);
	
	var seconds = round((pos * len) / 1000);
	var minutes = floor(seconds / 60);
	seconds = seconds % 60;
	
	draw_text(bar_x + 153, bar_y + 18 - (font_get_offset(global.bigfont).y / 2), concat(minutes, ":", seconds < 10 ? "0" : "", seconds));
}
xo = 0;
