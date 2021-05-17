var p_num = ds_map_find_value(global.net_data_map,"p_num");
//set sender to ready
global.P_ready[p_num] = true;
//check if all ready
if scr_all_players_ready() scr_syscom_execute("endturn");
