/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (array_length(global.notes) > 10) {
	jump_limit = jump_tracks + 11;
} else {
	jump_limit = array_length(global.notes);
}

if global.interact {
	for (var i = jump_tracks; i < jump_limit; i++) {
	
		for (var k = abs(round(x/6)); k < array_length(global.notes[i]); k++) {
			if (global.notes[i][k] != -1) and point_in_rectangle(mouse_x,mouse_y,x+6*k,y+6*(i-jump_tracks),x+5+6*k,y+5+6*(i-jump_tracks)) {
				if mouse_check_button_pressed(mb_left) {
					if !global.notes[i][k] {
						global.notes[i][k] = 1;
					}
					global.selected = [i,k];
				} else if mouse_check_button_pressed(mb_right) {
					global.selected = [-1,-1];
					for (var j = 1; j < global.notes[i][k]; j++) {
						global.notes[i][k+j] = 0;
					}
					global.notes[i][k] = 0;
				}
			}
			if global.notes[i][k] {
				k += global.notes[i][k] - 1;
			} else if (global.notes[i][k] = -1) {
				var distance = 1;
				while (global.notes[i][k+distance] = -1) {
					distance++;
				}
				k += distance - 1;
			}
			if (k*6 > (room_width - x)) break;
		}
	
	}
}

for (var i = 0; i < array_length(rythms);i++) {
	if (rythms[i] > 0) {
		rythms[i] -= 0.01;
		if (rythms[i] < 0) {
			rythms[i] = 0;
		}
	}
}

if global.interact and mouse_check_button_pressed(mb_middle) and point_in_rectangle(mouse_x,mouse_y,0,y,216,y+5+6*(jump_limit-jump_tracks-1)) {
	pos_ant = [x,mouse_x];
	pressed = true;
}

if (pressed) {
	if mouse_check_button_released(mb_middle) or !global.interact {
		pressed = false;
	} else {
		x = pos_ant[0] + (mouse_x - pos_ant[1]);
		if (x > 0) x = 0;
		if x < -(array_length(global.notes[0]) * 6 - room_width) { x = -(array_length(global.notes[0]) * 6 - room_width) };
	}
}

