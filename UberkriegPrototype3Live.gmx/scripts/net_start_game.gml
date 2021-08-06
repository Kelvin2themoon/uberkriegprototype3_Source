global.last_network_event = "START!!" ;

//set COs
global.P1_CO = ds_map_find_value(global.net_data_map,"P1CO");
global.P2_CO = ds_map_find_value(global.net_data_map,"P2CO");
global.P3_CO = ds_map_find_value(global.net_data_map,"P3CO");
global.P4_CO = ds_map_find_value(global.net_data_map,"P4CO");
//unpack map
scr_save_ds_map_to_ini(global.net_data_map,"netland_P"+string(global.Local_Player)+".ubm");
room_goto(rm_game_Basic);
