// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_button_custom(button, is_selected){
	opacity = is_selected ? 1 : .8;
	draw_text_color(button.x, button.y, button.text, c_white, c_white, c_white, c_white, opacity);
}