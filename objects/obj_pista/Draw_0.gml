/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if !surface_exists(superficie) {
	superficie = surface_create(room_width,room_height-30);
}
surface_set_target(superficie);

//dibujar pista
draw_sprite_ext(sprite_index,0,frac(x / 48)*48,-jump_tracks*6,room_width/48+1,array_length(global.notes)/2,0,c_white,1);

surface_reset_target();
draw_surface(superficie,0,y);

//dibujar notas
for (var i = jump_tracks; i < jump_limit; i++) {
	for (var k = floor(abs(x/6)); k < array_length(global.notes[i]); k++) {
		if global.notes[i][k] {
			if (global.notes[i][k] > 1) {
				draw_sprite_ext(spr_beat,1,x+k*6,y+(i-jump_tracks)*6,global.notes[i][k],1,0,c_white,1);
			}
			draw_sprite(spr_beat,0,x+k*6,y+(i-jump_tracks)*6);
		} else if (global.notes[i][k] = -1) {
			var distance = 1;
			while (global.notes[i][k+distance] = -1) {
				distance++;
			}
			draw_sprite_ext(spr_beat,1,x+k*6,y+(i-jump_tracks)*6,distance,1,0,c_white,1);
			k += distance - 1;
		}
		if (global.notes[i][k] != -1) and point_in_rectangle(mouse_x,mouse_y,x+6*k,y+6*(i-jump_tracks),x+5+6*k,y+5+6*(i-jump_tracks)) {
			draw_set_alpha(0.1);
			draw_set_color(c_white);
			draw_rectangle(x+6*k,y+6*(i-jump_tracks),x+5+6*k,y+5+6*(i-jump_tracks),0);
			draw_set_alpha(1);
		}
		if global.notes[i][k] {
			k += global.notes[i][k] - 1;
		}
		if (k*6 > (room_width - x)) break;
	}
}

//dibujar ritmos
for (var i = 0; i < array_length(rythms);i++) {
	draw_set_alpha(rythms[i]);
	draw_rectangle(0,y+6*(i-jump_tracks),room_width,y+6*(i-jump_tracks)+5,0);
	draw_set_alpha(1);
}

//dibujar seleccion
if (global.selected[0] != -1) and (global.selected[0] > obj_pista.jump_tracks) and (global.selected[0] < obj_pista.jump_limit) {
	draw_set_alpha(0.2);
	draw_set_color(c_white);
	draw_rectangle(x+6*global.selected[1],y+6*(global.selected[0] - jump_tracks),x+5+6*global.selected[1],y+5+6*(global.selected[0] - jump_tracks),0);
	draw_set_alpha(1);
}
