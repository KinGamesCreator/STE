/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var avance = (array_length(global.notes[0])) * (audio_sound_get_track_position(global.music) / global.data.duration);

var rythm = false;
for (var i = 0; i < array_length(global.notes);i++) {
	if abs(global.notes[i][avance]) {
		if (global.notes[i][avance] == 1) and (floor(avance) != ultim) {
			rythm = true;
			obj_pista.rythms[i] = 0.125;
		} else if global.notes[i][avance] > 1 {
			if floor(avance) != ultim {
				rythm = true;
			}
			obj_pista.rythms[i] = 0.125;
		} else if global.notes[i][avance] = -1 {
			obj_pista.rythms[i] = 0.1;
		}
	}
}

if (floor(avance) != ultim) {
	ultim = floor(avance);
}

if rythm {
	alarm[0] = 4;
	randomize();
	image_index = choose(1,2,3,4);
}
