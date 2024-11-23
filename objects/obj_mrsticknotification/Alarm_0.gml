start = true;

var text = "mrmooney";
if sprite_index != spr_mrmooney_notification && sprite_index != spr_noisettenotification && sprite_index != spr_noisetterabbitTV
	text = "mrstick";
else if sprite_index == spr_noisettenotification
	text = "noisette";
else if sprite_index == spr_noisetterabbitTV
	text = "noisetterabbit";

create_transformation_tip(lstr(concat(text, "notification")));
old_hud_message(string_upper(lstr(concat("message_", text))));
