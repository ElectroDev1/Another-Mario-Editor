function window_command_toggle(argument0) {
	var cmd = argument0;
	var val = !window_command_get_active(cmd);
	window_command_set_active(cmd, val);



}
