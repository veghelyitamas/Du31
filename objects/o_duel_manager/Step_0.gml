/// @description Duel state

var player		= o_player;
var opponent	= o_opponent;

var ready_player	= instance_exists(player);
var ready_opponent	= instance_exists(opponent);

if ( ready_player && ready_opponent ) {
	switch (turn) {
		case duel_state.wait:
				if (delay > 0) { delay --;} else {	
					delay = DELAYTIME;
				}	
			break;		
		case duel_state.player:
		if (delay > 0) { delay --;} else 
			if (opponent.hp >= 0 + player.dmg) {
					switch (o_player.spell) {
						case icon.Attack:
							opponent.hp -= player.dmg ;
							audio_play_sound(snd_attack,1,false);
							scr_drawdmg(o_gui.opponent_position_x,o_gui.opponent_position_y-48,player.dmg);
							turn = duel_state.opponent;
							o_duel_manager.delay = DELAYTIME;
							opponent.dmg = scr_get_dmg();
							o_gui.opponent_get_dmg_flash = true;
							break;
							
						case icon.Defense:
							turn = duel_state.opponent;
							o_duel_manager.delay = DELAYTIME;
							break;
							
						case icon.Heal:
							player.hp += irandom_range(100,200);
							audio_play_sound(snd_heal,1,false);
							turn = duel_state.opponent;
							o_duel_manager.delay = DELAYTIME;
								if (player.hp >= player.max_hp) {
									player.hp = player.max_hp;	
								}
							break;
					}
					
			} else {
				// Death of opponent
				opponent.hp -= player.dmg;
				player.experience += irandom_range(50,100);
				turn = duel_state.wait;
				DATA_KilledMonsters ++;
				
				#region Save game
				/// @description Save gate
				// Creat a root list
				var root_list = ds_list_create();

				with (o_duel_manager) {
					var map	= ds_map_create();
	
					ds_list_add(root_list,map);
					ds_list_mark_as_map(root_list,ds_list_size(root_list)-1);
	
					var object = object_get_name(object_index);
					ds_map_add(map, "obj", object);
					ds_map_add(map, "KilledMonsters", DATA_KilledMonsters);
					ds_map_add(map, "Turn", turn);
					ds_map_add(map, "PlayerHp", o_player.hp);
					ds_map_add(map, "PlayerMaxhp", o_player.max_hp);
					ds_map_add(map, "PlayerMana", o_player.mana);
					ds_map_add(map, "PlayerMaxmana", o_player.max_mana);
					ds_map_add(map, "PlayerLevel", o_player.level);
					ds_map_add(map, "PlayerExp", o_player.experience);
					ds_map_add(map, "PlayerMaxexp", o_player.max_experience);
	
				}
				// Convert list -> map
				var WrapTheList = ds_map_create();
				ds_map_add_list(WrapTheList,"Root",root_list);

				// Convert map -> string
				var string_of_text = json_encode(WrapTheList);
				save_to_file("savedgame.sav", string_of_text);

				// Nuke data
				ds_map_destroy(WrapTheList);
				#endregion
				if (opponent.hp <= 0) {
					instance_destroy(opponent);
					// Respawn
					var opponent = instance_create_layer(Opponent_x,Opponent_y,"Enemies",o_opponent);	
				}
					
			}
			return;
		case duel_state.opponent:
		if (delay > 0) { delay --;} else 
			if (player.hp > 0 + opponent.dmg) {
					player.hp -= opponent.dmg;
					scr_drawdmg(o_gui.player_position_x,o_gui.player_position_y-48,opponent.dmg);
					turn = duel_state.wait;
					o_duel_manager.delay = DELAYTIME;
					player.dmg = scr_get_dmg();
					o_player.spell = noone;
					o_gui.player_get_dmg_flash = true;
			} else {
					instance_destroy(player);
					// Respawn
					var player = instance_create_layer(Player_x,Player_y,"Player",o_player);
			}
			return;
	}
	
}
