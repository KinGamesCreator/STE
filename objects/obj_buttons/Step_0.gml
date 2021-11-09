/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

for (var i = 0; i < sprite_get_number(sprite_index)-1; i++) {
	if global.interact and point_in_rectangle(mouse_x,mouse_y,x+12*i,y,x+12*i+11,y+12) and mouse_check_button_released(mb_left) {
		ejecutar = i;
	}
}

if (ejecutar != -1) {
	switch(ejecutar) {
		
		case 0: //play
			if audio_is_paused(global.music) {
				audio_resume_sound(global.music);
			} else {
				audio_pause_sound(global.music);
			}
		break;
		case 1: //restart
			audio_pause_sound(global.music);
			audio_sound_set_track_position(global.music,0);
		break;
		
		case 2: //save
			
			global.data.pistas = global.notes;
			global.data.version = global.editor_version;
			
			var temp_file = file_text_open_write("proyects\\" + global.name + "\\data.json");
			
			file_text_write_string(temp_file,json_stringify(global.data));
			
			file_text_close(temp_file);
			
			show_message("guardado!");
			
		break;
		
		case 3: //export
			
			instance_create_layer(0,0,"Instances_gui",obj_export);
			
		break;
		
		case 4: //disminuir
			if (global.selected[0] != -1) and (global.notes[global.selected[0],global.selected[1]] > 1) {
				global.notes[global.selected[0],global.selected[1] + global.notes[global.selected[0],global.selected[1]] - 1] = 0;
				global.notes[global.selected[0],global.selected[1]] -= 1;
			}
		break;
		
		case 5: //aumentar
			if (global.selected[0] != -1) and ((global.notes[global.selected[0],global.selected[1]] + global.selected[1] - 1) < (array_length(global.notes[0]) - 1)) {
				global.notes[global.selected[0],global.selected[1]] += 1;
				global.notes[global.selected[0],global.selected[1] + global.notes[global.selected[0],global.selected[1]] - 1] = -1;
			}
		break;
		
		case 6: //crear pistas
		var quest = show_question("¿Crear una nueva pista?\nSi creas una nueva pista luego no podrás borrarla.");
		if quest {
			global.notes[array_length(global.notes)][0] = 0;
			for (var i = 0; i < array_length(global.notes[0]);i++) {
				global.notes[array_length(global.notes)-1][i] = 0;
			}
			resize_scene();
		}
		if (array_length(global.notes) > 10) {
			obj_pista.jump_tracks++;
		}
		break;
		
		case 7: //subir scroll
			if (obj_pista.jump_tracks > 0) {
				obj_pista.jump_tracks--;
			}
		break;
		
		case 8: //bajar scroll
			if (obj_pista.jump_tracks < (array_length(global.notes) - 10)) {
				obj_pista.jump_tracks++;
			}
		break;
		
		case 9: //spam
			url_open("https://kingamescreator.itch.io");
		break;
		
	}
	ejecutar = -1;
}
