var scr_map_out = argument0; // ds_map to send out
var scr_snd_to  = argument1; // "host" "all" "acting" "relay"

//convert map to JSON-string
var j_out =  json_encode(scr_map_out);
//add basic variables
//ds_map_add(j_out,"p_num",global.Local_Player); (might not work*
//store in buffer
var b_out = buffer_create( string_byte_length(j_out)+1 , buffer_fixed ,  1 );
//write j-string to buffer
buffer_write( b_out , buffer_string , j_out );

//rebuild client list (something is killing it for some reason)
ds_list_clear(global.client_list);
if global.conect_P[1] ds_list_add(global.client_list,1);
if global.conect_P[2] ds_list_add(global.client_list,2);
if global.conect_P[3] ds_list_add(global.client_list,3);
if global.conect_P[4] ds_list_add(global.client_list,4);

//sent to "host"

switch( scr_snd_to ){
    
    //send to host
    case "host" :
        network_send_packet( global.cSocket, b_out , buffer_get_size(b_out) );
        break;
    //send to all client players
    case "all"  : // send to all client players
        var i = 0
        for ( i = 0 ; i < ds_list_size(global.client_list) ; i++){
            network_send_packet(global.sSocket[ds_list_find_value( global.client_list,i)], b_out , buffer_get_size(b_out) );
            }
        break;
    // send only to acting player
    case "acting" :
            network_send_packet( global.sSocket[ global.P_Turn.number ], b_out , buffer_get_size(b_out) );
            break;
    //send to all client players
    case "relay"  : // send to off turn players
        vari = 0
        for ( i = 0 ; i < ds_list_size(global.client_list) ; i++){
            if (global.P_Turn.number != ds_list_find_value( global.client_list,i))  network_send_packet(global.sSocket[ds_list_find_value( global.client_list,i)], b_out , buffer_get_size(b_out) );
            }
        break;
    }
    
//clean up
buffer_delete( b_out );
ds_map_destroy( scr_map_out );
