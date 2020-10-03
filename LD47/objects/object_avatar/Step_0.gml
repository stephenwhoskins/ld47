/// @description Insert description here
// You can write your code in this editor

if (!keyboard_check(ord("X")))
{
	sprite_index = sprite_avatar_idle;
	
	if (keyboard_check(vk_up))
	{
		sprite_index = sprite_avatar_walking;
		y -= 1;
	}
	else if (keyboard_check(vk_down))
	{
		sprite_index = sprite_avatar_walking;
		y += 1;
	}

	if (keyboard_check(vk_left))
	{
		sprite_index = sprite_avatar_walking;
		image_xscale = -1.0;
		x -= 1;
	}
	else if (keyboard_check(vk_right))
	{
		sprite_index = sprite_avatar_walking;
		image_xscale = 1.0;
		x += 1;
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