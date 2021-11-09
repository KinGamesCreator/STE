/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

draw_set_color(c_gray);
draw_rectangle(0,y+1,216,y+10,0);
draw_set_color(c_white);

draw_self();

var pos_x_player_scroll = (array_length(global.notes[0]) * 6) * (audio_sound_get_track_position(global.music) / global.data.duration);
pos_x_player_scroll /= ((array_length(global.notes[0]) * 6) / room_width);
draw_sprite_ext(spr_line,0,pos_x_player_scroll,y,1,1,0,c_red,1);

if variable_struct_exists(global.data,"mark") and global.data.mark != 0 {
	var pos_x_mark_scroll = (array_length(global.notes[0]) * 6) * (global.data.mark / global.data.duration);
	pos_x_mark_scroll /= ((array_length(global.notes[0]) * 6) / room_width);
	draw_sprite_ext(spr_line,0,pos_x_mark_scroll,y,1,1,0,c_blue,0.75);
}
