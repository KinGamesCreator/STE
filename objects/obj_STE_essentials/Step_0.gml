/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
global._STE_delta = delta_time * room_speed * 0.000001;

for (var i = 0; i < array_length(_Tracks);i++) {
	for (var k=0; k < array_length(_Tracks[i].alarms);k++) {
		_Tracks[i].alarms[k] = false;
	}
}

for (var i = 0; i < array_length(_Tracks);i++) {
	if _Tracks[i].state = 1 {
		_Tracks[i].count += global._STE_delta;
	} else if _Tracks[i].state = 2 {
		_Tracks[i].count = 0;
		_Tracks[i].state = 1;
		_Tracks[i].steps = array_create(array_length(_Tracks[i].notes),0);
	}
	
	for (var k=0; k<array_length(_Tracks[i].notes);k++) {
		if (_Tracks[i].steps[k] < array_length(_Tracks[i].notes[k])) {
			if _Tracks[i].count > _Tracks[i].notes[k][_Tracks[i].steps[k]] {
				_Tracks[i].alarms[k] = true;
				_Tracks[i].duration[k] = _Tracks[i].notes_time[k][_Tracks[i].steps[k]];
				_Tracks[i].steps[k]++;
			}
		}
		if (_Tracks[i].duration[k] > 0) {
			_Tracks[i].duration[k] -= global._STE_delta;
			_Tracks[i].alarms[k] = true;
		}
	}
	
}
