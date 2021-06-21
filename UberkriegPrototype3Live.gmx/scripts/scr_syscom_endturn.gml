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

//send instructions to server if is active client player
if (global.net_mode = 2){
    if ( global.P_Turn.number = global.Local_Player){
        ds_map_clear(global.map_out);
        ds_map_add(global.map_out,"scr","net_c_endturn");
        ds_map_add(global.map_out,"p_num",global.Local_Player);
        scr_send(global.map_out,"host");
        }
    }

//destroy self if hot seat mode, in other words scriped called by a ayscom menu, otherwise will destroy masterControls 
if global.net_mode = 0 instance_destroy();
