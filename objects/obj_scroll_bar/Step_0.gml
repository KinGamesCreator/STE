/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if global.interact and mouse_check_button_pressed(mb_left) and collision_point(mouse_x,mouse_y,id,1,0) {
	pos_ant = [x,window_mouse_get_x()*(room_width/window_get_width())];
	pressed = true;
}

if (pressed) {
	if mouse_check_button_released(mb_left) or !global.interact {
		pressed = false;
	} else {
		x = pos_ant[0] + (window_mouse_get_x()*(room_width/window_get_width()) - pos_ant[1]);
		if (x < 0) x = 0;
		if (x > (room_width - sprite_width)) x = (room_width - sprite_width);
		obj_pista.x = round(-x * ((array_length(global.notes[0]) * 6) / room_width))
	}
} else {
	x = abs(obj_pista.x) / ((array_length(global.notes[0]) * 6) / room_width);
}

y = room_height - 12;
