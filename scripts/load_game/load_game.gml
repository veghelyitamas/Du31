// Load game
function load_game(){

if (file_exists("savedgame.sav")) {
	var Wrapper = load_JSON_from_file("savedgame.sav");
	var List	= Wrapper[?"Root"];
	
	for (var i = 0; i < ds_list_size(List); i++) {
		var Map		= List[| i];
		//var Object	= Map[? "obj"];
		
		// Respawn adn reload saved DATA
		with (o_duel_manager) {
			DATA_KilledMonsters		= Map[? "KilledMonsters"];
			o_duel_manager.turn		= Map[? "Turn"];
			
			o_player.hp				= Map[? "PlayerHp"];
			o_player.max_hp			= Map[? "PlayerMaxhp"];
			o_player.mana			= Map[? "PlayerMana"];
			o_player.max_mana		= Map[? "PlayerMaxmana"];
			o_player.level			= Map[? "PlayerLevel"];
			o_player.experience		= Map[? "PlayerExp"];
			o_player.max_experience	= Map[? "PlayerMaxexp"];
	
		}
	}
	ds_map_destroy(Wrapper);
	show_debug_message("Game loaded.");

} else {
	show_debug_message("Unable to load the game.");	
}
}