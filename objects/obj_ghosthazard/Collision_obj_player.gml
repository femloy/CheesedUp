if instance_exists(obj_genericdeath)
	exit;

with other
{
	if character == "V"
	{
		if instakillmove
			instance_destroy(other);
		else
			scr_hurtplayer(id);
	}
	else if !isgustavo && state != states.ghost && state != states.ghostpossess && state != states.johnghost && state != states.actor && state != states.parry && state != states.gotoplayer
	{
		scr_losepoints();
		if character != "N"
			create_transformation_tip(lang_get_value("ghosttip"), "ghost");
		else
			create_transformation_tip(lang_get_value("ghosttipN"), "ghostN");
		sound_play("event:/sfx/pep/ghostintro");
		grav /= 2;
		state = states.ghost;
		movespeed = hsp;
		ghostdash = false;
		ghostdashbuffer = 0;
		ghostpepper = 0;
		ghostangle = 0;
		ghosttimer = 0;
		sprite_index = spr_ghostidle;
		
		var xscale = REMIX ? self.xscale : image_xscale;
		with instance_create(x, y, obj_sausageman_dead)
		{
			hsp = xscale * 3;
			image_xscale = -xscale;
			sprite_index = other.spr_dead;
			spr_palette = other.spr_palette;
			paletteselect = other.paletteselect;
			oldpalettetexture = global.palettetexture;
		}
		
		other.debris = false;
	}
}
