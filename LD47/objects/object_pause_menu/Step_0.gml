/// @description Insert description here
// You can write your code in this editor

if (keyboard_check(vk_escape) && !pausePressed)
{
	paused = !paused;
	
	if (paused)
	{
		fade_count = 0;
		
		option = option_no;
		
		// set new surface target
		if (!surface_exists(my_application_surface))
		{
			my_application_surface = surface_create(3*camera_get_view_width(view_camera[0]), 3*camera_get_view_height(view_camera[0]));
		}
		surface_set_target(my_application_surface);
		
		// copy the application surface to the new surface target;
		// this is complicated because the surface winds up
		// being darker because of the blending...
		draw_clear_alpha(c_black, 1);
		gpu_set_blendenable(false);
		gpu_set_colorwriteenable(true, true, true, false);
		surface_copy(my_application_surface, 0, 0, application_surface);
		gpu_set_blendenable(true);
		gpu_set_colorwriteenable(true, true, true, true);
		
		// set target surface back to normal
		surface_reset_target();
		
		// deactivate all objects (except this one):
		instance_deactivate_all(true);
		
		// disable drawing of the application surface because we will draw our copy now
		application_surface_draw_enable(false);
		audio_pause_all();
	}
	else
	{
		fade_count = 0;
		instance_activate_all();
		application_surface_draw_enable(true);
		audio_resume_all();
	}
	
	pausePressed = true;
}
else if (!keyboard_check(vk_escape) && pausePressed)
{
	pausePressed = false;
}

if (paused)
{
	// handle changing selection
	var swap = keyboard_check(vk_left) || keyboard_check(vk_right);
	if (swap && !button_pressed && !exiting)
	{
		option = (option + 1) % max_options;
		button_pressed = true;
		audio_play_sound(sound_title_select, 10, false);
	}
	else if (!swap && !exiting)
	{
		button_pressed = false;
	}
	
	// handle selection being made
	if (keyboard_check(vk_enter) && !enter_pressed && !exiting)
	{
		if (option == option_yes)
		{
			audio_play_sound(sound_title_select, 10, false);
			fade_count = 0;
			exiting = true;
			exit_count = 0;
		}
		else
		{
			paused = false;
			fade_count = 0;
			instance_activate_all();
			application_surface_draw_enable(true);
			audio_resume_all();
			
		}
		
		enter_pressed = true;
	}
	else if (!keyboard_check(vk_enter) && enter_pressed)
	{
		enter_pressed = false;
	}
}

// if transition is done, exit to title screen for real
if (exiting && fade_count == max_fade_count)
{
	instance_activate_all();
	application_surface_draw_enable(true);
	room_goto(title);
}