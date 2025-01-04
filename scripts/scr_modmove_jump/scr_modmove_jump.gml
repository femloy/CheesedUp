function scr_modmove_jump()
{
	input_buffer_jump = 0;
	
	if state != states.ratmountgrind && state != states.ladder && state != states.balloon
		scr_fmod_soundeffect(jumpsnd, x, y);
	
	if sprite_index != spr_shotgunshoot
	{
		sprite_index = spr_jump;
		if shotgunAnim
			sprite_index = spr_shotgunjump;
		else if global.pistol && character != "N"
			sprite_index = spr_player_pistoljump1;
		image_index = 0;
	}
	
	if grounded
	{
		particle_set_scale(part.highjumpcloud2, xscale, 1);
		create_particle(x, y, part.highjumpcloud2, 0);
	}
	
	vsp = IT_jumpspeed();
	state = states.jump;
	jumpAnim = true;
	jumpstop = false;
}
