/// @description Insert description here
// You can write your code in this editor
is_boss = abs(image_xscale);
health_level = is_boss < 1.1 ? 3 : 12;
max_hurt_count = 45;
hurt_count = max_hurt_count;

max_bounce_back_count = 10;
bounce_back_count = max_bounce_back_count;
bounce_direction = 1.0;
fire_frame_max = room_speed * 2;
fire_frame = 0;