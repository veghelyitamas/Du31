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
