global.secretfound++;

var val = min(global.secretfound, global.afom_secrets);
var txt = lang_get_value(val == 1 ? "secret_text1_mod" : "secret_text2_mod");			

txt = embed_value_string(txt, [val, global.afom_secrets]);
create_transformation_tip(txt);

sound_play("event:/sfx/misc/secretfound");
instance_destroy();
