/// @description Insert description here
// You can write your code in this editor
if ((hurt_count < max_hurt_count || sprite_index == sprite_avatar_dead) &&
	floor(hurt_count / 2) % 2 == 0)
{
	draw_self();
}
else if (hurt_count == max_hurt_count && sprite_index != sprite_avatar_dead)
{
	draw_self();
}
	