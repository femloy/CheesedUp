ptt {

switch async_load[? "id"]
{
	case connection.tcp:
		net_tcp(async_load);
		break;
	
	case connection.udp:
		net_udp(async_load);
		break;
	
	default:
		net_log($"Unknown socket id: ${async_load[? "id"]}");
		break;
}

}
