/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x, y - 16, object_avatar) && floor(image_index) == 0 &&
	object_avatar.hurt_count == object_avatar.max_hurt_count)
{
		global.health_level = max(global.health_level - 1, 0);
		object_avatar.hurt_count = 0;
}