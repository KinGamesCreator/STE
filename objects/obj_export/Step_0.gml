/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if keyboard_check_pressed(vk_enter) {
	script_execute(modules[selection].func);
	global.interact = true;
	instance_destroy();
}

if keyboard_check_pressed(vk_escape) {
	global.interact = true;
	instance_destroy();
}

selection += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

if selection < 0 {
	selection = array_length(modules)-1;
} else if selection = array_length(modules) {
	selection = 0;
}

if (anim != selection) {
	
	var dire = sign(selection - anim);
	
	anim += 0.2 * dire;
	
	if dire != sign(selection - anim) {
		anim = selection;
	}
}