/// @description Insert description here
// You can write your code in this editor
var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);
var hud_width = 256;
var hud_height = 40;
var health_x = view_x + sprite_get_width(sprite_controls) + 8;

draw_set_color($303030);
draw_rectangle(view_x, view_y, view_x + hud_width, view_y + hud_height, false);
draw_set_color(c_white);

// draw controls
draw_sprite(sprite_controls, 0, view_x + 8, view_y);

// draw health
show_debug_message("global.health_level " + string(global.health_level))
for (var i = 0; i < global.health_level; i++)
{
	draw_sprite(sprite_health, 0, health_x + 16 * i, view_y + 16);
}

// draw mini-map
draw_sprite(sprite_map, 0,
	view_x + hud_width - sprite_get_width(sprite_map) - 8, view_y);