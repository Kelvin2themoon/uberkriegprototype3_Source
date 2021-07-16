 //send global.net_unit_orders as acting client player
     if(global.net_mode = 2 and global.P_Turn.number = global.Local_Player){
        //store cursor position
        global.P_Turn.save_cursor_pos_x = destination.x;
        global.P_Turn.save_cursor_pos_y = destination.y;
        //relay orders through host
        scr_send(global.net_unit_orders,"host");
        }

