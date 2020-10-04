/// @description Insert description here
// You can write your code in this editor

var actually_hit = true;

// If avatar is below.
if (other.y > y && !place_meeting(x, y - 21, object_avatar))
{
	actually_hit = false;
}

// If avatar is to the left.
if (other.x < x && !place_meeting(x + 8, y, object_avatar))
{
	actually_hit = false;
}
// If avatar is the the right.
else if (other.x > x && !place_meeting(x - 8, y, object_avatar))
{
	actually_hit = false;
}

if (actually_hit &&
	floor(image_index) == 0 && other.hurt_count == other.max_hurt_count)
{
	global.health_level = max(global.health_level - 1, 0);
	other.hurt_count = 0;
}