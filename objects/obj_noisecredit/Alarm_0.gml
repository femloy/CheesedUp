if (heads_pos >= array_length(heads))
	exit;

alarm[0] = 10;
heads[heads_pos].visible = true;
heads[heads_pos].scale = 2;
heads_pos++;
sound_play("event:/sfx/playerN/titlecard");
