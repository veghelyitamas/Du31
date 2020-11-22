/// @description Init


globalvar DELAYTIME;DELAYTIME = 5;//30

globalvar Opponent_x;	Opponent_x		= display_get_gui_width()/2 +200;
globalvar Opponent_y;	Opponent_y		= display_get_gui_height()/2;
globalvar Player_x;		Player_x		= display_get_gui_width()/2 -200;
globalvar Player_y;		Player_y		= display_get_gui_height()/2;

instance_create_layer(Player_x,Player_y,"Player",o_player);
instance_create_layer(Opponent_x,Opponent_y,"Enemies",o_opponent);


enum duel_state { player, opponent, wait }

turn = duel_state.wait;

delay = DELAYTIME;

globalvar AUTO_DUEL;AUTO_DUEL = true;

// Get DATA 
	globalvar DATA_KilledMonsters; DATA_KilledMonsters = 0;
