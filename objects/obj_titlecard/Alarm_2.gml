/// @description add a noise head
if noisehead_pos > array_length(noisehead) - 1
	exit;

alarm[2] = noisespot_buffermax;
var head = noisehead[noisehead_pos++];
head.visible = true;
head.visual_scale = 2;
trace("Displaying head: ", head);
sound_play(noisehead_sound);
