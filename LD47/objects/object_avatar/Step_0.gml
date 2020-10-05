/// @description Insert description here
// You can write your code in this editor

if (global.health_level > 0)
{
	if (bounce_back_count < max_bounce_back_count)
	{
		var x_velocity = 2.0 * bounce_direction;
		if (place_free(x + x_velocity, y))
		{
			x += x_velocity;
		}
	}
	else
	{
		if (sprite_index != sprite_avatar_attacking)
		{
			sprite_index = sprite_avatar_idle;
	
			if (keyboard_check(vk_up))
			{
				sprite_index = sprite_avatar_walking;
				if (place_free(x, y - 1))
				{
					y += -1;
				}
			}
			else if (keyboard_check(vk_down))
			{
				sprite_index = sprite_avatar_walking;
				if (place_free(x, y + 1))
				{
					y += 1;
				}
			}

			if (keyboard_check(vk_left))
			{
				sprite_index = sprite_avatar_walking;
				image_xscale = -1.0;
				if (place_free(x - 1, y))
				{
					x += -1;
				}
			}
			else if (keyboard_check(vk_right))
			{
				sprite_index = sprite_avatar_walking;
				image_xscale = 1.0;
				if (place_free(x + 1, y))
				{
					x += 1;
				}
			}
		}
		else // Handle enemy damage here
		{
			var x_offset = 16;
			
			// Handle avatar facing the left.
			if (image_xscale == -1)
			{
				x_offset = -16;
			}
			
			var _list = ds_list_create();
			var _num = instance_place_list(x + x_offset, y, object_enemy, _list, false);
			if _num > 0
			{
				for (var i = 0; i < _num; ++i;)
				{
				    var instance_enemy = _list[| i];
					if (instance_enemy.hurt_count == instance_enemy.max_hurt_count)
					{
						instance_enemy.hurt_count = 0;
					
						// Handle enemy left of avatar.
						if (instance_enemy.x < x)
						{
							instance_enemy.bounce_direction = -1.0;
						}
						else
						{
							instance_enemy.bounce_direction = 1.0;
						}
					}
				}
			}
			ds_list_destroy(_list);
		}
		
		if (keyboard_check(ord("X")) && !attack_pressed)
		{
			if (sprite_index != sprite_avatar_attacking)
			{
				image_index = 0;
				audio_play_sound(sound_slice, 10, false);
			}
			sprite_index = sprite_avatar_attacking;
			attack_pressed = true;
		}
		else if (!keyboard_check(ord("X")))
		{
			attack_pressed = false;
		}
	}
}

set_camera();

if (hurt_count == 0 && sprite_index != sprite_avatar_dead)
{
	audio_play_sound(sound_hit, 10, false);
	bounce_back_count = 0;
	
	if (global.health_level == 0)
	{
		sprite_index = sprite_avatar_dead;
		death_count = 0;
	}
}

if (sprite_index == sprite_avatar_dead && death_count == max_death_count)
{
	global.health_level = 5;
	global.key_count = 0;
	room_goto(Room1);
}

hurt_count = min(hurt_count + 1, max_hurt_count);
bounce_back_count = min(bounce_back_count + 1, max_bounce_back_count);
death_count = min(death_count + 1, max_death_count);