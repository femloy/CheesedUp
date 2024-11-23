if MOD.OldLevels
	instance_create_unique(0, 0, obj_ghostcollectibles);
if in_saveroom() or instance_exists(obj_randomsecret) or global.snickchallenge
	exit;

global.secretfound++;

var count = 3;
if MOD.OldLevels
	count = 6;
if global.leveltosave == "etb"
	count = 2;

if global.hud == hudstyles.final
{
	var val = min(global.secretfound, count);
	var txt = lang_get_value(val == 1 ? "secret_text1_mod" : "secret_text2_mod");			

	txt = embed_value_string(txt, [val, count]);
	create_transformation_tip(txt);
}
else
{
	var val = min(global.secretfound, count);
	var txt = lstr(val == 1 ? "message_secret1" : "message_secret2");

	txt = embed_value_string(txt, [val, count]);
	old_hud_message(txt, 150);
}

sound_play("event:/sfx/misc/secretfound");
add_saveroom();
