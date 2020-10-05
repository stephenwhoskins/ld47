// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_draw_pause_menu(){
	draw_button_custom(title_struct, true);
	draw_button_custom(no_button, option == 0);
	draw_button_custom(yes_button, option == 1);
}