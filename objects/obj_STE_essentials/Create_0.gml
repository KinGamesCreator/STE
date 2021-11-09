/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (instance_number(obj_STE_essentials > 1)) {
	instance_destroy();
} else {
	global._STE_delta = delta_time * room_speed * 0.000001;
	_Tracks = [];
}

/*._Tracks = [ {
	notes	: [i][k]
	name	: _name,
	steps	: [],
	count	: 0,
	state	: 0,
	alarms	: false
} ]*/


