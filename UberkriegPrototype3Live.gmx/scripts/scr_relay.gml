//called from client sent script during a host network event
//send active buffer to all non active client players and wait for sync
//loop ends with host instructiong active player client to restart controls

if global.net_mode = 1{
    var b_relay = ds_map_find_value(async_load,"buffer");
    
    var i=1
    for ( i = 0 ; i < ds_list_size(global.client_list) ; i++){
        if (global.P_Turn.number != ds_list_find_value( global.client_list,i)){  
            network_send_packet(global.sSocket[ds_list_find_value( global.client_list,i)], b_relay , buffer_get_size(b_relay) );
            }
        }
    }

//clear p-ready, set current player as ready
scr_clear_player_ready();
global.P_ready[global.P_Turn.number] = true;

