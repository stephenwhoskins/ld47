/// @description Insert description here
// You can write your code in this editor
if (!audio_is_playing(sound_bgm))
{
	audio_stop_sound(object_music_player.sound);
	object_music_player.sound = audio_play_sound(sound_bgm, 10, true);
	object_music_player.played = false;
	object_music_player.loop_begin_time = 3.3;
	object_music_player.alarm[0] = object_music_player.loop_begin_time * room_speed;
}