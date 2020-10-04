/// @description Insert description here
// You can write your code in this editor
if (distance_to_object(object_avatar)< 50)
{
	sprite_index = sprite_snake_walking;
	var velocity = min(.8, distance_to_object(object_avatar));
	var angle = arctan2(object_avatar.y - y, object_avatar.x - x);
	var dx = velocity * cos(angle);
	var dy = velocity * sin(angle);
	if (place_meeting(x + dx, y + dy, object_avatar))
	{
		if (object_avatar.hurt_count == object_avatar.max_hurt_count)
		{
			global.health_level = max(global.health_level - 1, 0);
			object_avatar.hurt_count = 0;
				
			// If avatar is to the left
			if (object_avatar.x < x)
			{
				object_avatar.bounce_direction = -1;
			}
			else
			{
				object_avatar.bounce_direction = 1;
			}
		}
	}
	else
	{
		x += dx;
		y += dy;
	}
}
else
{
	sprite_index = sprite_snake_idle;
}

if (hurt_count == 0)
{
	audio_play_sound(sound_hit, 10, false);
}

hurt_count = min(hurt_count + 1, max_hurt_count);