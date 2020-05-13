
argument0 = scr_buffer;
var i = 0;
for ( i = 0 ; i < ds_list_size(global.client_list)  ; i++ ){
    network_send_packet(global.sSocket[ ds_list_find_value(global.client_list,i) ], scr_buffer,buffer_get_size(scr_buffer));
    }
    buffer_delete(scr_buffer); 
