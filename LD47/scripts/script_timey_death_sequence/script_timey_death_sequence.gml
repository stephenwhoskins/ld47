// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_timey_death_sequence()
{
	global.time_stopped = true;
	audio_stop_all();
	object_timey.orig_y = y;
	object_timey.x = x;
	object_timey.y = y;
	object_timey.death_count = 0;
}