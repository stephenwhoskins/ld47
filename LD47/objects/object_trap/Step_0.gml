/// @description Insert description here
// You can write your code in this editor

var arrow_speed = 1.5;

if (image_angle == 0)
{
	if (image_xscale == 1.0)
	{
		if (object_avatar.x > x && object_avatar.x < (x + sprite_width) && reload_time == max_reload_time)
		{
			instance_arrow = instance_create_depth(x, y, depth - 1, object_arrow);
			instance_arrow.x = x + 8;
			instance_arrow.y = y + 17;
			instance_arrow.vspeed = arrow_speed;
			reload_time = 0;
		}
	}
	else
	{
		if (object_avatar.x > (x + sprite_width) && object_avatar.x < x && reload_time == max_reload_time)
		{
			instance_arrow = instance_create_depth(x, y, depth - 1, object_arrow);
			instance_arrow.x = x - 14;
			instance_arrow.y = y + 17;
			instance_arrow.vspeed = arrow_speed;
			reload_time = 0;
		}
	}
}

if (image_angle == 180)
{
	if (image_xscale == 1.0)
	{
		if (object_avatar.x > (x - sprite_width) && object_avatar.x < x && reload_time == max_reload_time)
		{
			instance_arrow = instance_create_depth(x, y, depth - 1, object_arrow);
			instance_arrow.x = x - 8;
			instance_arrow.y = y - 17;
			instance_arrow.vspeed = -arrow_speed;
			instance_arrow.image_angle = image_angle;
			reload_time = 0;
		}
	}
	else
	{
		if (object_avatar.x > x && object_avatar.x < (x - sprite_width) && reload_time == max_reload_time)
		{
			instance_arrow = instance_create_depth(x, y, depth - 1, object_arrow);
			instance_arrow.x = x + 14;
			instance_arrow.y = y - 17;
			instance_arrow.vspeed = -arrow_speed;
			instance_arrow.image_angle = image_angle;
			reload_time = 0;
		}
	}
}

// NOTE THAT SPRITE_WIDTH IS DONE FOR COMPARISON; DON'T USE SPRITE_HEIGHT!
if (image_angle == 90)
{
	if (image_xscale == 1.0)
	{
		if (object_avatar.y > y && object_avatar.y < (y + sprite_width) && reload_time == max_reload_time)
		{
			instance_arrow = instance_create_depth(x, y, depth - 1, object_arrow);
			instance_arrow.x = x - 17;
			instance_arrow.y = y - 12;
			instance_arrow.hspeed = -arrow_speed;
			instance_arrow.image_angle = -image_angle;
			reload_time = 0;
		}
	}
	else
	{
		if (object_avatar.y > (y - sprite_width) && object_avatar.y < (y - 2.0 * sprite_width) && reload_time == max_reload_time)
		{
			instance_arrow = instance_create_depth(x, y, depth - 1, object_arrow);
			instance_arrow.x = x - 17;
			instance_arrow.y = y + 6;
			instance_arrow.hspeed = -arrow_speed;
			instance_arrow.image_angle = -image_angle;
			reload_time = 0;
		}
	}
}

if (image_angle == -90)
{
	if (image_xscale == 1.0)
	{
		if (object_avatar.y > (y + sprite_width) && object_avatar.y < (y + 2.0 * sprite_width) && reload_time == max_reload_time)
		{
			instance_arrow = instance_create_depth(x, y, depth - 1, object_arrow);
			instance_arrow.x = x + 17;
			instance_arrow.y = y + 12;
			instance_arrow.hspeed = arrow_speed;
			instance_arrow.image_angle = -image_angle;
			reload_time = 0;
		}
	}
	else
	{
		if (object_avatar.y > y && object_avatar.y < (y - sprite_width) && reload_time == max_reload_time)
		{
			instance_arrow = instance_create_depth(x, y, depth - 1, object_arrow);
			instance_arrow.x = x + 17;
			instance_arrow.y = y - 6;
			instance_arrow.hspeed = arrow_speed;
			instance_arrow.image_angle = -image_angle;
			reload_time = 0;
		}
	}
}

reload_time = min(reload_time + 1, max_reload_time);