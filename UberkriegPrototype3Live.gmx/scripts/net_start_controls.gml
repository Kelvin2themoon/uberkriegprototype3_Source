//initiate controls - create/activate cursor object and intel windows


if (global.Local_Player = global.P_Turn.number){
    //activate battle cursor (player controls)    
    instance_activate_object(obj_battleCursor);
    //activate HUD
    instance_activate_object(obj_miniwin);
    }

//change cursor position
with obj_battleCursor{
    x = global.P_Turn.save_cursor_pos_x;
    y = global.P_Turn.save_cursor_pos_y;
    }
