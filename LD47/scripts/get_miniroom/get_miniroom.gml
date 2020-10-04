// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_miniroom(){
var miniroom_width = 256;
var miniroom_height = 184;
var miniroom_x = floor(x / miniroom_width);
var miniroom_y = floor(y / miniroom_height);
return {x: miniroom_x, y: miniroom_y};
}