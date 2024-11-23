if buffer > 0
	buffer--;

player = instance_place(x, y, obj_player);
if (player && place_meeting(x, y, player) && player.state != states.chainsaw && player.state != states.backtohub) or active
{
	if buffer > 0
		image_alpha = 0;
	
	if !revealed
	{
		revealed = true;
		add_saveroom();
		
		if REMIX && buffer <= 0
		{
			sound_stop(sfx_collectpizza);
			//fmod_event_instance_set_parameter(global.snd_secretwall, "state", check_sugarychar(), false);
			fmod_event_instance_play(global.snd_secretwall);
		}
	}
	
	with obj_secrettile
	{
		if distance_to_object(other) <= 1
		{
			var found = false;
			with obj_secrettile
			{
				if player
					found = true;
			}
			if found
			{
				if !revealed
				{
					if other.buffer > 0
						image_alpha = 0;
				
					revealed = true;
					add_saveroom();
				}
				active = true;
			}
		}
	}
	
	depth = max(-8, desireddepth);
	image_alpha = Approach(image_alpha, 0, 0.05);
}
else if !(player && player.state == states.chainsaw)
{
	depth = desireddepth;
	image_alpha = Approach(image_alpha, 1, 0.05);
}
active = false;
