/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0,0,room_width,room_height,0);

draw_set_color(c_white);
draw_set_alpha(1);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(font_export);

for (var i = 0; i < array_length(modules); i++) {
	if i = selection {
		draw_set_color(c_yellow);
	}
	draw_text(room_width/2,room_height/2+(i-anim)*12,modules[i].name);
	draw_set_color(c_white);
}
