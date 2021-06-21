// notify host that specific client is ready for new turn
var n = ds_map_find_value( global.net_data_map , "p_num" )
global.last_network_event = "player ready" + string( n );

//player ready
global.P_ready[n] = true;

//when all players ready, notify acting player client to initiate cursor controls
if scr_all_players_ready(){
    ds_map_clear(global.map_out);
    ds_map_add(global.map_out,"scr","net_start_controls");
    scr_send(global.map_out,"acting");
    scr_clear_player_ready();
    }

 

