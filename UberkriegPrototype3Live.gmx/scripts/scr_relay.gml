//called from client sent script during a host network event
//send active buffer to all non active client players and wait for sync
//var r_string = global.relay_string;

if global.net_mode = 1{
    var b_relay = buffer_create( string_byte_length( global.relay_string)+1 , buffer_fixed , 1 );
    buffer_write(b_relay,buffer_string,global.relay_string);
    var i=1
    for ( i = 0 ; i < ds_list_size(global.client_list) ; i++){
        if (global.P_Turn.number != ds_list_find_value( global.client_list,i)){  
            network_send_packet(global.sSocket[ds_list_find_value( global.client_list,i)], b_relay , buffer_get_size(b_relay) );
            }
        }
    buffer_delete(b_relay);
    }


//clear p-ready, set current player as ready
scr_clear_player_ready();
global.P_ready[global.P_Turn.number] = true;

