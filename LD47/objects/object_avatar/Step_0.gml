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

while (!place_free(x + hspeed, y + vspeed))
{
	if (!place_free(x, y + vspeed))
	{
		vspeed = 0;
	}
	else if (!place_free(x + hspeed, y))
	{
		hspeed = 0;
	}
	else
	{
		hspeed = 0;
		vspeed = 0;
		break;
	}
}