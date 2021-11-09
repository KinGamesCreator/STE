/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

global.interact = true;

global.selected = [-1,-1];

global.editor_version = "v0.2.1";
menu = true;

while(menu) {
	
	msg = get_string("Escribe el nombre de un proyecto\no escribe \"crear\" para uno nuevo.","");
	if (msg == "crear") {
		msg = get_string("¿Cual es el nombre del nuevo proyecto?","");
		if (msg != "") and (msg != noone) {
			if !file_exists("proyects\\" + string_lower(msg) + "\\data.json") {
				show_message("Ahora vamos a seleccionar la música.\nImportante que esté en formato .ogg");
				var temp_music = get_open_filename("musica|*.ogg","musica.ogg");
				if (temp_music != "") and (temp_music != noone) {
					file_copy(temp_music,"proyects\\" + string_lower(msg) + "\\music.ogg");
					show_message("Proyecto \"" + string_lower(msg) + "\" creado con exito.\nAl entrar te pedirá el BPM (notas por segundo) de la música.");
				} else {
					show_message("A, que no tenías la música.\nBueno, te espero.");
					game_end();
					break;
				}
			} else {
				show_message("Ese proyecto ya existe.");
			}
		} else {
			show_message("bruh, ingresa algo.");
			game_end();
			break;
		}
	} else if msg == "convert"{
		room_goto(Room2);
		break;
	} else if (msg != "") and (msg != noone) {
		if file_exists("proyects\\" + string_lower(msg) + "\\music.ogg") {
			global.name = string_lower(msg);
			menu = false;
		} else {
			show_message("el proyecto no existe, volviendo al menú principal...");
		}
	} else {
		show_message("todo mal");
		game_end();
		break;
	}
	
}

if (!menu) {

music_stream = audio_create_stream("proyects\\" + global.name + "\\music.ogg");
global.music = audio_play_sound(music_stream,1,1);

if file_exists("proyects\\" + global.name + "\\data.json") {
	var temp_load = file_text_open_read("proyects\\" + global.name + "\\data.json");
	global.data = json_parse(file_text_read_string(temp_load));
	file_text_close(temp_load);
} else {
	global.data = {
		duration: 0,
		bpm		: get_integer("Ingresa el BPM",120),
		pistas	: [[]],
		version : global.editor_version
	}
	global.data.duration = audio_sound_length(global.music);
	global.data.pistas = [array_create(floor(global.data.duration * (global.data.bpm / 60) * 4)+1)];
}

if global.editor_version != global.data.version {
	for (var i = 0; i < array_length(global.data.pistas);i++) {
		array_resize(global.data.pistas[i],floor(global.data.duration * (global.data.bpm / 60) * 4)+1);
	}
}

global.notes = global.data.pistas;

resize_scene();
}