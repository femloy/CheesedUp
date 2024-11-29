live_auto_call;

instance_list = ds_list_create();
sound_pause_all(true);
scr_pause_deactivate_objects(false);
instance_deactivate_object(obj_globaltimer);
depth = -9999;

draw_set_font(lang_get_font("creditsfont"));
skiptext = scr_compile_icon_text(lang_get_value("menu_skip"));
text_buffer = 0;
showtext = false;

song = fmod_event_create_instance("event:/modded/credits");
image_speed = 0;
x = 0;
y = 0;

con = 0;
t = 0;
flash = 0;

add_header = function(str)
{
	builder_y += 42;
	array_push(array, {
		text: str,
		type: 1,
		y: builder_y
	});
	builder_y += 42;
}
add_person = function(str)
{
	array_push(array, {
		text: str,
		type: 0,
		y: builder_y
	});
	builder_y += 24;
}

add_credits = function()
{
	array = [];
	builder_y = 600;
	
	/*
	add_header("CREDITS (WIP)");
	builder_y += 100;
	
	add_header("Coders");
	add_person("Loy");
	
	add_header("Spriters");
	add_person("Red");
	add_person("Tictorian");
	add_person("Ven");
	
	add_header("Music & SFX");
	add_person("Loy");
	
	add_header("Layouts");
	add_person("duuzy");
	add_person("Tictorian (TBA)");
	add_person("Loy (QA)");
	
	add_header("Other Mod Content");
	add_person("Pizza Tower Online");
	add_person("LAP HELL + Egg's Lap Mod");
	add_person("Create Your Own Pizza");
	
	add_header("Contributors");
	add_person("duuzy");
	add_person("rose");
	add_person("ValeraDX");
	add_person("discord.gg/thenoise (Cosmetics)");
	
	add_header("Playtesters");
	add_person("Ruby");
	add_person("Red");
	add_person("duuzy");
	add_person("madswag");
	add_person("maksimka");
	add_person("Ga1ax1an");
	add_person("Kit");
	add_person("avery");
	add_person("Camille");
	add_person("nilah");
	add_person("TerrAvery");
	add_person("epsil_on");
	add_person("Azul");

	add_header("Sorry I made the song too long");
	builder_y -= 42;
	add_header("so here's a list of fake people");
	for(var i = 1; i < 3000; i++)
		add_person($"EggFucker{i}");
	*/
}
add_credits();
