/// @description Insert description here
// You can write your code in this editor

vspeed = 0;
hspeed = 0;

if (!keyboard_check(ord("X")))
{
	sprite_index = sprite_avatar_idle;
	
	if (keyboard_check(vk_up))
	{
		sprite_index = sprite_avatar_walking;
		vspeed = -1;
	}
	else if (keyboard_check(vk_down))
	{
		sprite_index = sprite_avatar_walking;
		vspeed = 1;
	}

	if (keyboard_check(vk_left))
	{
		sprite_index = sprite_avatar_walking;
		image_xscale = -1.0;
		hspeed = -1;
	}
	else if (keyboard_check(vk_right))
	{
		sprite_index = sprite_avatar_walking;
		image_xscale = 1.0;
		hspeed = 1;
	}
}
else
{
	if (sprite_index != sprite_avatar_attacking)
	{
		image_index = 0;
	}
	sprite_index = sprite_avatar_attacking;
}

set_camera();

if (hurt_count == 0)
{
	audio_play_sound(sound_hit, 10, false);
}

hurt_count = min(hurt_count + 1, max_hurt_count);