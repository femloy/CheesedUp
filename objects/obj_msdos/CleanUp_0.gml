if surface_exists(surf)
	surface_free(surf);
if surface_exists(bordersurf)
	surface_free(bordersurf);
	
close_menu();
with obj_shell
	WC_bindsenabled = true;
