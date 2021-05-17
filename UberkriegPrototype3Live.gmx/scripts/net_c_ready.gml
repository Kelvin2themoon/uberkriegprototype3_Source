// clients are ready
var n = ds_map_find_value( global.net_data_map , "p_num" )

global.last_network_event = "player ready" + string( n );
//pleayer ready
global.player_name[n] = "P" + string(n)+" Ready";
global.P_ready[n] = true; 

if scr_all_players_ready() room_goto(rm_game_Basic);

/*
// check if all players are ready
var i = 1;
var players_ready = 0 ;

for ( i = 1 ; i < 5 ; i++ ){
    if (global.P_ready[i] = true) players_ready++
    }
    
global.last_network_event = string(players_ready)+" players ready";
// if all players ready, start gmne
if (players_ready = global.number_of_players) room_goto(rm_game_Basic);
 
     
