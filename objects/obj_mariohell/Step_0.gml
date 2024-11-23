/// @description cutscene progression
live_auto_call;

scr_menu_getinput();
with dialog
{
	if index >= array_length(array)
	{
		active = false;
		if anim_t > 0
		{
			if anim_t == 1
				sound_play("event:/modded/sfx/diagclose");
			anim_t = Approach(anim_t, 0, 0.15);
		}
	}
	else if active && anim_t < 1
	{
		if anim_t == 0
			sound_play("event:/modded/sfx/diagopen");
		anim_t = Approach(anim_t, 1, 0.1);
	}
	else if active
	{
		var str = array[index];
		if c <= string_length(str)
		{
			if --timer <= 0
			{
				c += 1;
				timer = 2;
				
				var char = string_char_at(str, c);
				switch char
				{
					default:
						fmod_event_instance_play(other.txtsnd);
						break;
					
					case " ":
						break;
					
					case "^":
						char = string_char_at(str, ++c);
						c++;
						
						if string_is_number(char)
							timer = real(char) * 6;
						break;
					
					case "\\":
						c++; // \\
						c++; // e
						c++; // 0
						break;
					
					case "%":
						c = 0;
						timer = 0;
						index++;
						break;
				}
			}
		}
		else if other.key_jump or keyboard_check_pressed(vk_enter)
		{
			c = 0;
			timer = 0;
			index++;
		}
	}
}

/*
if keyboard_check_pressed(ord("R"))
{
	fmod_event_instance_stop(music, true);
	fmod_event_instance_set_pitch(music, 1);
	image_blend = c_white;
	y = 0;
	image_xscale = 1;
	image_yscale = 1;
	con = 0;
	alarm[0] = room_speed * 3;
	create_dialog([]);
}
*/

if con == 1
{
	con = 2;
	alarm[0] = room_speed * 2;
}

if con == 3
{
	con = 4;
	create_dialog([
		lstr("mario_1"), // Greetings.
		lstr("mario_2") // It is I the Mario Yes the Mario
	]);
}

if con == 4 && dialog.anim_t <= 0 && dialog.active == false
{
	con = 5;
	fmod_event_instance_play(music);
	alarm[0] = room_speed * 3;
}

if con == 6
{
	con = 7;
	
	/*
	create_dialog([
		"Listen to Me.^2 We have to talk about something Quite Fucked.",
		"The \"Super Bo Noise\" community have been quite the rascals recently!",
		"This started recently when there was a stream leading up to its release.",
		"Someone joined the chat with a Loy impersonator account.^3\nThe chat went crazy, shittalking Loy immediately.",
		"That is^4 \\cRRude\\c0",
		"This lead to Loy banning any talk about Bo Noise in the Cheesed Up server.",
		"That should've been the end of it,^2 but No...^4\nIt had to get even more annoying.",
		"The next day these \\eSdumbasses\\e0 started raiding the comments of various\nCheesed Up videos,^1 spamming...",
		"\\eC\"BO NOISE IS THE BEST PIZZA TOWER MOD EVER\"",
		"\\eC\"BO NOISE IS BETTER THAN LOYPOLL\"",
		"\\eC\"SUPER BO NOISE IS BETTER THAN CHEESED UP GO PLAY IT\"",
		"\\eC\"LOYPOLL IS A BAD PIZZA TOWER MOD CREATOR\"",
		"This^5 \\eSdoes not^5 \\cRplease Mario\\c0.",
		"...",
		"Now you Listen to Me",
		"I do not condone the harassment of any of these individuals.^2\nAlthough they dickride Loy \\cRfucking\\c0 daily they're pretty much just dumb kids.",
		"This is merely to shed light on how corrupted this community is.^3\nHow disgustingly toxic it can get.^3 And NOBODY does anything about it.",
		"Loy has apologized countless times.^2 They made several documents,\neven a website explaining it. They've tried everything but no one cares.",
		"This whole drama has been constant for four years, nearing five at this point.^3\nDoes that sound like a healthy fucking community to you?",
		"To be harassing a child over the internet for this long?^3\nThis shows no signs of ever stopping,^1 and it's honestly depressing.",
		"All we ask^2 is for people to stop mentioning Loy anywhere.^3\nThey just want to be left alone.",
		"No conflicts would ever happen if people just stopped talking about it.^3\nSeriously, that's the only reason any of this worthless drama happens.^3\nSounds easily avoidable doesn't it?",
		"...",
		"Either way, the Internet is a horrible place.^2 I don't expect anything good\nhappening any time soon.",
		"Just know that it's extremely easy to solve problems like these.^3\nPeople just choose not to.^2 Guess it's more fun that way, eh?",
		"Any of these statements are always chalked up to manipulation.^2 Because once\nsomeone fucks up ONCE, they cannot redeem themselves, ever.^3\nThere's no such thing as^2 \"growing up\".",
		"...^3 Alright...",
	]);
	*/
	
	if character == ""
	{
		create_dialog([
			lstr("mario_11"), // you know how to spawn me in
			lstr("mario_12"), // im not impressed
			lstr("mario_13"), // let me tell you a secret
		]);
	}
	else
	{
		create_dialog([
			lstr("mario_3"), // Listen to me
			embed_value_string(lstr("mario_4"), [scr_charactername(character, character == "G")]), // that campaign doesnt exist
			lstr("mario_5"), // that blunder you did
			lstr("mario_6"), // does not please mario
			lstr("mario_7") // ...
		]);
	}
}

if con == 7 && dialog.anim_t <= 0 && dialog.active == false
{
	if alarm[0] == -1
		alarm[0] = room_speed;
}
if con == 8
{
	con = 9;
	
	/*
	create_dialog([
		"\\eS\\c0Listen to me.",
		"If you involve yourself in this shit...",
		"Mario \\eSWILL\\e0 touch you.",
		"That's-a right!",
		"Mario is GOING TO PUT HIS WHOLE FIST AAAALL THE WA%"
	]);
	*/
	
	create_dialog([
		lstr("mario_8"), // LISTEN TO ME
		lstr("mario_9"), // MARIO IS GONNA TOUCH YOU
		lstr("mario_10") // ^^^ again but it cuts off
	]);
}

if con == 9
{
	image_xscale = lerp(image_xscale, 3, 0.05);
	image_yscale = lerp(image_yscale, 3, 0.05);
	y = lerp(y, 360, 0.05);
	image_blend = merge_color(image_blend, merge_color(c_white, c_red, 0.5), 0.05);
	
	fmod_event_instance_set_pitch(music, 0.5);
	
	if !dialog.active
	{
		con = 10;
		alarm[0] = room_speed;
		fmod_event_instance_stop(music, true);
	}
}
if con == 11
	instance_destroy();
