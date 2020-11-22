/// @description Save gate
function save_game(){
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

}