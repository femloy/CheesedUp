if !in_arena
	exit;

switch state
{
	// START!
    case states.normal:
        global.hp = 8;
        before_damage = global.peppino_damage;
		
        if wave >= ragestart
        {
            fury_rounds++;
            with create_transformation_tip(embed_value_string(lstr("afom_furyround"), [fury_rounds]))
				color = #DF3300;
        }
        else
            create_transformation_tip(embed_value_string(lstr("afom_round"), [wave + 1]));
		
        sound_play_3d("event:/sfx/misc/secretfound", x, y);
        state = states.arenaround;
        round_count = 10;
		
        with obj_arenagate
			close();
		with obj_arenadoor
        {
            for (var i = 0; i <= other.maxwave; i++)
				objectlist[i] = [choose(obj_sausageman, obj_thug_red, obj_thug_red, obj_thug_blue, obj_thug_blue, obj_thug_green, obj_thug_green, obj_ninja, obj_ninja, obj_golfdemon)];
        }
        break;
	
	// break time!
    case states.arenaround:
        if round_count-- <= 0
            state = states.spawnenemy;
        break;
	
	// spawning...
    case states.spawnenemy:
        if !ds_list_empty(baddielist)
        {
            for (var i = 0; i < ds_list_size(baddielist); i++)
            {
                var b = baddielist[| i];
                if b[0] == wave
                {
                    instance_activate_object(b[1]);
                    if instance_exists(b[1])
                    {
                        with instance_create(b[1].x, b[1].y, obj_arena_pizzaportal)
                        {
                            stored_id = b[1];
                            alarm[0] = other.round_max;
                        }
                        instance_deactivate_object(b[1]);
                    }
                }
                else
                    instance_deactivate_object(b[1]);
            }
        }
		
        //wave_minutes = minutes;
        //wave_seconds = seconds;
		
        round_count = round_max;
        state = states.arena;
		
        with obj_arenadoor
        {
            wave = other.wave;
            alarm[0] = 10;
            finish = 0;
			
            if wave >= array_length(objectlist) or objectlist[wave] == noone
            {
                alarm[0] = -1;
                wave = 0;
            }
        }
        break
	
	// FIGHT!
    case states.arena:
        var finish = true;
		with obj_baddie
		{
			if object_index != obj_junkNEW
				finish = false;
		}
        with obj_arenadoor
        {
            if !self.finish
                finish = false;
        }
		
        if finish && !instance_exists(obj_arena_pizzaportal)
        {
            with obj_bigcollect
            {
                if arena
                    image_alpha = 1;
            }
            with obj_collect
            {
                if arena
                    image_alpha = 1;
            }
			
			// wave text
			wave++;
			if wave >= waves + 1
            {
				with create_transformation_tip(lstr("afom_finalround"))
					color = #F7F700;
                sound_play("event:/sfx/voice/vigiduel");
            }
            else if wave < ragestart
            {
                create_transformation_tip(embed_value_string(lstr("afom_round"), [wave + 1]));
                sound_play("event:/sfx/voice/vigiduel");
            }
            else
            {
				fury_rounds++;
                with create_transformation_tip(embed_value_string(lstr("afom_furyround"), [fury_rounds]))
					color = #DF3300;
                sound_play("event:/sfx/voice/vigiduel");
            }
			
			// done
            if wave > waves + 1
            {
                after_damage = global.peppino_damage;
                var damage = before_damage - after_damage;
				
                create_transformation_tip(lstr("afom_endarena"), -4, c_white);
				
				fmod_event_instance_set_parameter(global.snd_golfjingle, "state", 3, true);
                fmod_event_instance_play(global.snd_golfjingle);
				
				// damage compensation, I guess
                if damage >= waves * -1
                {
                    //s = 3;
                    global.collect += 500;
                    sound_play("event:/sfx/misc/collect");
                }
                //else
                //    s = 0;
				
                global.kungfu = false;
                state = states.crouch;
            }
            else
            {
                state = states.spawnenemy;
                round_count = round_max;
            }
        }
        break
	
	// congratulation
    case states.crouch:
        with obj_arenagate
			open();
        with obj_arenaspawn
            instance_destroy();
        break
}

if state != states.normal && state != states.arenaintro
    visible = false;
global.baddierage = wave >= 23;
