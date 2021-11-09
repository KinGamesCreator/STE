/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

draw_sprite_ext(sprite_index,0,frac(obj_pista.x / 6)*6,y,room_width/12+1,1,0,c_white,1);
//dibujar barra reproduccion.
var pos_x_player = (array_length(global.notes[0]) * 6) * (audio_sound_get_track_position(global.music) / global.data.duration);
draw_sprite_ext(spr_player,0,obj_pista.x+pos_x_player,y,1,obj_pista.jump_limit - obj_pista.jump_tracks + 1,0,c_white,1);
//dibujar marcador
if variable_struct_exists(global.data,"mark") and global.data.mark != 0 {
	draw_sprite_ext(spr_marcador,0,obj_pista.x+(array_length(global.notes[0]) * 6) * (global.data.mark / global.data.duration),y,1,obj_pista.jump_limit - obj_pista.jump_tracks + 1,0,c_white,1);
}


