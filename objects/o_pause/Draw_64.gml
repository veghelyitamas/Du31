/// @description Draw pause menu
	if (!global.Pause) exit;

// Generals
	var g_width		= global.camera_width;
	var g_height	= global.camera_height;
	var color		= c_black;
	
	var ds_grid		= menu_pages[page], 
	var ds_height	= ds_grid_height(ds_grid);
	
	var x_buffer	= 16;
	var y_buffer	= 32;
	
	var start_x		= g_width /2	
	var start_y		= (g_height/2) - ((((ds_height-1)/2) * y_buffer))
	
	
// Background
	draw_rectangle_color(0, 0, g_width, g_height, color, color, color, color, false);
	
// Draw left side
	draw_set_valign(fa_middle);
	draw_set_halign(fa_right);
	
	var ltx			= start_x - x_buffer; // Left x
	var lty			= 0;
	var x_offset	= 0;
	
	var yy	= 0; 
	repeat (ds_height) {
		lty = start_y + (yy * y_buffer);
		color = c_white;
		
		if ( yy = menu_option[page] ) {
			color = c_red;
			x_offset = -(x_buffer/2)
		}
		
		draw_text_color(ltx + x_offset,lty,ds_grid[# 0, yy], color, color, color, color,1);
		yy++;
	}
	
// Draw line
	draw_line(start_x,start_y, start_x, lty);
	
// Draw right side
	draw_set_halign(fa_left);
	var rtx = start_x + x_buffer; // Right x
	var rty = 0;
	
	yy = 0; repeat(ds_height) {
		
		rty = start_y + (yy * y_buffer);
		
		switch (ds_grid[# 1, yy]) {
			
			case menu_element_type.shift:
				var current_value	= ds_grid[# 3, yy];
				var current_array	= ds_grid[# 4, yy];
				color				= c_white;
				
				// Visuals for changing value in menu
				var left_shift		= "< ";
				var right_shift		= " >";
				
				// Stop drawing when there is no more option
				if (current_value == 0) {
					left_shift = "";	
				}
				if (current_value == array_length_1d(ds_grid[# 4, yy])-1) {
					right_shift = "";	
				}
				
				if (inputting and yy == menu_option[page]) {
					color = c_red;		
				}
				
				draw_text_color(rtx , rty,left_shift + current_array[current_value] + right_shift, color, color, color, color, 1);  
				
				break;
				
			case menu_element_type.slider:
				var line_length = 64;
				var current_value = ds_grid[# 3, yy];
				
				// Circle details
				var current_array	= ds_grid[# 4, yy]
				var circle_position = ((current_value - current_array[0]) / (current_array[1] - current_array[0]));
				var radius			= 4;
				color				= c_white;
				
				draw_line_width(rtx, rty, rtx + line_length, rty, 2);
				
				if (inputting and yy == menu_option[page]) {
					color = c_red;		
				}
				draw_circle_color(rtx + (circle_position * line_length) , rty, radius, color, color, false);
				draw_text_color(rtx + (line_length * 1.2), rty, string(floor(circle_position * 100)) + "%", color, color, color, color, 1); 
				break;
			
			case menu_element_type.toggle:
				var current_value	= ds_grid[# 3, yy];
				var color_on		= color;
				var color_off		= c_dkgray;
				color				= c_white;
				
				if (inputting and yy == menu_option[page]) {
					color = c_red;		
				}
				
				// Set visuel colors for on and off
				if (current_value == 0) {
					color_on = color;
					color_off = c_dkgray;
				} else {
					color_on = c_dkgray;
					color_off = color;	
				}
				
				draw_text_color(rtx, rty , "ON", color_on, color_on, color_on, color_on,1);
				draw_text_color(rtx + 32, rty , "OFF", color_off, color_off, color_off, color_off,1);
				
				break;
				
			case menu_element_type.input:
				var current_value	= ds_grid[# 3, yy];
				var string_value;
				
				// Name the keys
				switch ( current_value ) {
					case vk_up:
						string_value = "UP KEY"
						break;
					case vk_left:
						string_value = "LEFT KEY"
						break;
					case vk_right:
						string_value = "RIGHT KEY"
						break;
					case vk_down:
						string_value = "DOWN KEY"
						break;
					default:
						string_value = chr(current_value);
						break;
				}
				
				color				= c_white;
				if (inputting and yy == menu_option[page]) {
					color = c_red;		
				}
				draw_text_color(rtx, rty, string_value, color, color, color, color, 1);
				
				break
				
		}
		
		yy++;
	}


// Reset
	draw_set_valign(fa_top);
	
