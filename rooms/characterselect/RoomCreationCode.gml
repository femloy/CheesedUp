global.roommessage = "PICK A PIZZA GUY";
//gameframe_caption_text = lstr("caption_characterselect");

while global.currentsavefile > 2 or global.currentsavefile < 0
	global.currentsavefile = get_integer("Savefile slot", 2);
