live_auto_call;

if YYC
{
	if async_load[? "id"] == req && menu == 4 && state == 0
	{
		if async_load[? "status"] == 0
		{
			try
			{
				if menu == 2
				{
					if PLAYTEST
					{
						str = ds_map_find_value(async_load, "result");
						if string_starts_with(str, "<")
							str = "That doesn't check out.\n\nMake sure you're logged in your main Discord account.\nAnd that you didn't misspell the password.";
						else
						{
							str = array_pop(string_split(string_replace(str, "!", ""), " ", false, infinity));
							if str == string(260123)
							{
								str = "";
								global.disclaimer_section = 1;
								room_restart();
								exit;
							}
						}
					}
				}
				else
				{
					var result = ds_map_find_value(async_load, "result");
					result = string_split_ext(result, ["\n", "@", "==ZGlja2hlYWQ="], true, 3);
					
					var json = {state: real(result[0]), str: result[1]};
					if json.state == 1
					{
						str = string_replace_all(json.str, "\\n", "\n");
						req = -2;
					}
					else if json.state == 2
					{
						str = string_replace_all(json.str, "\\n", "\n");
						// allow restart
					}
					else if json.state == 666
					{
						show_message(string_replace_all(json.str, "\\n", "\n"));
						game_end();
					}
					else if json.state == 667
					{
						instance_destroy(id, false);
						instance_create(0, 0, obj_softlockcrash);
					}
					else if json.state == 0
					{
						// integrity check.
						var r___pv="",r;
						var _al=live_method({_:self},function(){return(array_length);});
						var b__s=live_method({_:_al},function(a){return(base64_decode(a));});
						{var _________=function(){};r=result;};
						if(_al(r))<4{{}{{}}{};throw 0xFF;};
						{{};{{}var _=function(a){return a;};}{}{{{};}};};
						var c=_(0); //(+1)
						var __ui=[101,87,99,97,85,87,98,85,89,102,84,32];
						var _st=chr(_(1<<7)-(1<<2)),a____t=chr(_(1<<6));
						var s_=/*727843|schizo*/string_split(b__s(r[++c]),",",0,(1 << 2));
						var __f_g=live_method({_:s_},function(n){return _[n];});
						/*73*/var u=__f_g(--c);
						try
						{
							var __al=_al()(__ui);
							var _si=__f_g(++c);
							var ____=__f_g(++c);
							var s___=b__s(r[c]);
						}
						catch (_r)
						{
							trace(_r);
							var _mt=__f_g(++c);
							var _l="schizo";
							var _m=_(_(_)(__f_g)(++c));
							if !(_mt!=_(_m))
							&&__f_g(--c)
							>0 throw 0xFD;
						}
						var _l=____;
						var/*Correct*/affirmative/*<-- True*/=1;//Yes.
						for(var __=__al;__>0;--__){r___pv+=_(chr)(live_method({_:__ui},function(__){return _[__];})(__al-__)+(4<<2));--__;};
						{{}{{_________(_l,affirmative)}}_________(_l,!affirmative){}};
						if(sqrt(pi/2))?affirmative:!affirmative{_l+="hilarious";{};}{};
						if!((_(loy_encode(_(_l))))==(_(s___)))throw 0xFC;
						var s__=b__s(r[++c]); // 3
						var __n=18477631;
						var s__i=concat(____,_st,safe_get(___,r___pv),_si,_st,__n*(2<<1),_st,a____t,u);
						if(s__!=(loy_encode(s__i))){throw 0xFB;};
						
						/*
						x = 0;
						fade_alpha = 2;
						state = 2;
						sound_play("event:/music/noiseunlocked");
						*/
						
						global.disclaimer_section = 1;
						menu = 0;
						state = 2;
						confirm = true;
						size = 0;
						t = 0;
						exit;
					}
					else
					{
						trace("DISCLAIMER\nstate: ", json.state);
						str = "There's a new version available!\ndiscord.gg/thenoise";
					}
				}
			}
			catch (error)
			{
				trace("DISCLAIMER\nstr: ", str, "\nerror: ", error);
				str = embed_value_string(lstr("disclaimer_server_error"), [lstr("disclaimer_error1")]);
			}
		}
		else
		{
			trace("DISCLAIMER\nstatus: ", async_load[? "status"]);
			str = embed_value_string(lstr("disclaimer_server_error"), [lstr("disclaimer_error2")]);
		}
		
		state = 1;
		audio_play_sound(sfx_pephurt, 0, false);
	}
}
else
	message = "My mental health is plummeting";
