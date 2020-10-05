// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_camera(){
	var c = view_camera[0];
var miniroom_width = 256;
var miniroom_height = 184;
var cy_offset = -40;
var miniroom_x = floor(x / miniroom_width);
var miniroom_y = floor(y / miniroom_height);
var cx = miniroom_x * miniroom_width;
var cy = miniroom_y * miniroom_height + cy_offset;
camera_set_view_pos(c, cx, cy);

}