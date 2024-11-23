switch(async_load[?"event_type"])
{
	case FMOD_TIMELINE_MARKER_CALLBACK:
		if SUGARY_SPIRE
		{
			if (room == sucrose_1 || room == sucrose_2) && (async_load[?"name"] == "Sky Wake" || async_load[?"name"] == "Sky Active")
				event_user(0);
		}
		//trace($"name: {async_load[?"name"]} position:{async_load[?"position"]}");
		break;
}
