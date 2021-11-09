/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

for (var i = 0; i < (sprite_get_number(sprite_index)-1); i++) {
	if (i != 0) {
		draw_sprite(sprite_index,i+1,x+12*i,y);
	} else {
		draw_sprite(sprite_index,!audio_is_paused(global.music),x+12*i,y);
	}
}

for (var i = 0; i < sprite_get_number(sprite_index)-1; i++) {
	if ((i != 7) or (obj_pista.jump_tracks > 0)) and ((i != 8) or (obj_pista.jump_tracks < (array_length(global.notes) - 10))) and global.interact  {
		if point_in_rectangle(mouse_x,mouse_y,x+12*i,y,x+12*i+11,y+12) {
			draw_set_alpha(0.1 + 0.1 * mouse_check_button(mb_left));
			draw_rectangle(x+12*i,y,x+12*i+11,y+11,0);
			draw_set_alpha(1);
		}
	} else {
		draw_set_alpha(0.3);
		draw_set_color(c_black);
		draw_rectangle(x+12*i,y,x+12*i+11,y+11,0);
		draw_set_alpha(1);
		draw_set_color(c_white);
	}
}
