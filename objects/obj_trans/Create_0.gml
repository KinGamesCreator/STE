/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var music_temp = audio_create_stream(get_open_filename("ogg|*.ogg","si"));

save = {
	duration: audio_sound_length(music_temp),
	bpm		: 145,
	pistas	: [[]],
	version : "v0.2.0"
}

var file_open = file_text_open_read(get_open_filename("archivo|*.json","archivo"));
data = json_parse(file_text_read_string(file_open));
file_text_close(file_open);

save.bpm = data.song.bpm;

save.pistas = [array_create(floor(save.duration * (data.song.bpm / 60) * 4)+1)];

for (var i = 0; i < array_length(data.song.notes);i++) {
	
	var mustHitSection = data.song.notes[i].mustHitSection;
	
	for (var j = 0; j < array_length(data.song.notes[i].sectionNotes);j++) {
		
		var containsDuet = false;
		
		for (var n = 0; n < array_length(data.song.notes[i].sectionNotes); n++) {
			if (data.song.notes[i].sectionNotes[n][1] > 3) { containsDuet = true; }
		}
		
		var pista_x = 0;
		var durations = 0;
		
		var noteInfo = data.song.notes[i].sectionNotes[j][1];
		
		durations = round(data.song.notes[i].sectionNotes[j][2]);
		
		if (containsDuet) {
			
			if (mustHitSection) {
				switch(noteInfo) {
					case 0:
						pista_x = 4;
					break;
					case 1:
						pista_x = 5;
					break;
					case 2:
						pista_x = 6;
					break;
					case 3:
						pista_x = 7;
					break;
					case 4:
						pista_x = 0;
					break;
					case 5:
						pista_x = 1;
					break;
					case 6:
						pista_x = 2;
					break;
					case 7:
						pista_x = 3;
					break;
				}
			} else {
				pista_x = noteInfo;
			}
		} else {
			if (mustHitSection) {
				pista_x = 4+noteInfo;
			} else {
				pista_x = noteInfo;
			}
		}
		
		save.pistas[pista_x][round(((data.song.notes[i].sectionNotes[j][0] / 1000) * (save.bpm / 60)) * 4)] = round(1 + (durations / 1000) * (save.bpm / 60) * 4);
		
		for (var o = 1; o < round(1 + (durations / 1000) * (save.bpm / 60) * 4); o++) {
			save.pistas[pista_x][round(((data.song.notes[i].sectionNotes[j][0] / 1000) * (save.bpm / 60)) * 4) + o] = -1;
		}
		
	}
	
}

for (var k = 1; k < array_length(save.pistas);k++) {
	array_resize(save.pistas[k],array_length(save.pistas[0]));
}

var temp_save_file = file_text_open_write(get_save_filename("data|*.json","data.json"));

file_text_write_string(temp_save_file,json_stringify(save));

file_text_close(temp_save_file);

game_end();
