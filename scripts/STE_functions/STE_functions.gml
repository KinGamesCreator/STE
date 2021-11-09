// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function track_load(_name,_data) {
	var _temp_load = json_parse(_data);
	obj_STE_essentials._Tracks[array_length(obj_STE_essentials._Tracks)] = {
		notes	: _temp_load.pistas,
		notes_time : _temp_load.pistas_time,
		name	: _name,
		steps	: array_create(array_length(_temp_load.pistas),0),
		state	: 0,
		count	: 0,
		alarms	: array_create(array_length(_temp_load.pistas),false),
		duration: array_create(array_length(_temp_load.pistas),0)
	}
}

function track_start(_name) {
	for(var i=0; i<array_length(obj_STE_essentials._Tracks);i++) {
		if obj_STE_essentials._Tracks[i].name = _name {
			obj_STE_essentials._Tracks[i].state = 1;
		}
	}
}

function track_pause(_name) {
	for(var i=0; i<array_length(obj_STE_essentials._Tracks);i++) {
		if obj_STE_essentials._Tracks[i].name = _name {
			obj_STE_essentials._Tracks[i].state = 0;
		}
	}
}

function track_resume(_name) {
	for(var i=0; i<array_length(obj_STE_essentials._Tracks);i++) {
		if obj_STE_essentials._Tracks[i].name = _name {
			obj_STE_essentials._Tracks[i].state = 1;
		}
	}
}

function track_restart(_name) {
	for(var i=0; i<array_length(obj_STE_essentials._Tracks);i++) {
		if obj_STE_essentials._Tracks[i].name = _name {
			obj_STE_essentials._Tracks[i].state = 2;
		}
	}
}

function track_sign(_name,_value) {
	for(var i=0; i<array_length(obj_STE_essentials._Tracks);i++) {
		if obj_STE_essentials._Tracks[i].name = _name {
			return(obj_STE_essentials._Tracks[i].alarms[_value]);
		}
	}
}

function track_destroy(_name) {
	var destroyed = false;
	for(var i=0; i<array_length(obj_STE_essentials._Tracks);i++) {
		if obj_STE_essentials._Tracks[i].name = _name {
			destroyed = true;
		}
		if destroyed and ((i+1) < array_length(obj_STE_essentials._Tracks)) {
			obj_STE_essentials._Tracks[i] = obj_STE_essentials._Tracks[i+1];
		}
	}
	array_resize(obj_STE_essentials._Tracks,array_length(obj_STE_essentials._Tracks)-1);
}

