live_auto_call;

substate = 0;
state = 0;

sel = 0;
sel2 = 0;
sel3 = 1;

image_alpha = 0;
image_speed = 0.35;

tip_text = "";
tip_text_prev = "";
tip = noone;

x1 = 200;
x2 = SCREEN_WIDTH - x1;

hand_spr = spr_grabbiehand_idle;
hand_x = 200;
hand_y = 130;

grab_text = false;

saves = [];
saves_current = [{
	type: 0,
	path: game_save_id + "saveData.ini"
}];

for(var i = 0; i < 3; i++)
{
	array_push(saves_current, {
		type: 1,
		path: concat(game_save_id, "saves/saveData", i + 1, ".ini"),
		slot: i,
		sandbox: true,
		started: global.game[i].started,
	});
}
for(var i = 0; i < 3; i++)
{
	array_push(saves_current, {
		type: 1,
		path: concat(game_save_id, "saves/saveData", i + 1, "S.ini"),
		slot: i,
		sandbox: false,
		started: global.story_game[i].started
	});
}

var path = environment_get_variable("APPDATA") + "/PizzaTower_GM2";
if file_exists(path + "/saveData.ini")
{
	ini_open(path + "/saveData.ini");
	var s = {
		type: 0,
		path: path + "/saveData.ini",
		ptt: ini_section_exists("Modded"),
		swapmode: ini_read_real("Game", "swapmode", false),
		clothes: 0
	};
	var unlocks = ["unfunny", "money", "sage", "blood", "tv", "dark", "shitty", "golden", "garish", "mooney",
		"funny", "itchy", "pizza", "stripes", "goldemanne", "bones", "pp", "war", "john",
		"candy", "bloodstained", "bat", "pumpkin", "fur", "flesh",
		"boise", "roise", "poise", "reverse", "critic", "outlaw", "antidoise", "flesheater", "super", "porcupine", "feminine", "realdoise", "forest",
		"racer", "comedian", "banana", "noiseTV", "madman", "bubbly", "welldone", "grannykisses", "towerguy"];
	for(var i = 0; i < array_length(unlocks); i++)
	{
		if ini_read_real("Palettes", unlocks[i], false)
			s.clothes++;
	}
	array_push(saves, s);
	ini_close();
}

draw_pt_save = function(save, xx, yy)
{
	var this = saves[sel];
	switch this.type
	{
		case 0:
			draw_set_font(lfnt("bigfont"));
			draw_text(xx, yy, lstr("transfer_settings"));
			yy += 32 + 16;
			
			draw_set_font(lfnt("font_small"));
			if this.ptt
			{
				draw_text(xx, yy, lstr("transfer_ptt"));
				yy += 20;
			}
			if this.swapmode
			{
				draw_text(xx, yy, lstr("transfer_swap"));
				yy += 20;
			}
			draw_text(xx, yy, embed_value_string(lstr("transfer_clothes"), [this.clothes]));
			yy += 20;
			
			break;
		case 1:
			draw_set_font(lfnt("bigfont"));
			draw_text(xx, yy, concat(this.character == "N" ? "NOISE" : "PEPPINO", " ", this.slot + 1));
			yy += 32 + 16;
			
			draw_set_font(lfnt("font_small"));
			
			draw_text(xx, yy, scr_get_timer_string(this.minutes, this.seconds, true));
			yy += 20;
			draw_text(xx, yy, string_replace(lstr("transfer_completion"), "$", this.percent));
			
			if this.finalrank != ""
			{
				var _i = 0;
				switch this.finalrank
				{
					case "confused": _i = 0; break;
			        case "quick": _i = 1; break;
			        case "officer": _i = 2; break;
			        case "yousuck": _i = 3; break;
			        case "nojudgement": _i = 4; break;
			        case "notbad": _i = 5; break;
			        case "wow": _i = 6; break;
			        case "holyshit": _i = 7; break;
				}
				
				yy += 50;
				lang_draw_sprite(this.character == "N" ? spr_menu_finaljudgementN : spr_menu_finaljudgement, _i, xx, yy);
				yy += 20;
			}
			yy += 20;
			break;
	}
	return yy;
}

for(var i = 0; i < 3; i++)
{
	var file = concat(path, "/saves/saveData", i + 1, ".ini");
	if file_exists(file)
	{
		ini_open(file);
		array_push(saves,
		{
			type: 1,
			path: file,
			slot: i,
			character: "P",
			
			percent: ini_read_real("Game", "percent", 0),
			minutes: ini_read_real("Game", "minutes", 0),
			seconds: ini_read_real("Game", "seconds", 0),
			finalrank: ini_read_string("Game", "finalrank", "")
		});
		ini_close();
	}
}
for(var i = 0; i < 3; i++)
{
	var file = concat(path, "/saves/saveData", i + 1, "N.ini");
	if file_exists(file)
	{
		ini_open(file);
		array_push(saves,
		{
			type: 1,
			path: file,
			slot: i,
			character: "N",
			
			percent: ini_read_real("Game", "percent", 0),
			minutes: ini_read_real("Game", "minutes", 0),
			seconds: ini_read_real("Game", "seconds", 0),
			finalrank: ini_read_string("Game", "finalrank", "")
		});
		ini_close();
	}
}
