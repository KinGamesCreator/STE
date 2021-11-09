// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function resize_scene(){
	if array_length(global.notes) < 10 {
		room_height = 30 + 6 * array_length(global.notes);
		camera_set_view_size(view_camera[0],room_width,room_height);
		window_set_size(1080,150 + 30 * array_length(global.notes));
		surface_resize(application_surface,1080,150 + 30 * array_length(global.notes));
	} else {
		room_height = 30 + 6 * 10;
		camera_set_view_size(view_camera[0],room_width,room_height);
		window_set_size(1080,150 + 30 * 10);
		surface_resize(application_surface,1080,150 + 30 * 10);
	}
}