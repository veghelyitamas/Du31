function create_menu_page(){
	///@description create_menu_page
	///@arg ["Name1", type1, entries1...]
	///@arg ["Name2", type2, entries1...]
	
	var arg, i = 0;
	repeat (argument_count) {
		arg[i] = argument[i];
		i++;
	}
	
	var ds_grid_id = ds_grid_create(5,argument_count);
	i = 0; repeat (argument_count) {
		var array = arg[i];
		var array_len = array_length_1d(array);
		
		var xx = 0; repeat(array_len) {
			ds_grid_id[# xx, i] = array[xx];
			xx++;
		}
		
		i++;
		
	}
	
	
	return ds_grid_id;
}

function resume_game() {
	
	global.Pause			= false;	
	if debug_mode { show_debug_message("Resume game");}	
}
	
function exit_game() {
	game_end();		
}

function change_volume() {
	var type = menu_option[page];
	switch (type) {
		case 0: 
			audio_master_gain(argument0); 
			break;	
		case 1:	
			audio_group_set_gain(audiogroup_soundfx, argument0, 0); 
			break;	
		case 2:
			audio_group_set_gain(audiogroup_music, argument0, 0); 
			break;	
	}
	
	if debug_mode { show_debug_message("Volume has been changed to " + string(argument0));}			
}
	
function change_difficulty() {
	var type = menu_option[page];
	
	if (type == 0) {
		// Enemies	
		/*
		switch (argument0) {
			case 0: // Easy
				
			break;
		}
		*/
	} else {
		// Allies
		/*
		switch (argument0) {
			case 0: // Easy
				
			break;
		}
		*/
		
	}
}
	
function change_resolution() {
	switch (argument0) {
		case 0: 
			window_set_size(384, 216);
			break;
		case 1: 
			window_set_size(768, 432);
			break;
		case 2: 
			window_set_size(1152, 648);	
			break;
		case 3: 
			window_set_size(1536, 874);	
			break;
		case 4: 
			window_set_size(1920, 1080);	
			break;
	}
}

function change_window_mode() {
	switch (argument0) {
		case 0:
			window_set_fullscreen(true);
			
			break;
		case 1:
			window_set_fullscreen(false);
			break;
	}
}