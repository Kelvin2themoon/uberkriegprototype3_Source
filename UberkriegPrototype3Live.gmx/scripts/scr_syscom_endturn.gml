//reactivate disrupted units


with global.P_Turn {
    save_cursor_pos_x = global.posX*24;
    save_cursor_pos_y = global.posY*24;
    save_view_pos_x =   view_xview[0];
    save_view_pos_y =   view_yview[0];
    }

global.autoTurn = false;


instance_create(0,0,obj_starting);
instance_deactivate_object(obj_battleCursor);
instance_deactivate_object(obj_miniwin);
instance_destroy();


