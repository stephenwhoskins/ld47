/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x, y, object_avatar) && !consumed)
{
	global.health_level = min(global.health_level + 1, global.max_health_level);
	consumed = true;
	audio_play_sound(sound_health, 10, false);
	instance_destroy(self);
}