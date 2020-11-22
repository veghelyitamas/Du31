/// @description 
	if (!global.Pause) exit;
	
	
// Key bindings

	input_up_p			= keyboard_check_pressed(global.key_up);
	input_down_p		= keyboard_check_pressed(global.key_down);
	input_enter_p		= keyboard_check_pressed(global.key_enter);

	var ds_grid		= menu_pages[page], 
	var ds_height	= ds_grid_height(ds_grid);
	
	if (inputting) {
			switch (ds_grid[# 1, menu_option[page]]) {
				case menu_element_type.shift:
					var horizontal_input = keyboard_check_pressed(global.key_right) - keyboard_check_pressed(global.key_left);
					
					if (horizontal_input != 0) {
						ds_grid[# 3, menu_option[page]] += horizontal_input;
						ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, array_length_1d(ds_grid[# 4, menu_option[page]]) -1);
						// +> add audio
					}	
					break;
				case menu_element_type.slider:
				
					switch (menu_option[page]) {
						case 0: if (!audio_is_playing(mus_main)) { audio_play_sound(mus_main, 1, false); } break;
						case 1: if (!audio_is_playing(snd_testsound)) { audio_play_sound(snd_testsound, 1, false); } break;
						case 2: if (!audio_is_playing(mus_main))	{ audio_play_sound(mus_main, 1, false); } break;
					}
			
					var horizontal_input = keyboard_check(global.key_right) - keyboard_check(global.key_left);
					
					if (horizontal_input != 0) {
						ds_grid[# 3, menu_option[page]] += horizontal_input * 0.01;
						ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
						script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
					}
					break;
				case menu_element_type.toggle:
					var horizontal_input = keyboard_check_pressed(global.key_right) - keyboard_check_pressed(global.key_left);
					
					if (horizontal_input != 0) {
						ds_grid[# 3, menu_option[page]] += horizontal_input;
						ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
						// +> add audio
					}
					break;
				case menu_element_type.input:
					var key_last = keyboard_lastkey;
						
					if (key_last != vk_enter) {		// Bann keys here by adding next to vk_enter
						if (key_last != ds_grid[# 3, menu_option[page]]) {
							// +> add audio	
						}
						
						ds_grid[# 3, menu_option[page]]	= key_last;
						variable_global_set(ds_grid[# 2, menu_option[page]], key_last);
					}
					
					
					
					break;
		}
		
			
	} else {
			
		var inmenu_movement = input_down_p- input_up_p;

	// Move in menu
		if (inmenu_movement != 0) {
				menu_option[page] += inmenu_movement;
				// Loop at the bottom -> top
				if ( menu_option[page] > ds_height -1) {
					menu_option[page] = 0;	
				}
				// Loop at the top -> bottom
				if ( menu_option[page] < 0) {
					menu_option[page] = ds_height -1;	
				}		
		}
}
	
// Execute function
	if (input_enter_p) {
		switch (ds_grid[# 1, menu_option[page]]) {
			case menu_element_type.script_runner:
				// It gets the name of the script from *create* and executes it 
				script_execute(ds_grid[# 2, menu_option[page]]); 
				break;	
			case menu_element_type.page_transfer:
				page = ds_grid[# 2, menu_option[page]];
				break;
				
			case menu_element_type.shift:
				
				
			case menu_element_type.slider:

				
			case menu_element_type.toggle:
				if (inputting) {
					// It gets the name of the script from *create* and executes it 
					script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);		
				}	
			case menu_element_type.input:

				inputting = !inputting;
				break;
	}
}
	