switch async_load[? "event_type"]
{
	case FMOD_PLAYBACK_END_CALLBACK:
		//trace($"GML: FMOD AUDIO END: {async_load[?"id"]}\"{async_load[?"path"]}\"");
		break;
	case FMOD_TIMELINE_MARKER_CALLBACK:
		//trace($"name: {async_load[?"name"]} position:{async_load[?"position"]}");
		break;
}
