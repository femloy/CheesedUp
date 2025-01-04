var panicID = argument0;
var event = argument1;

if event == "event:/sugary/music/panic" && !global.lap
{
    // Running out of time
    // ... but the song is unfinished, so do nothing
    
    /*
    secs = 0;
    if global.fill <= secs * 12
        fmod_event_instance_set_parameter(panicID, "state", 1, true);
    */
    return false;
}
