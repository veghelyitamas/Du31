// Draw hp bar and mana bar
// General
var gui_mid_x			= display_get_gui_width()/2;
var gui_mid_y			= display_get_gui_height()-200;

var bar_width			= 144;
var bar_height			= 12;
var bar_x				= gui_mid_x - 165;
var bar_y				= gui_mid_y - 61;

var bar_color			= c_red;

if instance_exists(o_player) {
	
	draw_set_color(c_white);
	draw_set_circle_precision(64)
	draw_rectangle(bar_x - 27,bar_y-1,bar_x -24 + 22, bar_y + 26,true);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle)
	draw_text(bar_x-14,bar_y+12,o_player.level);
	
	var hp		= (o_player.hp / o_player.max_hp) * bar_width;
	var max_hp	= (o_player.max_hp / o_player.max_hp) * bar_width;
	
	draw_set_color(bar_color);
	draw_rectangle(bar_x,bar_y,bar_x + hp, bar_y + bar_height,false);
	draw_set_color(c_white);
	draw_rectangle(bar_x,bar_y,bar_x + max_hp, bar_y + bar_height,true);
	
	var mana		= (o_player.mana / o_player.max_mana) * bar_width;
	var max_mana	= (o_player.max_mana / o_player.max_mana) * bar_width;

	bar_x			= gui_mid_x - 165;
	bar_y			= gui_mid_y - 59 + bar_height;
	bar_height		= 5;
	bar_color		= c_blue;
	
	draw_set_color(bar_color);
	draw_rectangle(bar_x,bar_y,bar_x + mana, bar_y + bar_height,false);
	draw_set_color(c_white);
	draw_rectangle(bar_x,bar_y,bar_x + max_mana, bar_y + bar_height,true);
	
	var ex		= (o_player.experience / o_player.max_experience) * bar_width;
	var max_exp	= (o_player.max_experience / o_player.max_experience) * bar_width;

	bar_x			= gui_mid_x - 165;
	bar_y			= gui_mid_y - 44 + bar_height;
	bar_height		= 3;
	bar_color		= c_white;
	
	draw_set_color(bar_color);
	draw_rectangle(bar_x,bar_y,bar_x + ex, bar_y + bar_height,false);
	draw_set_color(c_white);
	draw_rectangle(bar_x,bar_y,bar_x + max_exp, bar_y + bar_height,true);
	
	draw_set_color(c_white);
}


var bar_width			= 144;
var bar_height			= 12;
var opp_bar_x				= gui_mid_x + 165;
var opp_bar_y				= gui_mid_y - 61;

var opp_bar_color			= c_red;

if instance_exists(o_opponent) {

		var opp_hp		= (o_opponent.hp / o_opponent.max_hp) * bar_width;
		var opp_max_hp	= (o_opponent.max_hp / o_opponent.max_hp) * bar_width;
		
		draw_set_alpha(o_opponent.alpha);
		draw_set_color(opp_bar_color);
		draw_rectangle(opp_bar_x,opp_bar_y,opp_bar_x + opp_hp, opp_bar_y + bar_height,false);
		draw_set_color(c_white);
		draw_rectangle(opp_bar_x,opp_bar_y,opp_bar_x + opp_max_hp, opp_bar_y + bar_height,true);
		draw_set_color(c_white);
		draw_set_alpha(1);
}


