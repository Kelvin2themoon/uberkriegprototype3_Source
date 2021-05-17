file_name = argument0

switch (global.net_mode){
    
    //regular hot seat mode
    case 0 :
    scr_syscom_endturn();
    break;
    
    //netmode server
    ini_open(file_name);
    global.sender = ini_read_real("meta","sender",0);
    ini_close();
    
    case 1:
    
    ini_open(file_name);
    var send_p = ini_read_real("meta","sender",0);
    ini_close()
    
    file_copy(file_name,"outgoing.snd");
    b_buffer = buffer_load("outgoing.snd");
    
    //sent to all clients
     var i = 0;
        for ( i = 0 ; i < ds_list_size(global.client_list)  ; i++ ){
            var c_num = ds_list_find_value(global.client_list,i);
            if c_num != send_p // do not send repeat to last player
            network_send_packet(global.sSocket[c_num], b_buffer,buffer_get_size(b_buffer));
            }
    buffer_delete(b_buffer);
    scr_syscom_endturn();
    break;
    
    //netmode client player
    case 2 :
    //reactivate disrupted units
with global.P_Turn {
    save_cursor_pos_x = global.posX*24;
    save_cursor_pos_y = global.posY*24;
    save_view_pos_x =   view_xview[0];
    save_view_pos_y =   view_yview[0];
    }
    //resolve and such
    instance_create(0,0,obj_starting);
    instance_deactivate_object(obj_battleCursor);
    instance_deactivate_object(obj_miniwin);
    scr_quick_save("quicksave.ubq");
    break;
    }
    

   


    
    




