live_auto_call;

if spawned_in
	exit;

image_cleanup();
pto_textbox_destroy();
with obj_shell
	WC_bindsenabled = true;
