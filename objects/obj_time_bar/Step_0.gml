/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if collision_point(mouse_x,mouse_y,id,1,0) {
	if mouse_check_button_pressed(mb_left) {
		audio_sound_set_track_position(global.music,global.data.duration * (abs(obj_pista.x) + mouse_x) / (array_length(global.notes[0]) * 6));
	}
	if mouse_check_button_pressed(mb_right) {
		if variable_struct_exists(global.data,"mark") and global.data.mark == 0 {
			global.data.mark = global.data.duration * (abs(obj_pista.x) + mouse_x) / (array_length(global.notes[0]) * 6);
		} else {
			global.data.mark = 0;
		}
	}
}
