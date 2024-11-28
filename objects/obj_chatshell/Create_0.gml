open = false;
message_box = "";
messages = ds_list_create();

names = [
	"Benjamin Franklin",
	"George Washington",
	"Yankee Doodle",
	"King George",
	"Alexander Hamilton",
	"Adolf Hitler",
	"Joseph Stalin",
];

send_message = function(msg) {
	net_send_tcp("chat_message", {
		name: names[random_range(0, array_length(names))],
		message: msg,
	})
}