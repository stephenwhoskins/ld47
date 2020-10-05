/// @description Insert description here
// You can write your code in this editor
my_application_surface = surface_create(camera_get_view_width(view_camera[0])*3, camera_get_view_height(view_camera[0]) * 3);
paused = false;
pausePressed = false;
max_fade_count = 10;
fade_count = max_fade_count;
max_fade_alpha = 0.8;
max_pause_menu_height = 96;
pause_menu_height = 2;
option_yes = 0;
option_no = 1;
max_options = 2;
option = option_yes;
button_pressed = true;
enter_pressed = false;
exiting = false;
max_exit_count = 45;
exit_count = max_exit_count;


var title_text = "Resume game?";
title_struct = {
text: title_text,
x: camera_get_view_width(view_camera[0]) * 3 / 2- string_width(title_text) / 2,
y: 350
};

var no_button_text = "no";
var button_height = 400;
no_button = {
text: no_button_text,
x: camera_get_view_width(view_camera[0]) * 3 / 2 - 30 - string_width(no_button_text),
y: button_height
};
yes_button = {
text: "yes",
x: camera_get_view_width(view_camera[0]) * 3 / 2 + 30,
y: button_height
};