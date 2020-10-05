/// @description Insert description here
// You can write your code in this editor
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
			instance_destroy(self);
		}
	}
	else
	{
		x += dx;
		y += dy;
	}