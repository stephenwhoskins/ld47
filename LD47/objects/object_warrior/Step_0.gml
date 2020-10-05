/// @description Insert description here
// You can write your code in this editor

if (health_level > 0)
{
	if (bounce_back_count < max_bounce_back_count)
	{
		var x_velocity = 3.0 * bounce_direction;
		if (!place_meeting(x + x_velocity, y, object_base_wall))
		{
			x += x_velocity;
		}
	}
	else if (distance_to_object(object_avatar)< 50)
	{
		sprite_index = sprite_warrior_walking;
		var velocity = min(.8, distance_to_object(object_avatar));
		var angle = arctan2(object_avatar.y - y, object_avatar.x - x);
		var dx = velocity * cos(angle);
		var dy = velocity * sin(angle);
		if (dx != 0)
			image_xscale *= sign(dx) * sign(image_xscale);
		if (place_meeting(x + dx, y + dy, object_avatar))
		{
			if (object_avatar.hurt_count == object_avatar.max_hurt_count)
			{
				global.health_level = max(global.health_level - 1, 0);
				object_avatar.hurt_count = 0;
			
				// If avatar is to the left.
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
			if (!place_meeting(x + dx, y, object_base_wall))
			{
				x += dx;
			}
			if (!place_meeting(x, y + dy, object_base_wall))
			{
				y += dy;
			}
		}
	}
	else
	{
		sprite_index = sprite_warrior_idle;
	}
}

if (hurt_count == 0 && sprite_index != sprite_warrior_dead)
{
	health_level = max(health_level - 1, 0);
	bounce_back_count = 0;
	
	if (health_level == 0)
	{
		sprite_index = sprite_warrior_dead;
		if (random(100) < 40)
		{
			instance_create_depth(x, y, depth - 1, object_health);
		}
	}
}
else if (hurt_count == 0 && sprite_index == sprite_warrior_dead)
{
	hurt_count = max_hurt_count;
}

hurt_count = min(hurt_count + 1, max_hurt_count);
bounce_back_count = min(bounce_back_count + 1, max_bounce_back_count);