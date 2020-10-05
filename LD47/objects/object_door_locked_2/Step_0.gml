/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x - 1.0, y, object_avatar) && global.key_count > 0)
{
	audio_play_sound(sound_door_unlocked, 10, false);
	global.key_count--;
	instance_destroy(self);
}