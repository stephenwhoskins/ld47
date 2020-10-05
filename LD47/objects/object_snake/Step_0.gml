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
		sprite_index = sprite_snake_walking;
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
			if (!place_meeting(x + dx, y, object_base_wall))
			{
				x += dx;
			}
			if (!place_meeting(x, y + dy, object_base_wall))
			{
				y += dy;
			}
			fire_frame = fire_frame_max;
		}
	}
	else
	{
		if (is_boss && fire_frame == fire_frame_max)
		{
			/*var xs = sign(image_xscale);
			var ys = sign(image_yscale);
			var num_fireballs = 3;
			for (var i = 0; i < num_fireballs; i++)
			{
				var fire = instance_create_layer(x + 3 * xs , y - 3 * ys, layer, object_fireball);
				var angle = pi / 4 * (i - (num_fireballs / 2 - .5));
				fire.dx = cos(angle) * .5 * xs;
				fire.dy = sin(angle) * .5;
			}
			fire_frame = 0;*/
		}
		else
		{
			fire_frame++;
		}
		sprite_index = sprite_snake_idle;
	}
}

if (hurt_count == 0 && sprite_index != sprite_snake_dead)
{
	health_level = max(health_level - 1, 0);
	bounce_back_count = 0;
	
	if (health_level == 0)
	{
		sprite_index = sprite_snake_dead;
		if (random(100) < 40)
		{
			instance_create_depth(x, y, depth - 1, object_health);
		}
		if (is_boss)
		{
			snake_1 = instance_create_depth(x - 16, y, depth + 1, object_snake);
			snake_2 = instance_create_depth(x - 8, y, depth + 1, object_snake);
			snake_3 = instance_create_depth(x + 8, y, depth + 1, object_snake);
			snake_4 = instance_create_depth(x + 16, y, depth + 1, object_snake);
		}
	}
}
else if (hurt_count == 0 && sprite_index == sprite_snake_dead)
{
	hurt_count = max_hurt_count;
}

if (variable_instance_exists(id, "snake_1") && variable_instance_exists(id, "snake_3") &&
	variable_instance_exists(id, "snake_3") && variable_instance_exists(id, "snake_4"))
{
	if (snake_1.sprite_index == sprite_snake_dead &&
		snake_2.sprite_index == sprite_snake_dead &&
		snake_3.sprite_index == sprite_snake_dead &&
		snake_4.sprite_index == sprite_snake_dead)
	{
		if (!timey_death_initiated)
		{
			script_timey_death_sequence();
			timey_death_initiated = true;
		}
	}
}

hurt_count = min(hurt_count + 1, max_hurt_count);
bounce_back_count = min(bounce_back_count + 1, max_bounce_back_count);