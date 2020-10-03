/// @description Insert description here
// You can write your code in this editor
if (buttons[selected] == start_button)
{
	room_goto_next();
}
else if (buttons[selected] == exit_button)
{
	game_end();
}
else
{
	show_debug_message("Unexpected select state: " + string(selected));
	game_end();
}