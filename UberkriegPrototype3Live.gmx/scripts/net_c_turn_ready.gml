// notify host that specific client is ready for new turn
var n = ds_map_find_value( global.net_data_map , "p_num" )
global.last_network_event = "player ready" + string( n );

//player ready
global.P_ready[n] = true;

//whe all players ready, notify acting player client to initiate cursor controls
if scr_all_players_ready(){
    var start_controls = ds_map_create();
    ds_map_add(start_controls,"scr","net_start_controls");
    scr_send(start_controls,"acting");
    scr_clear_player_ready();
    }

 

