#define execute_program_pipe
/// (command, flags = *stdout|stderr)->[status:int, exitcode:int, output:string]
var l_command = argument[0];
var l_flags = argument_count > 1 ? argument[1] : program_pipe_flags_capture_stdout|program_pipe_flags_capture_stderr;
gml_pragma("global", "global.execute_program_pipe_buf = undefined");
var l_buf = global.execute_program_pipe_buf;
if (l_buf == undefined) {
	l_buf = buffer_create(8, buffer_fixed, 1);
	global.execute_program_pipe_buf = l_buf;
}
buffer_poke(l_buf, 0, buffer_s32, l_flags);
var l_str = execute_program_pipe_raw(l_command, buffer_get_address(l_buf));
return [
	buffer_peek(l_buf, 0, buffer_s32),
	buffer_peek(l_buf, 4, buffer_s32),
	l_str,
];