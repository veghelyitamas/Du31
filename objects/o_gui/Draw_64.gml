/// @description Insert description here
// You can write your code in this editor
// Draw hp bar and mana bar
// General
var gui_mid_x			= display_get_gui_width()/2;
var gui_mid_y			= display_get_gui_height()-200;

mouse_xx				= window_mouse_get_x();
mouse_yy				= window_mouse_get_y();

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



//--------------------------------------------------------------




// General
var gui_mid_x	= display_get_gui_width()/2;
var gui_mid_y	= display_get_gui_height()-200;

var col					= c_gray;
var alpha				= .3;
var border				= 2;
var button_width		= 45;
var button_height		= 45;

enum icon {Attack,Defense,Heal}

if instance_exists(o_player) {
	// Draw sprite
		// Player sprite
		player_position_x		= gui_mid_x - 96;
		player_position_y		= gui_mid_y - 144;
		var player_sprite		= s_outfit;
		
		draw_set_alpha(o_player.alpha);
		if (player_get_dmg_flash) {
			if (flesh_timer < flesh_cooldown) {
				flesh_timer ++;
				draw_sprite_ext(player_sprite,2,player_position_x,player_position_y,1,1,0,c_white,1);
			} else {
				draw_sprite_ext(player_sprite,0,player_position_x,player_position_y,1,1,0,c_red,1);
				flesh_timer = 0;
				player_get_dmg_flash = false;	
			}	
		} else {
			draw_sprite_ext(player_sprite,0,player_position_x,player_position_y,1,1,0,c_white,1);
		}
		

	// Draw icons
		// First spell
		var pos1_x	= 144; // 144, 96 , 48, 0 -48, -96, -144
		var text1	= "Attack";
		var sprite  = icon.Attack;
		#region First spell ( Attack )
		
		
		
		// Draw and function
		if (mouse_xx > gui_mid_x-(button_width/2)-pos1_x && mouse_xx < gui_mid_x+(button_width/2)-pos1_x) {
			if (mouse_yy > gui_mid_y-(button_height/2) && mouse_yy < gui_mid_y+(button_height/2)) {
				if (o_duel_manager.turn == duel_state.wait) {
					if (AUTO_DUEL)  {
						draw_set_alpha(1);
						draw_set_color(c_white);
						draw_roundrect(gui_mid_x-(button_width/2)-pos1_x-border,gui_mid_y-(button_height/2)-border,gui_mid_x+(button_width/2)-pos1_x+border,gui_mid_y+(button_height/2)+border,false);
							with (o_player) {
								spell = sprite;	
							}
							with (o_duel_manager) {
							turn = duel_state.player;
							delay = DELAYTIME;
						}
				
					}
				}
				draw_set_color(col);
				draw_set_alpha(alpha);
				draw_roundrect(gui_mid_x-(button_width/2)-pos1_x-border,gui_mid_y-(button_height/2)-border,gui_mid_x+(button_width/2)-pos1_x+border,gui_mid_y+(button_height/2)+border,false);
				draw_set_color(c_white);
				draw_set_alpha(1);
				draw_roundrect(gui_mid_x-(button_width/2)-pos1_x-border,gui_mid_y-(button_height/2)-border,gui_mid_x+(button_width/2)-pos1_x+border,gui_mid_y+(button_height/2)+border,true);
				draw_set_halign(fa_center);
				draw_set_halign(fa_middle);
				draw_text(gui_mid_x-pos1_x,(gui_mid_y) + 32,text1);
				draw_set_halign(fa_left);
				draw_set_halign(fa_top);
				draw_sprite_ext(s_icon_spell,sprite,gui_mid_x-(button_width/2)-pos1_x,gui_mid_y-(button_height/2),1,1,0,c_white,1);
		
			} else {draw_roundrect(gui_mid_x-(button_width/2)-pos1_x,gui_mid_y-(button_height/2),gui_mid_x+(button_width/2)-pos1_x,gui_mid_y+(button_height/2),true);	
					draw_sprite_ext(s_icon_spell,sprite,gui_mid_x-(button_width/2)-pos1_x,gui_mid_y-(button_height/2),1,1,0,c_white,alpha);}
		} else {draw_roundrect(gui_mid_x-(button_width/2)-pos1_x,gui_mid_y-(button_height/2),gui_mid_x+(button_width/2)-pos1_x,gui_mid_y+(button_height/2),true);	
					draw_sprite_ext(s_icon_spell,sprite,gui_mid_x-(button_width/2)-pos1_x,gui_mid_y-(button_height/2),1,1,0,c_white,alpha);}
		#endregion

		// Second spell
		var pos1_x		= 96; // 144, 96 , 48, 0 -48, -96, -144
		var text1		= "Defense";
		var sprite		= icon.Defense;
		#region Second spell ( Defense )

		// Draw and function
		if (mouse_xx > gui_mid_x-(button_width/2)-pos1_x && mouse_xx < gui_mid_x+(button_width/2)-pos1_x) {
			if (mouse_yy > gui_mid_y-(button_height/2) && mouse_yy < gui_mid_y+(button_height/2)) {
				if (o_duel_manager.turn == duel_state.wait) {
					if (mouse_check_button_pressed(mb_left)) {
						draw_set_alpha(1);
						draw_set_color(c_white);
						draw_roundrect(gui_mid_x-(button_width/2)-pos1_x-border,gui_mid_y-(button_height/2)-border,gui_mid_x+(button_width/2)-pos1_x+border,gui_mid_y+(button_height/2)+border,false);
							with (o_player) {
								spell = sprite;	
							}
							with (o_duel_manager) {
							turn = duel_state.player;
							delay = DELAYTIME;
						}
				
					}
				}
				draw_set_color(col);
				draw_set_alpha(alpha);
				draw_roundrect(gui_mid_x-(button_width/2)-pos1_x-border,gui_mid_y-(button_height/2)-border,gui_mid_x+(button_width/2)-pos1_x+border,gui_mid_y+(button_height/2)+border,false);
				draw_set_color(c_white);
				draw_set_alpha(1);
				draw_roundrect(gui_mid_x-(button_width/2)-pos1_x-border,gui_mid_y-(button_height/2)-border,gui_mid_x+(button_width/2)-pos1_x+border,gui_mid_y+(button_height/2)+border,true);
				draw_set_halign(fa_center);
				draw_set_halign(fa_middle);
				draw_text(gui_mid_x-pos1_x,(gui_mid_y) + 32,text1);
				draw_set_halign(fa_left);
				draw_set_halign(fa_top);
				draw_sprite_ext(s_icon_spell,sprite,gui_mid_x-(button_width/2)-pos1_x,gui_mid_y-(button_height/2),1,1,0,c_white,1);
		
			} else {draw_roundrect(gui_mid_x-(button_width/2)-pos1_x,gui_mid_y-(button_height/2),gui_mid_x+(button_width/2)-pos1_x,gui_mid_y+(button_height/2),true);	
					draw_sprite_ext(s_icon_spell,sprite,gui_mid_x-(button_width/2)-pos1_x,gui_mid_y-(button_height/2),1,1,0,c_white,alpha);}
		} else {draw_roundrect(gui_mid_x-(button_width/2)-pos1_x,gui_mid_y-(button_height/2),gui_mid_x+(button_width/2)-pos1_x,gui_mid_y+(button_height/2),true);	
					draw_sprite_ext(s_icon_spell,sprite,gui_mid_x-(button_width/2)-pos1_x,gui_mid_y-(button_height/2),1,1,0,c_white,alpha);}
		#endregion

		// Third spell
		var pos1_x		= 48; // 144, 96 , 48, 0 -48, -96, -144
		var text1		= "Heal";
		var sprite		= icon.Heal;
		var mana_cost	= 20;
		#region Third spell ( Heal )

		// Draw and function
		if (mouse_xx > gui_mid_x-(button_width/2)-pos1_x && mouse_xx < gui_mid_x+(button_width/2)-pos1_x) {
			if (mouse_yy > gui_mid_y-(button_height/2) && mouse_yy < gui_mid_y+(button_height/2)) {
				if (o_player.mana >= mana_cost) {
					if (o_duel_manager.turn == duel_state.wait) {
						if (mouse_check_button_pressed(mb_left)) {
							draw_set_alpha(1);
							draw_set_color(c_white);
							draw_roundrect(gui_mid_x-(button_width/2)-pos1_x-border,gui_mid_y-(button_height/2)-border,gui_mid_x+(button_width/2)-pos1_x+border,gui_mid_y+(button_height/2)+border,false);
								with (o_player) {
									mana -= mana_cost;
									spell = sprite;	
								}
								with (o_duel_manager) {
								turn = duel_state.player;
								delay = DELAYTIME;
							}
				
						}
					}
					draw_set_color(col);
					draw_set_alpha(alpha);
					draw_roundrect(gui_mid_x-(button_width/2)-pos1_x-border,gui_mid_y-(button_height/2)-border,gui_mid_x+(button_width/2)-pos1_x+border,gui_mid_y+(button_height/2)+border,false);
					draw_set_color(c_white);
					draw_set_alpha(1);
					draw_roundrect(gui_mid_x-(button_width/2)-pos1_x-border,gui_mid_y-(button_height/2)-border,gui_mid_x+(button_width/2)-pos1_x+border,gui_mid_y+(button_height/2)+border,true);
					draw_set_halign(fa_center);
					draw_set_halign(fa_middle);
					draw_text(gui_mid_x-pos1_x,(gui_mid_y) + 32,text1);
					draw_set_halign(fa_left);
					draw_set_halign(fa_top);
					draw_sprite_ext(s_icon_spell,sprite,gui_mid_x-(button_width/2)-pos1_x,gui_mid_y-(button_height/2),1,1,0,c_white,1);
					draw_set_alpha(1);
				} else {
					draw_set_color(col);
					draw_set_alpha(.3);
					draw_roundrect(gui_mid_x-(button_width/2)-pos1_x-border,gui_mid_y-(button_height/2)-border,gui_mid_x+(button_width/2)-pos1_x+border,gui_mid_y+(button_height/2)+border,false);
					draw_set_color(c_white);
					draw_set_alpha(.3);
					draw_roundrect(gui_mid_x-(button_width/2)-pos1_x-border,gui_mid_y-(button_height/2)-border,gui_mid_x+(button_width/2)-pos1_x+border,gui_mid_y+(button_height/2)+border,true);
					draw_set_halign(fa_center);
					draw_set_halign(fa_middle);
					draw_text(gui_mid_x-pos1_x,(gui_mid_y) + 32,"Not enough mana.");
					draw_set_halign(fa_left);
					draw_set_halign(fa_top);
					draw_sprite_ext(s_icon_spell,sprite,gui_mid_x-(button_width/2)-pos1_x,gui_mid_y-(button_height/2),1,1,0,c_white,.3);
					draw_set_alpha(1);
				}
		
			} else {draw_roundrect(gui_mid_x-(button_width/2)-pos1_x,gui_mid_y-(button_height/2),gui_mid_x+(button_width/2)-pos1_x,gui_mid_y+(button_height/2),true);	
					draw_sprite_ext(s_icon_spell,sprite,gui_mid_x-(button_width/2)-pos1_x,gui_mid_y-(button_height/2),1,1,0,c_white,alpha);}
		} else {draw_roundrect(gui_mid_x-(button_width/2)-pos1_x,gui_mid_y-(button_height/2),gui_mid_x+(button_width/2)-pos1_x,gui_mid_y+(button_height/2),true);	
					draw_sprite_ext(s_icon_spell,sprite,gui_mid_x-(button_width/2)-pos1_x,gui_mid_y-(button_height/2),1,1,0,c_white,alpha);}
		#endregion
		
		draw_set_alpha(1);
}

	// Opponent sprite
	opponent_position_x		= gui_mid_x + 240;
	opponent_position_y		= gui_mid_y - 144;
	var player_sprite		= s_outfit;

	if (opponent_get_dmg_flash) {
			if (flesh_timer < flesh_cooldown) {
				flesh_timer ++;
				draw_sprite_ext(player_sprite,3,opponent_position_x,opponent_position_y,1,1,0,c_white,1);
			} else {
				draw_sprite_ext(player_sprite,1,opponent_position_x,opponent_position_y,1,1,0,c_red,1);
				flesh_timer = 0;
				opponent_get_dmg_flash = false;	
			}	
		} else {
			draw_sprite_ext(player_sprite,1,opponent_position_x,opponent_position_y,1,1,0,c_white,1);
		}



		// DATA
		draw_text(8,8,DATA_KilledMonsters);







