/// @description Key bindings

#macro GameReset keyboard_check_pressed(ord("R"))
	
if GameReset {
	var question = get_string("Do you want to delete save files, and FULLY restart the game?","delete")
	if question == "delete" {
		file_delete("savedgame.sav");
		game_restart();
	} else {
		show_message("Type 'delete' to restart the game.")	
	}
}